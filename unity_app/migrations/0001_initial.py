# Generated by Django 3.2.6 on 2021-12-02 22:49

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ProjectUser',
            fields=[
                ('guid', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255, null=True)),
                ('result', models.CharField(max_length=255, null=True)),
            ],
            options={
                'db_table': 'projects_user',
            },
        ),
        migrations.CreateModel(
            name='Questions',
            fields=[
                ('guid', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255, null=True)),
            ],
            options={
                'db_table': 'questions',
            },
        ),
        migrations.CreateModel(
            name='Tests',
            fields=[
                ('guid', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255, null=True)),
            ],
            options={
                'db_table': 'tests',
            },
        ),
        migrations.CreateModel(
            name='Variants',
            fields=[
                ('guid', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255, null=True)),
                ('is_answer', models.BooleanField(default=False)),
                ('question_id', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='variants', to='unity_app.questions')),
            ],
            options={
                'db_table': 'variants',
            },
        ),
        migrations.CreateModel(
            name='Results',
            fields=[
                ('guid', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('result', models.FloatField(default=0.0, null=True)),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='results', to='unity_app.projectuser')),
            ],
            options={
                'db_table': 'results',
            },
        ),
        migrations.AddField(
            model_name='questions',
            name='test_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='questions', to='unity_app.tests'),
        ),
    ]
