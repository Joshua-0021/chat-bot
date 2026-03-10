@echo off
echo =======================================================
echo Starting SmartBot services...
echo =======================================================

echo Starting Frontend Server...
start cmd /k "cd /d "%~dp0frontend" && npm run dev"

echo Starting Rasa Action Server...
start cmd /k "cd /d "%~dp0backend" && call .venv\Scripts\activate.bat && rasa run actions"

echo.
echo Waiting 5 seconds before starting Rasa main server...
timeout /t 5 /nobreak >nul

echo Starting Rasa Main Server...
start cmd /k "cd /d "%~dp0backend" && call .venv\Scripts\activate.bat && rasa run -m models --enable-api --cors *"

echo.
echo =======================================================
echo All services are starting in separate windows.
echo  - Frontend:     http://localhost:5173
echo  - Rasa API:     http://localhost:5005
echo  - Rasa Actions: http://localhost:5055
echo =======================================================
