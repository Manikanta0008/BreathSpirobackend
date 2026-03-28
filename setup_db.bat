@echo off
echo Cleaning up previous database and migrations...
del db.sqlite3
rmdir /s /q "api\migrations"
mkdir "api\migrations"
type nul > "api\migrations\__init__.py"

echo.
echo Running migrations...
python manage.py makemigrations api
python manage.py migrate

echo.
echo Database setup complete!
echo You can now run: python manage.py runserver
echo.
pause
