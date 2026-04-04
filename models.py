from sqlalchemy import Column, Integer, String, Float, DateTime, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from database import Base
import datetime

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    device_id = Column(String(255), unique=True, index=True) # To link with Android device ID
    
    # Auth fields
    username = Column(String(255), unique=True, index=True, nullable=True)
    password = Column(String(255), nullable=True) # Plain text for now to match current Django setup
    name = Column(String(255), nullable=True)
    
    # Basic Profile
    age = Column(Integer, default=0)
    gender = Column(String(50), nullable=True)
    height = Column(Float, default=0.0) # in cm
    weight = Column(Float, default=0.0) # in kg
    
    # Medical Background
    condition = Column(String(255), nullable=True) # e.g. COPD, Asthma
    smoking_status = Column(String(100), nullable=True)
    pack_years = Column(Integer, default=0)
    diagnosis_date = Column(DateTime, nullable=True)
    
    # Health Metrics
    respiratory_rate = Column(Integer, default=0)
    spo2_level = Column(Integer, default=0)
    dyspnea_score = Column(Integer, default=0)
    dyspnea_description = Column(String(255), nullable=True)
    
    # Muscle Strength
    muscle_strength_level = Column(String(100), nullable=True)
    muscle_strength_title = Column(String(255), nullable=True)
    mip_value = Column(Float, default=0.0)
    mep_value = Column(Float, default=0.0)
    
    # Baseline
    baseline_hold_time_sec = Column(Integer, default=0)

    # Relationships
    sessions = relationship("TrainingSession", back_populates="user")
    assessments = relationship("Assessment", back_populates="user")

class TrainingSession(Base):
    __tablename__ = "training_sessions"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    device_id = Column(String(255), nullable=True)
    username = Column(String(255), nullable=True)
    
    created_at = Column(DateTime, default=lambda: datetime.datetime.now(datetime.timezone.utc))
    session_duration_sec = Column(Integer, default=0)
    completed_cycles = Column(Integer, default=0)
    total_cycles = Column(Integer, default=0)
    breath_count = Column(Integer, default=0)
    session_type = Column(String(100), nullable=True) # e.g. "Diaphragmatic", "Pursed Lip"
    
    completed = Column(Boolean, default=False)
    notes = Column(String(500), nullable=True)

    user = relationship("User", back_populates="sessions")

class Assessment(Base):
    __tablename__ = "assessments"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    
    timestamp = Column(DateTime, default=lambda: datetime.datetime.now(datetime.timezone.utc))
    
    # Types of metrics recorded
    assessment_type = Column(String(100)) # "BHT", "MIP", "MEP", "SpO2", "Dyspnea"
    value_numeric = Column(Float)
    value_text = Column(String(500), nullable=True)
    
    user = relationship("User", back_populates="assessments")
