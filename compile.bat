@echo off
echo =======================================================
echo Compiling Online Stock Trading Platform (Java Backend)
echo =======================================================

if not exist "bin" mkdir "bin"

dir /s /b src\*.java > sources.txt
javac -encoding UTF-8 -d bin @sources.txt
del sources.txt

if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Compilation completed successfully! Output in bin/
) else (
    echo [ERROR] Compilation failed.
)
pause
