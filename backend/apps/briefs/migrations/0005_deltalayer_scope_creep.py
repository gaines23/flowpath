from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("briefs", "0004_roadblocktype_automation_limitation"),
    ]

    operations = [
        migrations.AddField(
            model_name="deltalayer",
            name="scope_creep",
            field=models.JSONField(default=list),
        ),
    ]
