@echo off
setlocal

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SharedAccess" /v "EnableRebootPersistConnection" /t REG_DWORD /d 1 /f

sc config SharedAccess start=auto

echo Configuration completed successfully. The computer will reboot in 1 minute to apply changes.

timeout /t 60
shutdown /r /t 0

:end