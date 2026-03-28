import os
import django
import sys

# Set up Django environment
sys.path.append(os.path.join(os.getcwd(), 'lungsapp_backend'))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'lungsapp_backend.settings')

try:
    django.setup()
    from django.db import connections
    from api.models import UserProfile, TrainingSession
    
    print("\n=== Fetching Data from XAMPP (MySQL) ===")
    
    users = UserProfile.objects.all()
    print(f"\nTotal Registered Users: {users.count()}")
    for u in users:
        print(f"  - [{u.id}] {u.username} (Device: {u.device_id})")
        
    sessions = TrainingSession.objects.all().order_by('-created_at')
    print(f"\nTotal Training Sessions: {sessions.count()}")
    for s in sessions:
        print(f"  - [{s.id}] {s.username} | {s.completed_cycles}/{s.total_cycles} cycles | {s.session_duration_sec}s")

except Exception as e:
    print(f"\n[ERROR] Could not read database: {e}")
    print("Tip: Ensure XAMPP MySQL is running and you have run migrations.")
