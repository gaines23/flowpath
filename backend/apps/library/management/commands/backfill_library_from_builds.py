"""
Idempotent backfill: walk every CaseFile.build and create LibraryItem rows
for each workflow (template), each list's custom_fields (custom_field_set),
and each list's automations (automation).

Provenance (source_case_file, source_layer, source_path) is set so the same
fragment is recognised on re-runs and skipped.

Attribution: items are created_by the project's logged_by user (and pinned to
that user's team). If a project has no logged_by, the item falls through to
the Default Team with created_by=null.

Usage:
    python manage.py backfill_library_from_builds [--dry-run]
"""

from django.core.management.base import BaseCommand
from django.db import transaction

from apps.briefs.models import CaseFile
from apps.library.models import LibraryItem, LibraryItemKind, LibrarySourceLayer
from apps.users.models import Team


def _serialize_automations(automations):
    """Render a list-of-automations payload as a readable text block."""
    if not isinstance(automations, list) or not automations:
        return ""
    chunks = []
    for i, a in enumerate(automations):
        if not isinstance(a, dict):
            continue
        platform = a.get("platform") or "clickup"
        mode = ", standalone" if a.get("automation_mode") == "standalone" else ""
        header = f"Automation {i + 1} ({platform}{mode})"
        triggers = a.get("triggers") or []
        actions = a.get("actions") or []
        instructions = a.get("instructions") or ""
        lines = [header]
        if triggers:
            lines.append(
                "Triggers: "
                + "; ".join(
                    " — ".join(p for p in [t.get("type"), t.get("detail")] if p)
                    for t in triggers if isinstance(t, dict)
                )
            )
        if actions:
            lines.append(
                "Actions: "
                + "; ".join(
                    " — ".join(p for p in [t.get("type"), t.get("detail")] if p)
                    for t in actions if isinstance(t, dict)
                )
            )
        if instructions:
            lines.append("Instructions:\n" + instructions)
        chunks.append("\n".join(lines))
    return "\n\n".join(chunks)


def _workflow_steps(workflow):
    lists = workflow.get("lists") or []
    out = []
    for idx, l in enumerate(lists, start=1):
        name = (l.get("name") or "List").strip()
        statuses = (l.get("statuses") or "").strip()
        suffix = f" — statuses: {statuses}" if statuses else ""
        out.append(f"{idx}. {name}{suffix}")
    return "\n".join(out)


class Command(BaseCommand):
    help = "Backfill LibraryItem rows from existing CaseFile build content."

    def add_arguments(self, parser):
        parser.add_argument(
            "--dry-run",
            action="store_true",
            help="Report what would be created without writing to the database.",
        )
        parser.add_argument(
            "--case-file",
            type=str,
            default=None,
            help="Limit to a single case file id (UUID).",
        )

    def handle(self, *args, dry_run=False, case_file=None, **options):
        default_team = Team.objects.filter(slug="default").first()
        if default_team is None:
            default_team, _ = Team.objects.get_or_create(
                slug="default", defaults={"name": "Default Team"}
            )

        qs = CaseFile.objects.select_related("build", "logged_by", "logged_by__team")
        if case_file:
            qs = qs.filter(id=case_file)

        created = 0
        skipped = 0
        scanned = 0

        for cf in qs.iterator():
            build = getattr(cf, "build", None)
            if build is None:
                continue
            scanned += 1

            owner = cf.logged_by
            team = (owner.team if owner and owner.team_id else None) or default_team
            base_tags = [t for t in [cf.workflow_type] + list(cf.industries or []) if t]

            workflows = build.workflows if isinstance(build.workflows, list) else []
            for wi, wf in enumerate(workflows):
                if not isinstance(wf, dict):
                    continue
                wf_name = (wf.get("name") or f"Workflow {wi + 1}").strip()

                # 1. Workflow → template
                created_t, did_create = self._upsert(
                    case_file=cf, owner=owner, team=team, dry_run=dry_run,
                    kind=LibraryItemKind.TEMPLATE,
                    source_layer=LibrarySourceLayer.BUILD_WORKFLOWS,
                    source_path=f"build.workflows[{wi}]",
                    name=f"{wf_name} — Template",
                    description=(wf.get("notes") or "")[:1000],
                    body={
                        "summary": wf.get("notes") or "",
                        "steps": _workflow_steps(wf),
                    },
                    tags=base_tags + [wf_name] if wf_name else base_tags,
                )
                created += int(did_create)
                skipped += int(not did_create)

                # 2 & 3. Per-list custom fields and automations
                lists = wf.get("lists") or []
                for li, l in enumerate(lists):
                    if not isinstance(l, dict):
                        continue
                    list_name = (l.get("name") or f"List {li + 1}").strip()
                    item_tags = base_tags + [t for t in [wf_name, list_name] if t]

                    cf_text = (l.get("custom_fields") or "").strip()
                    if cf_text:
                        _, did_create = self._upsert(
                            case_file=cf, owner=owner, team=team, dry_run=dry_run,
                            kind=LibraryItemKind.CUSTOM_FIELD_SET,
                            source_layer=LibrarySourceLayer.BUILD_CUSTOM_FIELDS,
                            source_path=f"build.workflows[{wi}].lists[{li}].custom_fields",
                            name=f"{list_name} — Custom Fields",
                            description="",
                            body={"fields_text": cf_text},
                            tags=item_tags,
                        )
                        created += int(did_create)
                        skipped += int(not did_create)

                    automations = l.get("automations")
                    auto_text = _serialize_automations(automations)
                    if auto_text:
                        _, did_create = self._upsert(
                            case_file=cf, owner=owner, team=team, dry_run=dry_run,
                            kind=LibraryItemKind.AUTOMATION,
                            source_layer=LibrarySourceLayer.BUILD_AUTOMATIONS,
                            source_path=f"build.workflows[{wi}].lists[{li}].automations",
                            name=f"{list_name} — Automations",
                            description="",
                            body={"notes": auto_text},
                            tags=item_tags,
                        )
                        created += int(did_create)
                        skipped += int(not did_create)

        self.stdout.write(self.style.SUCCESS(
            f"Scanned {scanned} case files. "
            f"Created {created} library items. Skipped {skipped} existing."
            + (" (dry run — no writes)" if dry_run else "")
        ))

    @transaction.atomic
    def _upsert(self, *, case_file, owner, team, dry_run,
                kind, source_layer, source_path,
                name, description, body, tags):
        """Return (item_or_none, did_create_bool). Idempotent on (source_case_file, source_path)."""
        existing = LibraryItem.objects.filter(
            source_case_file=case_file,
            source_path=source_path,
        ).first()
        if existing is not None:
            return existing, False
        if dry_run:
            return None, True
        item = LibraryItem.objects.create(
            team=team,
            kind=kind,
            name=name[:255],
            description=description or "",
            body=body or {},
            tags=tags or [],
            industries=list(case_file.industries or []),
            tools=list(case_file.tools or []),
            workflow_types=[case_file.workflow_type] if case_file.workflow_type else [],
            source_case_file=case_file,
            source_layer=source_layer,
            source_path=source_path,
            created_by=owner,
            updated_by=owner,
        )
        return item, True
