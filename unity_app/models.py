from django.db import models

# Create your models here.
import uuid

from django.db import models


class ProjectUser(models.Model):
    guid = models.UUIDField(primary_key=True, db_index=True, default=uuid.uuid4)
    name = models.CharField(max_length=255, null=True)
    result = models.CharField(max_length=255, null=True)

    class Meta:
        db_table = 'projects_user'


class Tests(models.Model):
    guid = models.UUIDField(primary_key=True, db_index=True, default=uuid.uuid4)
    name = models.CharField(max_length=255, null=True)

    class Meta:
        db_table = 'tests'


class Questions(models.Model):
    guid = models.UUIDField(primary_key=True, db_index=True, default=uuid.uuid4)
    name = models.CharField(max_length=255, null=True)
    test_id = models.ForeignKey(Tests, on_delete=models.PROTECT, related_name="questions")

    class Meta:
        db_table = 'questions'


class Variants(models.Model):
    guid = models.UUIDField(primary_key=True, db_index=True, default=uuid.uuid4)
    name = models.CharField(max_length=255, null=True)
    question_id = models.ForeignKey(Questions, on_delete=models.PROTECT, related_name="variants")
    is_answer = models.BooleanField(default=False)

    class Meta:
        db_table = 'variants'


class Results(models.Model):
    guid = models.UUIDField(primary_key=True, db_index=True, default=uuid.uuid4)
    user_id = models.ForeignKey(ProjectUser, on_delete=models.PROTECT, related_name="results")
    result = models.FloatField(default=0.0, null=True)

    class Meta:
        db_table = 'results'


class FlightReport(models.Model):
    guid = models.UUIDField(primary_key=True, db_index=True, default=uuid.uuid4)
    user = models.ForeignKey(ProjectUser, on_delete=models.PROTECT, related_name="flight_report")
    max_speed = models.CharField(max_length=255, null=True)
    danger_close = models.CharField(max_length=255, null=True)
    hits = models.CharField(max_length=255, null=True)
    max_height = models.CharField(max_length=255, null=True)
    time = models.CharField(max_length=255, null=True)
    status = models.CharField(max_length=255, null=True)
    points = models.CharField(max_length=255, null=True)

    class Meta:
        db_table = 'flight_reports'

