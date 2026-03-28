from sqlalchemy import Column, Integer, String, Float, DateTime, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from database import Base
import datetime

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    device_id = Column(String, unique=True, index=True) # To link with Android device ID
    
    # Basic Profile
    age = Column(Integer)
    gender = Column(String)
    height = Column(Float) # in cm
    weight = Column(Float) # in kg
    
    # Medical Background
    condition = Column(String) # e.g. COPD, Asthma
    smoking_history_years = Column(Integer, default=0)
    diagnosis_date = Column(DateTime)

    # Relationships
    sessions = relationship("TrainingSession", back_populates="user")
    assessments = relationship("Assessment", back_populates="user")

class TrainingSession(Base):
    __tablename__ = "training_sessions"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    
    start_time = Column(DateTime, default=lambda: datetime.datetime.now(datetime.timezone.utc))
    end_time = Column(DateTime)
    duration_seconds = Column(Integer)
    session_type = Column(String) # e.g. "Diaphragmatic", "Pursed Lip"
    
    completed = Column(Boolean, default=False)
    notes = Column(String, nullable=True)

    user = relationship("User", back_populates="sessions")

class Assessment(Base):
    __tablename__ = "assessments"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    
    timestamp = Column(DateTime, default=lambda: datetime.datetime.now(datetime.timezone.utc))
    
    # Types of metrics recorded
    assessment_type = Column(String) # "BHT", "MIP", "MEP", "SpO2", "Dyspnea"
    value_numeric = Column(Float)
    value_text = Column(String, nullable=True)
    
    user = relationship("User", back_populates="assessments")
