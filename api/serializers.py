from rest_framework import serializers
from .models import UserProfile, TrainingSession


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ['id', 'device_id', 'username', 'name',
                  'age', 'gender', 'height', 'weight', 'condition',
                  'smoking_status', 'pack_years',
                  'respiratory_rate', 'spo2_level',
                  'dyspnea_score', 'dyspnea_description',
                  'muscle_strength_level', 'muscle_strength_title',
                  'mip_value', 'mep_value',
                  'baseline_hold_time_sec',
                  'created_at', 'updated_at']
        read_only_fields = ['id', 'created_at', 'updated_at']
        extra_kwargs = {
            'username': {'required': False},
        }


class TrainingSessionSerializer(serializers.ModelSerializer):
    class Meta:
        model = TrainingSession
        fields = ['id', 'device_id', 'username',
                  'session_duration_sec', 'breath_count',
                  'completed_cycles', 'total_cycles', 'notes',
                  'inhale_accuracy', 'hold_accuracy', 'exhale_accuracy', 'overall_accuracy',
                  'created_at']
        read_only_fields = ['id', 'created_at']


class RegisterSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=100)
    password = serializers.CharField(max_length=255)
    name = serializers.CharField(max_length=100, required=False, default='')
    device_id = serializers.CharField(max_length=255, required=False, default='')


class LoginSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=100)
    password = serializers.CharField(max_length=255)
