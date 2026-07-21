@echo off
chcp 65001 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\github-sync.ps1" -Uninstall
echo.
echo GitHub auto-sync is disabled. Existing GitHub files are unchanged.
pause
