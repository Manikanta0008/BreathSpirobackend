import os
import django
from django.conf import settings

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'lungsapp_backend.settings')
django.setup()

from django.db import connections
from django.db.utils import OperationalError

db_conn = connections['default']
print(f"--- Database Configuration ---")
print(f"Engine: {settings.DATABASES['default']['ENGINE']}")
print(f"Name: {settings.DATABASES['default']['NAME']}")
print(f"User: {settings.DATABASES['default']['USER']}")
print(f"Host: {settings.DATABASES['default']['HOST']}")
print(f"Port: {settings.DATABASES['default']['PORT']}")

try:
    cursor = db_conn.cursor()
    print("\n[SUCCESS] Connection to database successful!")
    
    # List all tables to make sure we aren't missing anything
    cursor.execute("SHOW TABLES")
    tables = [t[0] for t in cursor.fetchall()]
    print(f"Tables found: {tables}")
    
    if 'api_userprofile' in tables:
        cursor.execute("SELECT COUNT(*) FROM api_userprofile")
        print(f"Total Users (api_userprofile): {cursor.fetchone()[0]}")
    
    if 'api_trainingsession' in tables:
        cursor.execute("SELECT COUNT(*) FROM api_trainingsession")
        print(f"Total Sessions (api_trainingsession): {cursor.fetchone()[0]}")
    else:
        print("[WARNING] api_trainingsession table not found! Maybe migration is missing?")

except OperationalError as e:
    print(f"\n[FAILURE] Connection failed: {e}")
except Exception as e:
    print(f"\n[ERROR] An unexpected error occurred: {e}")
