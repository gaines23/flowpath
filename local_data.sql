--
-- PostgreSQL database dump
--

\restrict QYF3RjIxCQBFddlL6p3aeJihCeB0J2UsftLM39cokMcfOvlJzu7gV4YBVJCdMei

-- Dumped from database version 16.13 (Debian 16.13-1.pgdg12+1)
-- Dumped by pg_dump version 16.13 (Debian 16.13-1.pgdg12+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (password, last_login, is_superuser, id, email, first_name, last_name, role, is_active, is_staff, created_at, updated_at) FROM stdin;
pbkdf2_sha256$720000$tqEjXJ2Jgd7jDTAJC97bMh$gU9ua7gpuamWU0BZdtRRr2gKrbNe8YRvtST1RMNcBjs=	2026-04-01 22:59:22.758373+00	t	9c72e123-7304-4970-82b4-218d37868041	gaines.melissa23@gmail.com	Melissa		engineer	t	t	2026-04-01 21:16:25.337697+00	2026-04-01 23:07:13.879376+00
\.


--
-- Data for Name: case_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.case_files (id, logged_by_id, logged_by_name, created_at, updated_at, industries, tools, process_frameworks, workflow_type, team_size, satisfaction_score, roadblock_count, built_outcome, name, share_token, share_enabled, status, closed_at) FROM stdin;
25a7e1aa-1eeb-4eb4-9f16-1af929fd630c	9c72e123-7304-4970-82b4-218d37868041	Melissa	2026-04-02 06:58:03.361976+00	2026-04-02 07:11:06.157465+00	["Property Management", "Facilities Management"]	["SmartSheet"]	["KPIs", "Phase Gate", "Program Delivery", "Sales Pipeline", "Client Onboarding", "Milestones & Deliverables"]	Client Project Management	20	3	1		ABM	7343c3a4-4081-4b26-b2d6-3151233f44f7	f	open	\N
3d84b64a-0abf-418e-a05f-09a1f66e3dbf	9c72e123-7304-4970-82b4-218d37868041	Melissa	2026-04-02 06:44:39.545443+00	2026-04-03 18:41:52.207827+00	["Business Coaching", "Corporate Training", "Event Management"]	["HubSpot"]	["Program Delivery", "Milestones & Deliverables", "Cohort Management"]	Project Management	1	4	2	yes	ASLAN	6276a262-7265-46a5-ac98-551115587eb7	f	open	\N
aacf7704-05bf-4a95-966b-4668eddc58b0	9c72e123-7304-4970-82b4-218d37868041	Melissa	2026-04-02 08:12:39.373139+00	2026-04-03 20:39:53.342327+00	["Interior Design", "Event Management", "Facilities Management"]	["Slack", "Excel"]	["Program Delivery"]	Project Management	40	3	0		Theatre Projects	904a2693-1c9b-4916-a7e8-c221936c0e1c	t	open	\N
9be07149-127f-48d0-83d4-76229dca8952	9c72e123-7304-4970-82b4-218d37868041	Melissa	2026-04-03 06:24:42.321193+00	2026-04-03 06:24:42.321217+00	["Supply Chain / Logistics", "Field Services", "Manufacturing"]	["HubSpot"]	["Program Delivery"]	Client Project Management	10	3	1		Real Cold	00ac2840-cff8-457c-bd14-7254b67aaa90	f	open	\N
f79856ea-9172-4cbf-ae5d-46f52e506e1e	9c72e123-7304-4970-82b4-218d37868041	Melissa	2026-04-03 05:36:56.01858+00	2026-04-03 05:36:56.018592+00	["Non-profit Organization", "Foundation / Philanthropy", "Community Organization"]	["Excel", "Google Drive"]	["Program Delivery"]	Campaign Management	3	3	0		Kline Galland	f0474305-6946-41cc-a03b-c31aedf44364	f	open	\N
d6b0927a-1041-4662-a62f-3e35ffc4b256	9c72e123-7304-4970-82b4-218d37868041	Melissa	2026-04-03 05:22:21.621102+00	2026-04-03 05:25:31.844026+00	["Market Research Firm", "Research & Strategy", "Consumer Insights Agency"]	[]	["Phase Gate"]	Project Management	12	3	0		Jasper Colins	2d44f4b4-2c35-47ec-a7e3-5b73f0ceca40	f	open	\N
\.


--
-- Data for Name: audit_layers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.audit_layers (id, case_file_id, has_existing, overall_assessment, tried_to_fix, previous_fixes, pattern_summary) FROM stdin;
7f063e7d-5742-4a3d-8166-1c62ba4c8264	25a7e1aa-1eeb-4eb4-9f16-1af929fd630c	f		\N		
b6e47e55-6f0e-49ff-b69a-bd75f0c217d0	d6b0927a-1041-4662-a62f-3e35ffc4b256	f		\N		
44e8ab38-57ee-4f77-a14c-9f06a6c56641	f79856ea-9172-4cbf-ae5d-46f52e506e1e	f		\N		
dfb84cc7-aeb0-4d3b-ba92-98185a2d15a0	9be07149-127f-48d0-83d4-76229dca8952	f		\N		
c64b6919-a8a2-4e03-b3ba-dd9ed579d52e	3d84b64a-0abf-418e-a05f-09a1f66e3dbf	f		\N		
fb79a6c2-46b0-4205-8d85-7d68c58f8f1a	aacf7704-05bf-4a95-966b-4668eddc58b0	t	they have been using a combo of excel and slack to get work completed -- very wonky system	f		
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	workflows	workflowpattern
8	workflows	generatedbrief
9	briefs	casefile
10	briefs	auditlayer
11	briefs	currentbuild
12	briefs	intakelayer
13	briefs	buildlayer
14	briefs	deltalayer
15	briefs	roadblock
16	briefs	reasoninglayer
17	briefs	outcomelayer
18	briefs	projectupdate
19	users	invitation
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add workflow pattern	7	add_workflowpattern
26	Can change workflow pattern	7	change_workflowpattern
27	Can delete workflow pattern	7	delete_workflowpattern
28	Can view workflow pattern	7	view_workflowpattern
29	Can add generated brief	8	add_generatedbrief
30	Can change generated brief	8	change_generatedbrief
31	Can delete generated brief	8	delete_generatedbrief
32	Can view generated brief	8	view_generatedbrief
33	Can add case file	9	add_casefile
34	Can change case file	9	change_casefile
35	Can delete case file	9	delete_casefile
36	Can view case file	9	view_casefile
37	Can add audit layer	10	add_auditlayer
38	Can change audit layer	10	change_auditlayer
39	Can delete audit layer	10	delete_auditlayer
40	Can view audit layer	10	view_auditlayer
41	Can add current build	11	add_currentbuild
42	Can change current build	11	change_currentbuild
43	Can delete current build	11	delete_currentbuild
44	Can view current build	11	view_currentbuild
45	Can add intake layer	12	add_intakelayer
46	Can change intake layer	12	change_intakelayer
47	Can delete intake layer	12	delete_intakelayer
48	Can view intake layer	12	view_intakelayer
49	Can add build layer	13	add_buildlayer
50	Can change build layer	13	change_buildlayer
51	Can delete build layer	13	delete_buildlayer
52	Can view build layer	13	view_buildlayer
53	Can add delta layer	14	add_deltalayer
54	Can change delta layer	14	change_deltalayer
55	Can delete delta layer	14	delete_deltalayer
56	Can view delta layer	14	view_deltalayer
57	Can add roadblock	15	add_roadblock
58	Can change roadblock	15	change_roadblock
59	Can delete roadblock	15	delete_roadblock
60	Can view roadblock	15	view_roadblock
61	Can add reasoning layer	16	add_reasoninglayer
62	Can change reasoning layer	16	change_reasoninglayer
63	Can delete reasoning layer	16	delete_reasoninglayer
64	Can view reasoning layer	16	view_reasoninglayer
65	Can add outcome layer	17	add_outcomelayer
66	Can change outcome layer	17	change_outcomelayer
67	Can delete outcome layer	17	delete_outcomelayer
68	Can view outcome layer	17	view_outcomelayer
69	Can add project update	18	add_projectupdate
70	Can change project update	18	change_projectupdate
71	Can delete project update	18	delete_projectupdate
72	Can view project update	18	view_projectupdate
73	Can add invitation	19	add_invitation
74	Can change invitation	19	change_invitation
75	Can delete invitation	19	delete_invitation
76	Can view invitation	19	view_invitation
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: build_layers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.build_layers (id, case_file_id, spaces, lists, statuses, custom_fields, automations, integrations, build_notes, workflows) FROM stdin;
59e15b6c-64ef-4145-a74a-746486dbb0a6	25a7e1aa-1eeb-4eb4-9f16-1af929fd630c						[]		[]
be7ec182-c3cf-4cce-b2cf-d195c149d953	3d84b64a-0abf-418e-a05f-09a1f66e3dbf						[]		[{"name": "Project Management Workflow", "lists": [{"name": "Client Name - Deal Name", "statuses": "To Do -> In Progress -> Complete", "automations": [{"actions": [{"type": "", "detail": ""}], "platform": "third_party", "triggers": [{"type": "Custom Field Changed", "detail": "Closed (Won)"}], "use_agent": true, "instructions": "When Property Value is changed to Closed (Won) and Closed (Won) is True\\nThen Create in Clickup:\\n1. Folder - Company Name - Deal Name\\n2. List - Company Name - Deal Name\\n3. Task - Company Name - Deal Name", "pipeline_phase": "", "third_party_platform": "HubSpot Workflows"}, {"actions": [{"type": "Add to List", "detail": "All Projects List"}, {"type": "Change Task Type", "detail": "Project Task Type"}], "platform": "clickup", "triggers": [{"type": "Task Created", "detail": "by automation"}], "use_agent": false, "instructions": "", "pipeline_phase": "", "third_party_platform": ""}, {"actions": [{"type": "", "detail": ""}], "platform": "clickup", "triggers": [{"type": "Custom Field Changed", "detail": "Add Deal Line Item ->Deal Name"}, {"type": "Task Type Is", "detail": "Project"}, {"type": "Custom Field Is", "detail": "Deal Name Not Checked"}], "use_agent": true, "instructions": "You are a Task Automation Agent. Your goal is to create a new task using the \\"New Onboarding Client Task Temp\\" Task Template when specific conditions are met.\\n\\nFollow these steps one by one to complete your task:\\n1. Check if the custom field \\"Add Deal Line Items\\" is updated to \\"Client New Onboarding.\\"\\n2. Confirm that the task type is \\"Project.\\"\\n3. If all conditions are met, create a new task using the \\"New Onboarding Client Task Temp\\" Task Template.\\n4. Add the new task to the same list where the triggering task resides.\\n5. Update new task name to \\"New Onboarding Client.\\"\\n6. Change the task type of the new task to \\"Milestone.\\"\\n7. Do not add any comments or description after completion.", "pipeline_phase": "", "third_party_platform": ""}], "custom_fields": "Add Deal Item - Multiselect\\nParticipants - Long Text\\nPayment Platform - Select\\nAll Line Items - MultiSelect \\nBillable Time - Text\\nIndustry - Select\\nLine Item - Select\\nMilestone Progress - Auto Progress\\nTrainer Assignment - Text\\nWorkshop - Select"}], "notes": "When HubSpot deal moves to Closed (Won), automation triggers and pushes deal and client to ClickUp. Deals will be monitored and reported in this section. All deals will be saved as new Folders in CU.", "pipeline": []}]
46fa85a2-a32a-4501-af97-cbdfed911c54	aacf7704-05bf-4a95-966b-4668eddc58b0	Billing, Business Operations, Project Management					[]		[{"name": "Billing", "lists": [{"name": "PM Initials", "space": "Billing", "statuses": "To Do -> For PM Review -> PM Review Complete -> Finance Processing -> Invoices Sent -> Complete", "automations": [{"actions": [{"type": "Assign To", "detail": "PM"}, {"type": "Change Status", "detail": "For PM Review"}, {"type": "Post Comment", "detail": "ready for review @pm name"}], "platform": "clickup", "triggers": [{"type": "Task Created", "detail": ""}], "use_agent": false, "instructions": "", "pipeline_phase": "", "third_party_platform": ""}, {"actions": [{"type": "Post Comment", "detail": "@billing - ready for review"}], "platform": "clickup", "triggers": [{"type": "Task Status Changed", "detail": "PM Review Complete"}], "use_agent": false, "instructions": "", "pipeline_phase": "", "third_party_platform": ""}, {"actions": [{"type": "Post Comment", "detail": "has not been reviewed since being added. Please review as soon as possible. "}], "platform": "clickup", "triggers": [{"type": "Task Start Date Arrives", "detail": "1 day late"}], "use_agent": false, "instructions": "", "pipeline_phase": "", "third_party_platform": ""}], "custom_fields": ""}], "notes": "simple use case", "pipeline": []}, {"name": "New Project Created", "lists": [{"name": "Lifecyle", "space": "Business Operations", "statuses": "To Do -> Ready for Review -> Billing Review -> Review Approved -> Completed", "automations": [{"actions": [{"type": "Create List", "detail": "Create folder and list in PM Space"}], "platform": "clickup", "triggers": [{"type": "Task Status Changed", "detail": " Review Approved "}, {"type": "Custom Field Is", "detail": "Project Set-up"}], "use_agent": false, "instructions": "", "pipeline_phase": "New Contract Review Approved", "third_party_platform": ""}], "custom_fields": "Lifecycle - dropdown"}], "notes": "", "pipeline": ["New Contract Review Approved", "New Project Added"]}]
1bb7f573-fe61-46c7-8241-0a4538c499d0	d6b0927a-1041-4662-a62f-3e35ffc4b256						[]		[{"name": "Client Project Workflow", "lists": [{"name": "Client Name", "statuses": "", "automations": [], "custom_fields": ""}], "notes": "very basic workflow that ensures every phase of the project is completed correctly and in a timely manner", "pipeline": []}]
e294f5ab-3620-442a-9f0d-9b3051f9aa49	f79856ea-9172-4cbf-ae5d-46f52e506e1e						[]		[{"name": "New Project Intake", "lists": [{"name": "", "statuses": "", "automations": [], "custom_fields": ""}], "notes": "use a form to gather info and requirements that would determine what project is being added and what phases are needed to be automatically added too", "pipeline": []}]
4667ae63-262d-4887-abb8-4722eb52d4db	9be07149-127f-48d0-83d4-76229dca8952						[]		[{"name": "Closed (Won) Create New Project in CU", "lists": [{"name": "Company Name - Project Type", "statuses": "", "automations": [{"actions": [{"type": "", "detail": ""}], "platform": "third_party", "triggers": [{"type": "Event-based", "detail": "When deal is marked Closed (Won)"}], "use_agent": true, "instructions": "Create new folder with Client Name - Project Type to CU", "pipeline_phase": "HubSpot to CU", "third_party_platform": "HubSpot Workflows"}, {"actions": [{"type": "Create List", "detail": "via Template"}], "platform": "clickup", "triggers": [{"type": "Task Created", "detail": ""}], "use_agent": false, "instructions": "", "pipeline_phase": "List Template ", "third_party_platform": ""}], "custom_fields": ""}], "notes": "", "pipeline": ["HubSpot to CU", "List Template "]}]
\.


--
-- Data for Name: current_builds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.current_builds (id, audit_id, tool, structure, failure_reasons, what_breaks, workarounds_they_use, how_long_broken, who_reported, integrations_in_place, impact_on_team, urgency, "order") FROM stdin;
d4263c1a-b0b6-4934-92bf-7ce5d46ea611	fb79a6c2-46b0-4205-8d85-7d68c58f8f1a	ClickUp (prior setup)	User manually adds new project folder with project number and project title. Automation then kicks in to add project to a summary list of all projects in Project Space.	["Nobody using it consistently", "Poor onboarding — built wrong from start"]	They aren't using the setup to really manage projects, they are still using their old system to track and complete projects for now	Excel and Slack	< 1 month	Client / End User	[]		medium	0
\.


--
-- Data for Name: delta_layers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.delta_layers (id, case_file_id, user_intent, success_criteria, actual_build, diverged, divergence_reason, compromises, scope_creep) FROM stdin;
2966a7e2-4bd5-4bba-ac26-15dc77177beb	25a7e1aa-1eeb-4eb4-9f16-1af929fd630c	Fully working inter-departmental pipeline that allows for seamless handoffs between teams without loosing project and client info while completing projects on time.	Projects are completed within 90 days of handoff from Sales		\N			[]
1665026a-65e4-4ddf-9dfb-759293e5e1f2	d6b0927a-1041-4662-a62f-3e35ffc4b256				\N			[]
88984716-98ad-4ad5-9659-d48d2a4da11c	f79856ea-9172-4cbf-ae5d-46f52e506e1e	they want a better way to handle their projects across different phases. Projects are very much broken up into many different phases and workflows. They want everything streamlined and better communication between teams.	Projects are completing on time		\N			[]
825afdc3-8cb5-476f-99cd-cf13b1b850c3	9be07149-127f-48d0-83d4-76229dca8952				\N			[]
3f6225ab-c58b-4272-8735-56653decb0aa	3d84b64a-0abf-418e-a05f-09a1f66e3dbf	Need a better way to monitor and process new deals that come from Hubspot sales pipeline and be able to manage all deals per client without missing deadlines and information.\n\nWhen deal is marked as Closed (Won) the deal line items would populate and add to the project in Clickup based on automations created.	Projects are being completed in timely manner and scheduling conflicts remain at a minimum		\N			[]
4370a3d0-88a8-4833-8485-012e13a49825	aacf7704-05bf-4a95-966b-4668eddc58b0	a better process to track their current and incoming projects and the ability to add capacity planning to their workflow	teams are all updated about projects, assignments are easier, projects are completing in timely manner		\N			[]
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2026-04-01 23:07:13.882274+00	9c72e123-7304-4970-82b4-218d37868041	gaines.melissa23@gmail.com	2	[{"changed": {"fields": ["First name"]}}]	6	9c72e123-7304-4970-82b4-218d37868041
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-04-01 21:15:43.836737+00
2	contenttypes	0002_remove_content_type_name	2026-04-01 21:15:43.839989+00
3	auth	0001_initial	2026-04-01 21:15:43.860435+00
4	auth	0002_alter_permission_name_max_length	2026-04-01 21:15:43.862566+00
5	auth	0003_alter_user_email_max_length	2026-04-01 21:15:43.865245+00
6	auth	0004_alter_user_username_opts	2026-04-01 21:15:43.868719+00
7	auth	0005_alter_user_last_login_null	2026-04-01 21:15:43.870848+00
8	auth	0006_require_contenttypes_0002	2026-04-01 21:15:43.871513+00
9	auth	0007_alter_validators_add_error_messages	2026-04-01 21:15:43.87322+00
10	auth	0008_alter_user_username_max_length	2026-04-01 21:15:43.874857+00
11	auth	0009_alter_user_last_name_max_length	2026-04-01 21:15:43.876512+00
12	auth	0010_alter_group_name_max_length	2026-04-01 21:15:43.878636+00
13	auth	0011_update_proxy_permissions	2026-04-01 21:15:43.880919+00
14	auth	0012_alter_user_first_name_max_length	2026-04-01 21:15:43.88285+00
15	users	0001_initial	2026-04-01 21:15:43.900134+00
16	admin	0001_initial	2026-04-01 21:15:43.910871+00
17	admin	0002_logentry_remove_auto_add	2026-04-01 21:15:43.914782+00
18	admin	0003_logentry_add_action_flag_choices	2026-04-01 21:15:43.918518+00
19	briefs	0001_initial	2026-04-01 21:15:43.978706+00
20	sessions	0001_initial	2026-04-01 21:15:43.983836+00
21	workflows	0001_initial	2026-04-01 21:15:43.993928+00
22	briefs	0002_casefile_name	2026-04-01 21:59:06.432783+00
23	briefs	0003_buildlayer_workflows	2026-04-02 04:45:30.061799+00
24	briefs	0004_roadblocktype_automation_limitation	2026-04-02 07:10:57.752266+00
25	briefs	0005_deltalayer_scope_creep	2026-04-02 21:32:27.556303+00
26	briefs	0006_projectupdate	2026-04-02 22:21:52.448165+00
27	briefs	0007_casefile_share_fields	2026-04-03 07:18:29.311856+00
28	briefs	0008_casefile_status	2026-04-03 17:26:31.905652+00
29	users	0002_alter_user_groups_alter_user_is_superuser_and_more	2026-04-03 19:13:59.617145+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
5n6q8iyqqo5vr7pc2ofswxk2c3025z1x	.eJxVjTkOwjAQRe_imlgee2zPUNJzhmi8hLAokbJUiLuTSCmg_u-9_1atrEvfrnOd2ntRZ8U52grWNdEZbJCjacgmbCxQcZECGQR1-tWS5Gcddrc8ZLiNOo_DMt2T3hF9rLO-jqW-Lgf7F-hl7jfbBc6-GuqqmADgO9keBT1miklCKkDWI6XIFgKxZWJIgQtGbyoGUJ8v6Uc-lQ:1w84Ww:KV4-qn_vE6wkGEdzK2gm1XP9GSNICfzLMIcyycBExaI	2026-04-15 22:59:22.759548+00
\.


--
-- Data for Name: generated_briefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.generated_briefs (id, raw_prompt, parsed_scenario, recommendation, source_case_file_ids, confidence_score, proactive_warnings, user_rating, user_feedback, converted_to_case_file, case_file_id, created_at) FROM stdin;
\.


--
-- Data for Name: intake_layers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.intake_layers (id, case_file_id, raw_prompt, industries, team_size, workflow_type, process_frameworks, tools, pain_points, prior_attempts) FROM stdin;
4a7ad70c-0585-4c57-8142-864811214686	25a7e1aa-1eeb-4eb4-9f16-1af929fd630c	20 person PM team that work on different project teams. Currently, pipeline is mismatched and broken. There are multiple phases in pipeline, starting with Sales, Scoping, and Implementation. Each phase has it's own pipeline.	["Property Management", "Facilities Management"]	20	Client Project Management	["KPIs", "Phase Gate", "Program Delivery", "Sales Pipeline", "Client Onboarding", "Milestones & Deliverables"]	["SmartSheet"]	["Handoffs", "Reporting", "Accountability", "Communication", "Cross-team Alignment", "Approval Bottlenecks"]	
3c970cef-35bf-4b70-ae7f-360f1d2eac55	d6b0927a-1041-4662-a62f-3e35ffc4b256	Team of 12 PMs that have a lot of data and information to go through when completing projects from start to finish. They want something that creates accountability between PMs and teams as well as a tool that make it easier to follow through and complete projects	["Market Research Firm", "Research & Strategy", "Consumer Insights Agency"]	12	Project Management	["Phase Gate"]	[]	["Accountability", "Deadline Tracking", "Process Consistency"]	
adf296ff-2ab3-4b79-a3a3-1c24470afe4e	f79856ea-9172-4cbf-ae5d-46f52e506e1e	New PM team of 3 that have all started recently, so this is a fresh start for creating a PM pipeline, They want to create a more structured and defined pipeline so that projects and tasks aren't lost overtime as well. as better cross team communications.	["Non-profit Organization", "Foundation / Philanthropy", "Community Organization"]	3	Campaign Management	["Program Delivery"]	["Excel", "Google Drive"]	["Reporting", "Communication", "Cross-team Alignment"]	
7a18ce5e-5704-4442-9160-ffb7b73e39d1	9be07149-127f-48d0-83d4-76229dca8952	Small team working to get together projects that are pulled from HubSpot to CU when Closed (Won). Want specific templates to be added based on the of type of project added.	["Supply Chain / Logistics", "Field Services", "Manufacturing"]	10	Client Project Management	["Program Delivery"]	["HubSpot"]	[]	
ad1f8c9e-0a7e-4b89-bc11-e0112d0051e7	3d84b64a-0abf-418e-a05f-09a1f66e3dbf	One person PM team that has oversight by their manager and department head. There is no true PM structure for managing all projects. Company is growing and needs better handle on project management structure.	["Business Coaching", "Corporate Training", "Event Management"]	1	Project Management	["Program Delivery", "Milestones & Deliverables", "Cohort Management"]	["HubSpot"]	["Reporting", "Deadline Tracking", "Process Consistency"]	
8fe9146e-af3b-46fb-97e8-d490c2a0556e	aacf7704-05bf-4a95-966b-4668eddc58b0	40 person team of PMs, billing, and operational departments. Very limited structure using excel and slack. Want better transparency between teams and handoffs. Want more accountability for projects.	["Interior Design", "Event Management", "Facilities Management"]	40	Project Management	["Program Delivery"]	["Slack", "Excel"]	["Reporting", "Capacity Planning", "Resource Allocation", "Deadline Tracking"]	
\.


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.invitations (id, token, email, is_used, created_at, expires_at, created_by_id) FROM stdin;
1	548555db-316a-4f50-be3b-c78f206022e1		f	2026-04-03 19:25:10.05256+00	2026-04-05 19:25:10.052376+00	9c72e123-7304-4970-82b4-218d37868041
\.


--
-- Data for Name: outcome_layers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.outcome_layers (id, case_file_id, built, block_reason, changes, what_worked, what_failed, satisfaction, recommend, revisit_when) FROM stdin;
75fa02d6-dc98-47c3-abb2-81bc1dea97e5	25a7e1aa-1eeb-4eb4-9f16-1af929fd630c						3		
566c8324-82f7-44cc-ba70-d23706fde749	d6b0927a-1041-4662-a62f-3e35ffc4b256						3		
1890eb45-7bbf-4993-a4aa-0a92950721ab	f79856ea-9172-4cbf-ae5d-46f52e506e1e						3		
5ab0b647-8e60-4853-ac52-eee856f05571	9be07149-127f-48d0-83d4-76229dca8952						3		
8273102b-e0df-41c6-b73c-311ede1b68cb	3d84b64a-0abf-418e-a05f-09a1f66e3dbf	yes					4	yes	
5f06c370-f417-4d00-894b-6b29fe82b38b	aacf7704-05bf-4a95-966b-4668eddc58b0						3		
\.


--
-- Data for Name: project_updates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.project_updates (id, content, attachments, created_at, "order", case_file_id) FROM stdin;
85a475ec-b4c6-42a5-b683-d4e338080f98	Reviewed project structure and new list templates added from excel spreadsheets. Trying to understand what they want out of CU.	[]	2026-03-31 00:00:00+00	0	d6b0927a-1041-4662-a62f-3e35ffc4b256
4ec77947-be36-4e24-82a6-5b59f2b560bd	Added current projects they are working on, Discussed dates, ghantt charts and calendars, status format, and how they want to start using CU to enhance their workflows	[]	2026-04-02 00:00:00+00	1	d6b0927a-1041-4662-a62f-3e35ffc4b256
d74cf9da-c1a9-4aea-acdd-07d80b1597f1	Reviewed new test folder and workflow logic.Was able to get more detailed information regarding their project organization and what can be changed moving forward.	[]	2026-04-03 16:12:21.361+00	0	aacf7704-05bf-4a95-966b-4668eddc58b0
188425c0-c6c5-4c76-9d03-3b535613048e	Added new test folder with test bus ops and test project list with updates mimicking their current setup with updated automations	[]	2026-04-02 00:00:00+00	1	aacf7704-05bf-4a95-966b-4668eddc58b0
1d69a880-ba56-438f-9f9f-baec08e825a8	Discovery meeting - learned about their pipeline between teams, handoffs are not great, not really using CU like they should, creating new pipeline as test process for them	[]	2026-03-27 00:00:00+00	2	aacf7704-05bf-4a95-966b-4668eddc58b0
\.


--
-- Data for Name: reasoning_layers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reasoning_layers (id, case_file_id, why_structure, alternatives, why_rejected, assumptions, when_opposite, lessons, complexity) FROM stdin;
f4f304cf-b14b-4aa7-80ee-7973a8ba99be	25a7e1aa-1eeb-4eb4-9f16-1af929fd630c							5
cf157f22-0b55-45c9-8d5b-8748ac035159	d6b0927a-1041-4662-a62f-3e35ffc4b256							2
062eb022-6bc7-49ad-9eb4-8e69aa4db721	f79856ea-9172-4cbf-ae5d-46f52e506e1e							3
b94fa082-c7bc-405e-ba0e-c87ced110321	9be07149-127f-48d0-83d4-76229dca8952							3
8255a590-f76c-43af-a975-f5f0d2d237be	3d84b64a-0abf-418e-a05f-09a1f66e3dbf							4
9e234998-1b99-4c91-954b-7fcd4d571c52	aacf7704-05bf-4a95-966b-4668eddc58b0							3
\.


--
-- Data for Name: roadblocks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roadblocks (id, delta_id, type, severity, tools_affected, description, workaround_found, workaround_description, time_cost_hours, future_warning, flag_for_future, "order") FROM stdin;
1b9a5fbd-fdb1-4bb1-b996-8fb1d17ecd33	2966a7e2-4bd5-4bba-ac26-15dc77177beb	automation_limitation	medium	["ClickUp"]	Needed an automation to trigger when a new form is completed, to merge with a current task in order to keep all information together throughout each phase	f		5		t	0
9e3e7bda-c4c5-4e28-b488-f6f0e12a6ba1	825afdc3-8cb5-476f-99cd-cf13b1b850c3	integration_limitation	high	["HubSpot", "ClickUp"]	ClickUp can't trigger off of a folder creation, only tasks	t	Have to ask client to add list and task to new folder creation automation in order for CU automation to fire	\N	HubSpot has very limited integration actions with CU; CU can't trigger from folder creation	t	0
e14a88a8-0ff4-4fdd-83aa-6c84cd738376	3f6225ab-c58b-4272-8735-56653decb0aa	integration_limitation	high	["HubSpot"]	HubSpot doesn't allow for ALL deal items to be pulled at once, only the most recently used one. This broke the pipeline automation since we needed all items to be added in order to add the correct deal task templates.	t	Added a new field on ClickUp to allow for the user to select each deal item - this then automates the deal task template to be applied	5	HubSpot is very limited in the automations and information it can handle when integrated with ClickUp	t	0
077b50ec-6349-4a05-8ff6-4779862b3cc1	3f6225ab-c58b-4272-8735-56653decb0aa	automation_limitation	medium	["ClickUp"]	Cannot create a simple automation to add a task template when something is selected or it's coming off of another automation	t	had to create detailed automation instructions in order for it to work correctly	3		t	1
\.


--
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: workflow_patterns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workflow_patterns (id, case_file_id, chunk_type, text, embedding, industries, tools, workflow_type, satisfaction_score, complexity, created_at) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.invitations_id_seq', 1, true);


--
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_groups_id_seq', 1, false);


--
-- Name: users_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_permissions_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict QYF3RjIxCQBFddlL6p3aeJihCeB0J2UsftLM39cokMcfOvlJzu7gV4YBVJCdMei

