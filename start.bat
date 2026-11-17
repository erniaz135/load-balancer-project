@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo Запуск трех веб-серверов и балансировщика...
docker compose up -d
if errorlevel 1 (
    echo.
    echo Не удалось запустить проект. Проверьте, что Docker Desktop запущен.
    pause
    exit /b 1
)

echo.
docker compose ps
echo.
echo Открываю http://localhost:8080
start "" "http://localhost:8080"
echo.
echo Для проверки распределения запустите scripts\test-load-balancing.ps1
pause
