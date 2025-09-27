@echo off
echo ========================================
echo Starting MeCOGO...
echo ========================================
echo.
echo Opening MeCOGO in your browser...
echo URL: http://localhost:5173
echo.
echo Press Ctrl+C to stop the application
echo.

start http://localhost:5173
yarn dev
