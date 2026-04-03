from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("briefs", "0003_buildlayer_workflows"),
    ]

    operations = [
        migrations.AlterField(
            model_name="roadblock",
            name="type",
            field=models.CharField(
                blank=True,
                choices=[
                    ("integration_limitation", "Integration Limitation"),
                    ("api_limitation", "API Limitation"),
                    ("automation_limitation", "Automation Limitation"),
                    ("data_mapping_mismatch", "Data Mapping Mismatch"),
                    ("auth_complexity", "Auth Complexity"),
                    ("timing_conflict", "Timing Conflict"),
                    ("cost_ceiling", "Cost Ceiling"),
                    ("user_behavior_gap", "User Behavior Gap"),
                    ("scope_creep_block", "Scope Creep Block"),
                ],
                max_length=50,
            ),
        ),
    ]
