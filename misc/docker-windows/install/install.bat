@echo off
:: Get the directory of the currently executing batch file
setlocal
set scriptdir=%~dp0

:: Run the PowerShell script from the same directory
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%scriptdir%install.ps1"
endlocal
