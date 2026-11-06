@echo off
echo ============================================
echo Push to GitHub
echo ============================================
echo.

cd /d "C:\Users\ALESAEI\Desktop\Job Application\_Distribution"

set /p REPO_URL="Enter your GitHub repository URL: "

echo.
echo Adding remote repository...
git remote add origin %REPO_URL%

echo.
echo Pushing to GitHub...
git push -u origin main

echo.
echo ============================================
echo Repository published to GitHub!
echo ============================================
echo.
echo Your repository is now live at:
echo %REPO_URL%
echo.
echo Share with others:
echo   - Direct skill file: job-application-organizer.md
echo   - Full repo clone: git clone %REPO_URL%
echo   - Release download: Create a release on GitHub
echo.
pause
