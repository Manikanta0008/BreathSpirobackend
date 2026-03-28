from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserProfileViewSet, RegisterView, LoginView, user_count, training_sessions, reset_password

router = DefaultRouter()
router.register(r'users', UserProfileViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('reset-password/', reset_password, name='reset-password'),
    path('user-count/', user_count, name='user-count'),
    path('sessions/', training_sessions, name='training-sessions'),
]
