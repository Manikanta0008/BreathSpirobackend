from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware

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
    # Add production frontend URL here later
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# CRUD Operations

@app.post("/users/")
def create_user(device_id: str, age: int, gender: str, height: float, weight: float, condition: str, db: Session = Depends(get_db)):
    db_user = db.query(User).filter(User.device_id == device_id).first()
    if db_user:
        raise HTTPException(status_code=400, detail="Device ID already registered")
    
    new_user = User(device_id=device_id, age=age, gender=gender, height=height, weight=weight, condition=condition)
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return new_user

@app.get("/users/{user_id}")
def read_user(user_id: int, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.id == user_id).first()
    if user is None:
        raise HTTPException(status_code=404, detail="User not found")
    return user

@app.post("/sessions/")
def create_session(user_id: int, duration: int, session_type: str, completed: bool, db: Session = Depends(get_db)):
    new_session = TrainingSession(user_id=user_id, duration_seconds=duration, session_type=session_type, completed=completed)
    db.add(new_session)
    db.commit()
    db.refresh(new_session)
    return new_session

@app.post("/assessments/")
def create_assessment(user_id: int, type: str, numeric_value: float, db: Session = Depends(get_db)):
    new_assessment = Assessment(user_id=user_id, assessment_type=type, value_numeric=numeric_value)
    db.add(new_assessment)
    db.commit()
    db.refresh(new_assessment)
    return new_assessment

@app.get("/")
def home():
    return {"message": "Welcome to LungsApp Backend API"}
