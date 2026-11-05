from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rdgenerator', '0002_githubrun_github_run_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='githubrun',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]
