@echo off
chcp 65001 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\github-sync.ps1" -Install
echo.
echo GitHub auto-sync is enabled and will start automatically after Windows login.
pause
