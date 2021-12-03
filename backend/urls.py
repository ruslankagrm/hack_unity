"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
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
from django.urls import path

# from unity_app.views import ProjectView, ProjectDetailView
from unity_app.views import UserView, TestsView, TestsDetailedView, FlightReportView, RatingView, RatingPDFView, \
    AllUsersView

urlpatterns = [
    path('api/user/', UserView.as_view()),
    path('api/user/all/', AllUsersView.as_view()),
    path('api/user/<guid>/', UserView.as_view()),
    path('api/tests/', TestsView.as_view()),
    path('api/tests/<guid>/', TestsDetailedView.as_view()),
    path('api/report/', FlightReportView.as_view()),
    path('api/report/last/', FlightReportView.as_view()),
    path('api/report/all/', FlightReportView.as_view()),
    path('api/rating/', RatingView.as_view()),
    path('api/rating/pdf/', RatingPDFView.as_view()),
]
