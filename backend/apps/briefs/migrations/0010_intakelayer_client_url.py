from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("briefs", "0009_casefile_case_files_satisfa_f687bd_idx_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="intakelayer",
            name="client_url",
            field=models.URLField(blank=True),
        ),
    ]
