from fastapi import FastAPI, Depends, HTTPException, Body
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional, List
from sqlalchemy.orm import Session
from database import engine, get_db, Base
from models import User, TrainingSession, Assessment
import datetime

# Create the database tables
Base.metadata.create_all(bind=engine)

app = FastAPI()

# Configure CORS
origins = [
    "http://localhost:3000", # Common for React
    "http://127.0.0.1:3000",
    "http://localhost:5173", # Vite
    "http://180.235.121.245:8007", # New Production IP
    "*", # Allow all for development/ngrok
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Pydantic Models
class UserRegister(BaseModel):
    username: str
    password: str
    name: Optional[str] = None
    device_id: Optional[str] = None

class UserLogin(BaseModel) :
    username: str
    password: str

class UserProfileUpdate(BaseModel):
    device_id: str
    age: Optional[int] = None
    gender: Optional[str] = None
    height: Optional[float] = None
    weight: Optional[float] = None
    condition: Optional[str] = None
    smoking_status: Optional[str] = None
    pack_years: Optional[int] = None
    respiratory_rate: Optional[int] = None
    spo2_level: Optional[int] = None
    dyspnea_score: Optional[int] = None
    dyspnea_description: Optional[str] = None
    muscle_strength_level: Optional[str] = None
    muscle_strength_title: Optional[str] = None
    mip_value: Optional[float] = None
    mep_value: Optional[float] = None
    baseline_hold_time_sec: Optional[int] = None

class SessionCreate(BaseModel):
    device_id: Optional[str] = None
    username: Optional[str] = None
    session_duration_sec: int
    completed_cycles: int
    total_cycles: int
    breath_count: int
    session_type: Optional[str] = None

# API Routes

@app.post("/api/register/")
def register_user(user_data: UserRegister, db: Session = Depends(get_db)):
    # Check if username exists
    existing_user = db.query(User).filter(User.username == user_data.username).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="Username already taken")
    
    new_user = User(
        username=user_data.username,
        password=user_data.password,
        name=user_data.name,
        device_id=user_data.device_id or f"web_{user_data.username}"
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return {"message": "Registration successful", "user": {"username": new_user.username, "name": new_user.name}}

@app.post("/api/login/")
def login_user(login_data: UserLogin, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == login_data.username).first()
    if not user or user.password != login_data.password:
        raise HTTPException(status_code=401, detail="Invalid username or password")
    
    return {"message": "Login successful", "user": {"username": user.username, "name": user.name, "device_id": user.device_id}}

@app.post("/api/users/")
def create_or_update_user(profile: UserProfileUpdate, db: Session = Depends(get_db)):
    # Try to find user by device_id
    db_user = db.query(User).filter(User.device_id == profile.device_id).first()
    
    if not db_user:
        # Create new if not found
        db_user = User(device_id=profile.device_id)
        db.add(db_user)
    
    # Update fields
    for field, value in profile.dict(exclude_unset=True).items():
        setattr(db_user, field, value)
    
    db.commit()
    db.refresh(db_user)
    return db_user

@app.get("/api/users/{device_id}")
def read_user(device_id: str, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.device_id == device_id).first()
    if user is None:
        raise HTTPException(status_code=404, detail="User not found")
    return user

@app.post("/api/sessions/")
def create_session(session_data: SessionCreate, db: Session = Depends(get_db)):
    new_session = TrainingSession(**session_data.dict())
    
    # Try to link to a user if device_id or username is provided
    if session_data.device_id:
        user = db.query(User).filter(User.device_id == session_data.device_id).first()
        if user:
            new_session.user_id = user.id
    elif session_data.username:
        user = db.query(User).filter(User.username == session_data.username).first()
        if user:
            new_session.user_id = user.id

    db.add(new_session)
    db.commit()
    db.refresh(new_session)
    return new_session

@app.get("/api/sessions/")
def list_sessions(username: Optional[str] = None, db: Session = Depends(get_db)):
    query = db.query(TrainingSession)
    if username:
        query = query.filter(TrainingSession.username == username)
    return query.order_by(TrainingSession.created_at.desc()).all()

@app.get("/")
def home():
    return {"message": "Welcome to LungsApp FastAPI Backend"}
