@echo off
echo ============================================
echo   Starting All Services
echo ============================================
echo.

:: Start AI Service in new window
echo [1/2] Starting AI Service (Python)...
start "AI Service" cmd /c "cd ai_service && call venv\Scripts\activate.bat && python main.py"

:: Wait for AI service to start
echo Waiting for AI service to initialize...
timeout /t 5 /nobreak >nul

:: Start Node.js Backend in new window
echo [2/3] Starting Node.js Backend...
start "Node Backend" cmd /c "cd backend && npm run dev"

:: Start React Frontend in new window
echo [3/3] Starting React Frontend...
start "React Frontend" cmd /c "cd frontend && npm run dev"

echo.
echo ============================================
echo   Services Started!
echo ============================================
echo.
echo AI Service:    http://localhost:5000
echo Node Backend:  http://localhost:5177
echo.
echo Close the command windows to stop services.
echo.
pause

