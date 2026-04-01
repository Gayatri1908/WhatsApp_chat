@ECHO OFF
SETLOCAL

SET "SCRIPT_DIR=%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%chat.ps1"
EXIT /B %ERRORLEVEL%
