:: As an experiment, I had ChatGPT generate the majority of the code below. If
:: for any reason you do not wish to use this code, run-as-admin.cmd is made
:: completely by a human and does the exact same thing.
::
:: The only human-created pieces of this code are the addition of a main
:: section in order to make this script easier to work with as a script.

@echo off
setlocal EnableDelayedExpansion

:: Check if script is running as admin
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrative privileges.
    cd /d "%~dp0"
    goto main
) else (
    echo Requesting administrative privileges...
    set "params=%*"
    set "batchPath=%~f0"
    set "batchPath=!batchPath:%cd%\=!"
    set "vbsPath=%temp%\getadmin.vbs"
    echo Set UAC = CreateObject^("Shell.Application"^)>"!vbsPath!"
    echo UAC.ShellExecute "!batchPath!", "!params!", "", "runas", 1 >> "!vbsPath!"
    "%SystemRoot%\System32\WScript.exe" "!vbsPath!"
    exit /B
)

:main
    rem Replace this section with your code.