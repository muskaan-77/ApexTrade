@echo off
title ApexTrade - Online Stock Trading Platform
echo =================================================================
echo   APEX STOCK TRADING PLATFORM
echo   Backend: Java 26 Native Architecture
echo   Zero External Dependencies Required
echo =================================================================

if not exist "bin" mkdir "bin"

echo [1/2] Compiling Java source files...
dir /s /b src\*.java > sources.txt
javac -encoding UTF-8 -d bin @sources.txt
del sources.txt

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Compilation failed. Please ensure JDK is installed.
    pause
    exit /b %ERRORLEVEL%
)

echo [2/2] Launching ApexTrade Server on port 8080...
echo.
echo >> Open your browser at: http://localhost:8080
echo.

start "" "http://localhost:8080"
java -cp bin com.stocktrading.Main 8080

pause
