@echo off
echo ========================================
echo MeCOGO - Easy Setup Script
echo ========================================
echo.

echo Checking if Node.js is installed...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js is not installed. Please install it from: https://nodejs.org
    echo Then run this script again.
    pause
    exit /b 1
)

echo Node.js found!
echo.

echo Checking if Yarn is installed...
yarn --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Installing Yarn...
    npm install -g yarn
)

echo Yarn is ready!
echo.

echo Installing MeCOGO dependencies...
yarn install
if %errorlevel% neq 0 (
    echo Failed to install dependencies.
    pause
    exit /b 1
)

echo.
echo ========================================
echo MeCOGO Setup Complete!
echo ========================================
echo.
echo To start MeCOGO:
echo 1. Double-click 'start-mecogo.bat'
echo 2. Or run: yarn dev
echo.
echo The application will open at: http://localhost:5173
echo.
pause
