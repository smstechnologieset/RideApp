@echo off
setlocal
cd /d "%~dp0"
title ZemenGo Admin Demo
where npm.cmd >nul 2>nul
if errorlevel 1 (
  echo Node.js and npm are required. See README.md.
  pause
  exit /b 1
)
if not exist "node_modules\vite\bin\vite.js" (
  echo Installing the project's locked dependencies...
  call npm.cmd ci
  if errorlevel 1 (
    pause
    exit /b 1
  )
)
if not exist "dist\index.html" (
  echo Building the admin demo...
  call npm.cmd run build
  if errorlevel 1 (
    pause
    exit /b 1
  )
)
echo.
echo ZemenGo Admin Demo
echo Open http://127.0.0.1:5173/ in your browser.
echo Keep this window open during the presentation. Press Ctrl+C to stop.
echo If the port is already in use, the demo may already be running.
echo.
call npm.cmd run demo
if errorlevel 1 pause
