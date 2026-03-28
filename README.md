# Backend Production Manifest

These are the essential files required to deploy your backend in a production environment:

| File | Purpose |
| :--- | :--- |
| `main.py` | FastAPI application and API routes |
| `models.py` | SQLAlchemy database models |
| `database.py` | MySQL database connection setup |
| `.env` | Environment variables (Database URL, Secrets) |
| `requirements.txt` | Python dependencies with pinned versions |
| `Dockerfile` | Container configuration for standard deployment |
| `.dockerignore` | Files to exclude from Docker builds |
| `gunicorn_conf.py` | Configuration for the production-grade server |
| `Procfile` | Deployment instructions for platforms like Heroku |

---

# Backend Environment Setup Walkthrough

I have successfully set up the development environment for your FastAPI backend.

## Changes Made

### Virtual Environment
- Created a Python virtual environment in `backend/venv`.
- Installed all dependencies listed in `requirements.txt`.
- Added `python-dotenv` to `requirements.txt` for environment variable management.

### Configuration
- Created a `.env` file with default settings:
    - `DATABASE_URL`: `sqlite:///./lungsapp.db`
    - `DEBUG`: `True`
- Updated `database.py` to load the database URL from the `.env` file using `python-dotenv`.
- Updated `.gitignore` and `.dockerignore` to **include** the `.env` file (it is no longer ignored).

## Verification Results

### Dependency Check
I verified that all required packages are installed in the virtual environment.
```text
Package           Version
----------------- -------
fastapi           0.135.2
uvicorn           0.42.0
sqlalchemy        2.0.48
pydantic          2.12.5
python-dotenv     1.2.2
gunicorn          25.3.0
pymysql           1.1.2
cryptography      46.0.6
django            6.0a1
djangorestframework 3.15.2
django-cors-headers 4.7.0
```

### Server Execution
I successfully started the FastAPI server using the new environment.
```text
INFO:     Will watch for changes in these directories: ['C:\Users\ru\AndroidStudioProjects\LungsApp\backend']
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     Started reloader process [11964] using StatReload
INFO:     Started server process [16020]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```

## MySQL Migration

The backend is now fully integrated with **MySQL** for production-grade data storage.

### Changes
- **Dependencies**: Added `pymysql` and `cryptography` to `requirements.txt`.
- **Configuration**: Updated `.env` to use the MySQL connection string: `mysql+pymysql://root:@127.0.0.1:3306/breathspiro_db`.
- **Database Engine**: Refactored `database.py` to support MySQL and included `pool_pre_ping=True` to handle connection timeouts.

## Production Readiness

I have also prepared the backend for production deployment.

### 1. CORS Configuration
- Added `CORSMiddleware` to `main.py` to allow the React frontend to communicate with the API.
- Configured default origins: `http://localhost:3000`, `http://127.0.0.1:3000`, and `http://localhost:5173`.

### 2. Production Server (Gunicorn)
- Added `gunicorn` and `uvicorn[standard]` to `requirements.txt`.
- Created `gunicorn_conf.py` for optimized production settings (auto-calculates workers based on CPU cores).
- Added a `Procfile` for platforms like Heroku.

### 3. Containerization (Docker)
- Created a `Dockerfile` for easy deployment to any cloud provider.
- Added a `.dockerignore` to keep the image slim.

## How to run in Production

### Using Docker (Recommended)
```bash
docker build -t lungsapp-backend .
docker run -p 8000:8000 lungsapp-backend
```

### Using Gunicorn (Linux only)
```bash
gunicorn -k uvicorn.workers.UvicornWorker -c gunicorn_conf.py main:app
```

## Final Security Recommendations

Before you go live, please consider these final security improvements:

1.  **Secrets Management**: Use GitHub Secrets or AWS Secrets Manager to store your `.env` values in production instead of checking them into Git.
2.  **Password Hashing**: If you add a user login system (email/password), use a library like `passlib[bcrypt]` to hash passwords. **Never store passwords as plain text.**
3.  **SSL/TLS**: Always use **HTTPS** for your production API to encrypt data in transit.
4.  **Database Access**: Use a dedicated, low-privilege database user for the app instead of the `root` user in production.

---

> [!NOTE]
> Gunicorn is a WSGI/ASGI server for Unix/Linux. For local Windows development, continue using `uvicorn main:app --reload`.
