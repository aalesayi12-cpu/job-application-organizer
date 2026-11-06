@echo off
echo ============================================
echo GitHub Repository Setup
echo ============================================
echo.

cd /d "C:\Users\ALESAEI\Desktop\Job Application\_Distribution"

echo [1/6] Configuring Git...
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

echo [2/6] Initializing repository...
git init

echo [3/6] Adding files...
git add .

echo [4/6] Creating initial commit...
git commit -m "Initial release - Job Application Organizer v1.0.0"

echo [5/6] Setting main branch...
git branch -M main

echo.
echo [6/6] Repository initialized locally!
echo.
echo ============================================
echo NEXT STEPS:
echo ============================================
echo.
echo 1. Create a new repository on GitHub:
echo    → Visit: https://github.com/new
echo    → Name: job-application-organizer
echo    → Public repository
echo    → DO NOT initialize with README (already exists)
echo.
echo 2. Copy the repository URL (will look like):
echo    https://github.com/yourusername/job-application-organizer.git
echo.
echo 3. Run these commands:
echo    git remote add origin YOUR_REPO_URL
echo    git push -u origin main
echo.
echo Or run: push_to_github.bat after creating the repo
echo.
pause
