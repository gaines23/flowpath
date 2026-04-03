import django.db.models.deletion
from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ("briefs", "0005_deltalayer_scope_creep"),
    ]

    operations = [
        migrations.CreateModel(
            name="ProjectUpdate",
            fields=[
                ("id", models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ("content", models.TextField(blank=True)),
                ("attachments", models.JSONField(default=list)),
                ("created_at", models.DateTimeField()),
                ("order", models.PositiveSmallIntegerField(default=0)),
                (
                    "case_file",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="project_updates",
                        to="briefs.casefile",
                    ),
                ),
            ],
            options={
                "db_table": "project_updates",
                "ordering": ["-created_at"],
            },
        ),
    ]
