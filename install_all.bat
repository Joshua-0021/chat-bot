@echo off
echo =======================================================
echo Setting up SmartBot UI (Frontend) and SmartRail Bot (Backend)
echo =======================================================

echo.
echo [1/2] Installing Frontend Dependencies...
cd frontend
call npm install
cd ..

echo.
echo [2/2] Setting up Backend Virtual Environment and Dependencies...
cd backend
if not exist ".venv" (
    echo Creating Python 3.10 virtual environment (required for Rasa)...
    py -3.10 -m venv .venv
)
echo Activating virtual environment...
call .venv\Scripts\activate.bat
echo Installing Rasa and its dependencies...
pip install rasa
cd ..

echo.
echo =======================================================
echo Installation Complete!
echo You can now use start_all.bat to run the application.
echo =======================================================
pause
