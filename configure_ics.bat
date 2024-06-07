@echo off
setlocal

>nul 2>&1 net session
if %errorLevel% neq 0 (
    echo Administrator privileges required. Please relaunch the script as an administrator.
    pause
    exit /b
)

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SharedAccess" /v "EnableRebootPersistConnection" /t REG_DWORD /d 1 /f
if %errorLevel% neq 0 (
    echo Error: Failed to add registry key.
    pause
    exit /b
)

sc config SharedAccess start=auto
if %errorLevel% neq 0 (
    echo Error: Failed to configure service.
    pause
    exit /b
)

echo Configuration completed successfully. The computer will reboot in 1 minute to apply changes.

timeout /t 60
shutdown /r /t 0