from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("briefs", "0002_casefile_name"),
    ]

    operations = [
        migrations.AddField(
            model_name="buildlayer",
            name="workflows",
            field=models.JSONField(default=list),
        ),
    ]
