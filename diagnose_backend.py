import os
import django
from django.conf import settings
import sys

# Set up Django environment
sys.path.append(os.path.join(os.getcwd(), 'lungsapp_backend'))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'lungsapp_backend.settings')

try:
    django.setup()
    from django.db import connections
    from django.db.utils import OperationalError
    
    db_conn = connections['default']
    print(f"--- Backend Diagnostic ---")
    print(f"Target Database: {settings.DATABASES['default']['NAME']}")
    print(f"Engine: {settings.DATABASES['default']['ENGINE']}")
    
    try:
        cursor = db_conn.cursor()
        print("[OK] Successfully connected to MySQL via XAMPP.")
        
        cursor.execute("SHOW TABLES")
        tables = [t[0] for t in cursor.fetchall()]
        
        required_tables = ['api_userprofile', 'api_trainingsession']
        for table in required_tables:
            if table in tables:
                cursor.execute(f"SELECT COUNT(*) FROM {table}")
                count = cursor.fetchone()[0]
                print(f"[OK] Table '{table}' found. Rows: {count}")
            else:
                print(f"[ERROR] Table '{table}' MISSING! Migration needed.")
                
    except OperationalError as e:
        print(f"[ERROR] Connection failed: {e}")
        print("\nPossible fixes:")
        print("1. Ensure XAMPP is running (MySQL module).")
        print("2. Ensure database 'breathspiro_db' exists in phpMyAdmin.")
        print("3. Check if 'mysqlclient' or 'pymysql' is installed.")
        
except Exception as e:
    print(f"[CRITICAL] Startup error: {e}")
