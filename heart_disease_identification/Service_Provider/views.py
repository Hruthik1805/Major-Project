
from django.db.models import  Count, Avg
from django.shortcuts import render, redirect
from django.db.models import Count
from django.db.models import Q
import datetime


# Create your views here.
from Remote_User.models import heart_disease_model,ClientRegister_Model,review_Model,recommend_Model


def serviceproviderlogin(request):
    if request.method  == "POST":
        admin = request.POST.get('username')
        password = request.POST.get('password')
        if admin == "SProvider" and password =="SProvider":
            return redirect('View_Remote_Users')

    return render(request,'SProvider/serviceproviderlogin.html')


def viewtreandingquestions(request,chart_type):
    dd = {}
    pos,neu,neg =0,0,0
    poss=None
    topic = heart_disease_model.objects.values('ratings').annotate(dcount=Count('ratings')).order_by('-dcount')
    for t in topic:
        topics=t['ratings']
        pos_count=heart_disease_model.objects.filter(topics=topics).values('names').annotate(topiccount=Count('ratings'))
        poss=pos_count
        for pp in pos_count:
            senti= pp['names']
            if senti == 'positive':
                pos= pp['topiccount']
            elif senti == 'negative':
                neg = pp['topiccount']
            elif senti == 'nutral':
                neu = pp['topiccount']
        dd[topics]=[pos,neg,neu]
    return render(request,'SProvider/viewtreandingquestions.html',{'object':topic,'dd':dd,'chart_type':chart_type})

def Search_HeartDisease(request): # Search
    if request.method == "POST":
        kword = request.POST.get('keyword')
        obj = heart_disease_model.objects.all().filter(Q(chest_pain__contains=kword) | Q(names__contains=kword) | Q(resting_electro_cardiographic__contains=kword)| Q(exercise_induced_angina__contains=kword)| Q(depression_induced_by_exercise__contains=kword)| Q(fluoroscopy__contains=kword)| Q(thallium_scan__contains=kword))
        return render(request, 'SProvider/Search_HeartDisease.html', {'objs': obj})
    return render(request, 'SProvider/Search_HeartDisease.html')

def Diagnose_Heart_Disease(request): # Search

    bp=120
    cholestrol=200
    hrate_high=100
    hrate_low=60
    sugar=100

    obj = heart_disease_model.objects.all().filter(Q(resting_bp__gt=bp)| Q(serum_cholesterol__gt=cholestrol)|Q(max_heart_rate__gt=hrate_high)|Q(max_heart_rate__lt=hrate_low) | Q(fasting_blood_sugar__gt=sugar))
    return render(request, 'SProvider/Diagnose_Heart_Disease.html', {'objs': obj})


def Normal_Users(request): # Positive

    bp = 140
    cholestrol = 200
    hrate_high = 100
    hrate_low = 60
    sugar = 100
    obj = heart_disease_model.objects.all().filter(
        Q(resting_bp__lt=bp), Q(serum_cholesterol__lt=cholestrol),Q(max_heart_rate__lt=hrate_high),Q(max_heart_rate__gt=hrate_low),Q(fasting_blood_sugar__lt=sugar))
    return render(request, 'SProvider/Normal_Users.html', {'objs': obj})

def Abnormal_Users(request):
    kword='Abnormal'
    obj = heart_disease_model.objects.all().filter(
        Q(chest_pain__contains=kword) | Q(resting_electro_cardiographic__contains=kword)| Q(exercise_induced_angina__contains=kword)|Q(depression_induced_by_exercise__contains=kword),Q(
            fluoroscopy__contains=kword), Q(thallium_scan__contains=kword))
    return render(request, 'SProvider/Abnormal_Users.html', {'objs': obj})


def View_Remote_Users(request):
    obj=ClientRegister_Model.objects.all()
    return render(request,'SProvider/View_Remote_Users.html',{'objects':obj})

def ViewTrendings(request):
    topic = heart_disease_model.objects.values('topics').annotate(dcount=Count('topics')).order_by('-dcount')
    return  render(request,'SProvider/ViewTrendings.html',{'objects':topic})

def negativechart(request,chart_type):
    dd = {}
    pos, neu, neg = 0, 0, 0
    poss = None
    topic = heart_disease_model.objects.values('ratings').annotate(dcount=Count('ratings')).order_by('-dcount')
    for t in topic:
        topics = t['ratings']
        pos_count = heart_disease_model.objects.filter(topics=topics).values('names').annotate(topiccount=Count('ratings'))
        poss = pos_count
        for pp in pos_count:
            senti = pp['names']
            if senti == 'positive':
                pos = pp['topiccount']
            elif senti == 'negative':
                neg = pp['topiccount']
            elif senti == 'nutral':
                neu = pp['topiccount']
        dd[topics] = [pos, neg, neu]
    return render(request,'SProvider/negativechart.html',{'object':topic,'dd':dd,'chart_type':chart_type})


def charts(request,chart_type):
    chart1 = heart_disease_model.objects.values('names').annotate(dcount=Avg('serum_cholesterol'))
    return render(request,"SProvider/charts.html", {'form':chart1, 'chart_type':chart_type})

def View_HeartDiseaseDataSets_Details(request):
    obj = heart_disease_model.objects.all()
    return render(request, 'SProvider/View_HeartDiseaseDataSets_Details.html', {'list_objects': obj})

def likeschart(request,like_chart):
    charts = heart_disease_model.objects.values('names').annotate(dcount=Avg('max_heart_rate'))
    return render(request,"SProvider/likeschart.html", {'form':charts, 'like_chart':like_chart})






