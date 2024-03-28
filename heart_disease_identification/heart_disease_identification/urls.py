"""heart_disease_identificationURL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from Remote_User import views as remoteuser
from heart_disease_identification import settings
from Service_Provider import views as serviceprovider
from django.conf.urls.static import static


urlpatterns = [
    url('admin/', admin.site.urls),
    url(r'^$', remoteuser.login, name="login"),
    url(r'^Register1/$', remoteuser.Register1, name="Register1"),
    url(r'^Search_Heart_Disease/$', remoteuser.Search_Heart_Disease, name="Search_Heart_Disease"),
    url(r'^ratings/(?P<pk>\d+)/$', remoteuser.ratings, name="ratings"),
    url(r'^ViewYourProfile/$', remoteuser.ViewYourProfile, name="ViewYourProfile"),
    url(r'^Add_DataSet_Details/$', remoteuser.Add_DataSet_Details, name="Add_DataSet_Details"),
    url(r'^serviceproviderlogin/$',serviceprovider.serviceproviderlogin, name="serviceproviderlogin"),
    url(r'View_Remote_Users/$',serviceprovider.View_Remote_Users,name="View_Remote_Users"),
    url(r'^charts/(?P<chart_type>\w+)', serviceprovider.charts,name="charts"),
    url(r'^likeschart/(?P<like_chart>\w+)', serviceprovider.likeschart, name="likeschart"),
    url(r'^Search_HeartDisease/$', serviceprovider.Search_HeartDisease, name="Search_HeartDisease"),
    url(r'^Normal_Users/$', serviceprovider.Normal_Users, name="Normal_Users"),
    url(r'^Abnormal_Users/$', serviceprovider.Abnormal_Users, name="Abnormal_Users"),
    url(r'^Diagnose_Heart_Disease/$', serviceprovider.Diagnose_Heart_Disease, name="Diagnose_Heart_Disease"),
    url(r'^View_HeartDiseaseDataSets_Details/$', serviceprovider.View_HeartDiseaseDataSets_Details, name="View_HeartDiseaseDataSets_Details"),


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
