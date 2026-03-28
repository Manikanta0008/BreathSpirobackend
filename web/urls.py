from django.urls import path
from . import views

urlpatterns = [
    # Landing page (root)
    path('', views.landing, name='landing'),

    # Auth
    path('login/', views.web_login, name='web-login'),
    path('register/', views.web_register, name='web-register'),
    path('forgot-password/', views.web_forgot_password, name='web-forgot-password'),
    path('logout/', views.web_logout, name='web-logout'),

    # Profile Setup Flow
    path('setup/profile/', views.web_profile_setup, name='web-profile-setup'),
    path('setup/diagnosis/', views.web_diagnosis, name='web-diagnosis'),
    path('setup/smoking/', views.web_smoking, name='web-smoking'),
    path('setup/respiratory-rate/', views.web_respiratory_rate, name='web-respiratory-rate'),
    path('setup/spo2/', views.web_spo2, name='web-spo2'),
    path('setup/dyspnea/', views.web_dyspnea, name='web-dyspnea'),
    path('setup/muscle-strength/', views.web_muscle_strength, name='web-muscle-strength'),
    path('setup/baseline/', views.web_baseline, name='web-baseline'),

    # Patient-facing pages
    path('home/', views.web_home, name='web-home'),
    path('breathing/', views.web_breathing, name='web-breathing'),
    path('performance/', views.web_performance, name='web-performance'),
    path('history/', views.web_history, name='web-history'),
    path('settings/', views.web_settings, name='web-user-settings'),

    # Admin Dashboard
    path('dashboard/', views.dashboard, name='dashboard'),
    path('patients/', views.patients, name='web-patients'),
    path('sessions/', views.sessions, name='web-sessions'),
    path('patients/<int:patient_id>/', views.patient_detail, name='web-patient-detail'),
]

