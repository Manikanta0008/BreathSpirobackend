from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from .models import UserProfile, TrainingSession
from .serializers import UserProfileSerializer, RegisterSerializer, LoginSerializer, TrainingSessionSerializer


class UserProfileViewSet(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer
    lookup_field = 'device_id'

    def create(self, request, *args, **kwargs):
        try:
            device_id = request.data.get('device_id')
            if not device_id:
                return Response({"error": "device_id is required"}, status=status.HTTP_400_BAD_REQUEST)
                
            # Build defaults from all fields
            field_names = [
                'age', 'gender', 'height', 'weight', 'condition',
                'smoking_status', 'pack_years',
                'respiratory_rate', 'spo2_level',
                'dyspnea_score', 'dyspnea_description',
                'muscle_strength_level', 'muscle_strength_title',
                'mip_value', 'mep_value',
                'baseline_hold_time_sec',
                'username', 'name',
            ]
            
            defaults = {}
            for field in field_names:
                if request.data.get(field) is not None:
                    defaults[field] = request.data[field]

            # Update the LATEST record for this device, or create new
            existing = UserProfile.objects.filter(device_id=device_id).order_by('-id').first()
            
            if existing:
                for key, value in defaults.items():
                    setattr(existing, key, value)
                existing.save()
                serializer = self.get_serializer(existing)
                return Response(serializer.data, status=status.HTTP_200_OK)
            else:
                defaults['device_id'] = device_id
                user = UserProfile.objects.create(**defaults)
                serializer = self.get_serializer(user)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(f"Server Error during create: {e}")
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


class RegisterView(APIView):
    """Register a new user — always creates a NEW record."""
    
    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
        data = serializer.validated_data
        
        # Always create a NEW record — all registrations are saved
        user = UserProfile.objects.create(
            username=data['username'],
            password=data['password'],  # Plain text
            name=data.get('name', ''),
            device_id=data.get('device_id', ''),
        )
        
        profile_serializer = UserProfileSerializer(user)
        return Response({
            "message": "Registration successful",
            "user": profile_serializer.data
        }, status=status.HTTP_201_CREATED)


class LoginView(APIView):
    """Login with username and password (plain text comparison)."""
    
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
        data = serializer.validated_data
        
        # Find latest user with this username
        user = UserProfile.objects.filter(username=data['username']).order_by('-id').first()
        
        if not user:
            return Response(
                {"error": "Invalid username or password"},
                status=status.HTTP_401_UNAUTHORIZED
            )
        
        # Plain text password comparison
        if user.password != data['password']:
            return Response(
                {"error": "Invalid username or password"},
                status=status.HTTP_401_UNAUTHORIZED
            )
        
        profile_serializer = UserProfileSerializer(user)
        return Response({
            "message": "Login successful",
            "user": profile_serializer.data
        }, status=status.HTTP_200_OK)


@api_view(['GET'])
def user_count(request):
    """Get total number of registered users."""
    count = UserProfile.objects.count()
    users = UserProfileSerializer(UserProfile.objects.all(), many=True).data
    return Response({
        "total_users": count,
        "users": users
    }, status=status.HTTP_200_OK)


@api_view(['GET', 'POST'])
def training_sessions(request):
    """GET: list all sessions. POST: create a new session."""
    if request.method == 'GET':
        sessions = TrainingSession.objects.all().order_by('-created_at')
        serializer = TrainingSessionSerializer(sessions, many=True)
        return Response({
            "total_sessions": sessions.count(),
            "sessions": serializer.data
        }, status=status.HTTP_200_OK)
    
    elif request.method == 'POST':
        serializer = TrainingSessionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def reset_password(request):
    """Simple password reset using username for the demo app."""
    try:
        username = request.data.get('username', '')
        new_password = request.data.get('new_password', '')
        
        if not username or not new_password:
            return Response({"error": "Username and new_password are required"}, status=status.HTTP_400_BAD_REQUEST)
        
        user = UserProfile.objects.filter(username=username).order_by('-id').first()
        
        if not user:
            return Response({"error": "User not found"}, status=status.HTTP_404_NOT_FOUND)
        
        user.password = new_password
        user.save()
        return Response({"message": "Password reset successfully"}, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
