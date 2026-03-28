from django.db import models


class UserProfile(models.Model):
    device_id = models.CharField(max_length=255, blank=True, null=True, help_text="Device identifier")
    
    # Auth fields — plain text for college demo
    username = models.CharField(max_length=100, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True, help_text="Plain text password")
    
    # Profile fields
    name = models.CharField(max_length=100, blank=True, default='')
    
    # Basic Profile
    age = models.IntegerField(null=True, blank=True)
    gender = models.CharField(max_length=20, null=True, blank=True)
    height = models.FloatField(null=True, blank=True, help_text="Height in cm")
    weight = models.FloatField(null=True, blank=True, help_text="Weight in kg")
    
    # Diagnosis
    condition = models.CharField(max_length=100, blank=True, null=True, help_text="Medical condition e.g. COPD")
    
    # Smoking History
    smoking_status = models.CharField(max_length=50, blank=True, null=True)
    pack_years = models.CharField(max_length=50, blank=True, null=True)
    
    # Respiratory Rate
    respiratory_rate = models.IntegerField(null=True, blank=True, help_text="Breaths per minute")
    
    # SpO2
    spo2_level = models.IntegerField(null=True, blank=True, help_text="Oxygen saturation %")
    
    # Dyspnea Score
    dyspnea_score = models.CharField(max_length=20, blank=True, null=True)
    dyspnea_description = models.CharField(max_length=200, blank=True, null=True)
    
    # Muscle Strength
    muscle_strength_level = models.CharField(max_length=20, blank=True, null=True)
    muscle_strength_title = models.CharField(max_length=50, blank=True, null=True)
    mip_value = models.FloatField(null=True, blank=True, help_text="MIP value")
    mep_value = models.FloatField(null=True, blank=True, help_text="MEP value")
    
    # Baseline Assessment
    baseline_hold_time_sec = models.IntegerField(null=True, blank=True, help_text="Breath hold time in seconds")
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"User {self.username}"


class TrainingSession(models.Model):
    device_id = models.CharField(max_length=255, blank=True, null=True, help_text="Device identifier")
    username = models.CharField(max_length=100, blank=True, null=True)
    
    session_duration_sec = models.IntegerField(default=0, help_text="Total session duration in seconds")
    breath_count = models.IntegerField(default=0, help_text="Total breaths in the session")
    completed_cycles = models.IntegerField(default=0, help_text="Cycles completed")
    total_cycles = models.IntegerField(default=10, help_text="Total cycles planned")
    
    # Accuracy Metrics
    inhale_accuracy = models.IntegerField(default=0, help_text="Inhale accuracy %")
    hold_accuracy = models.IntegerField(default=0, help_text="Hold accuracy %")
    exhale_accuracy = models.IntegerField(default=0, help_text="Exhale accuracy %")
    overall_accuracy = models.IntegerField(default=0, help_text="Overall accuracy %")
    
    notes = models.TextField(blank=True, null=True, help_text="Clinical journal notes from patient")
    
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Session by {self.username} - {self.completed_cycles}/{self.total_cycles} cycles"
