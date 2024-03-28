from django.db import models

# Create your models here.
from django.db.models import CASCADE


class ClientRegister_Model(models.Model):
    username = models.CharField(max_length=30)
    email = models.EmailField(max_length=30)
    password = models.CharField(max_length=10)
    phoneno = models.CharField(max_length=10)
    country = models.CharField(max_length=30)
    state = models.CharField(max_length=30)
    city = models.CharField(max_length=30)

class heart_disease_model(models.Model):

    names= models.CharField(max_length=300)
    age = models.CharField(max_length=300)
    sex= models.CharField(max_length=300)
    chest_pain= models.CharField(max_length=300)
    resting_bp= models.IntegerField()
    serum_cholesterol= models.IntegerField()
    fasting_blood_sugar= models.IntegerField()
    resting_electro_cardiographic= models.CharField(max_length=300)
    max_heart_rate= models.IntegerField()
    exercise_induced_angina= models.CharField(max_length=300)
    depression_induced_by_exercise= models.CharField(max_length=300)
    fluoroscopy= models.CharField(max_length=300)
    thallium_scan= models.CharField(max_length=300)

class review_Model(models.Model):
    uname = models.CharField(max_length=100)
    ureview = models.CharField(max_length=100)
    sanalysis = models.CharField(max_length=100)
    dt= models.CharField(max_length=300)
    tname= models.CharField(max_length=300)
    feedback = models.CharField(max_length=300)

class recommend_Model(models.Model):
    uname1 = models.CharField(max_length=100)
    pname = models.CharField(max_length=100)
    loc = models.CharField(max_length=100)
    dt= models.CharField(max_length=300)
    usefull= models.CharField(max_length=300)




