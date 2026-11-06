@echo off
echo ============================================
echo Creating Distribution Bundle
echo ============================================
echo.

set VERSION=v1.0.0
set BUNDLE_NAME=JobApplicationOrganizer_%VERSION%.zip

cd /d "%~dp0.."

echo [1/4] Copying skill file...
copy "C:\Users\ALESAEI\.claude\skills\job-application-organizer.md" "_Distribution\" >nul

echo [2/4] Creating clean config template...
powershell -Command "(Get-Content '_System\auto_apply_config.json') -replace '\"full_name\": \".*\"', '\"full_name\": \"Your Name\"' -replace '\"email\": \".*\"', '\"email\": \"your.email@example.com\"' -replace '\"phone\": \".*\"', '\"phone\": \"+1234567890\"' -replace '\"linkedin\": \".*\"', '\"linkedin\": \"https://linkedin.com/in/yourprofile\"' -replace '\"username\": \".*\"', '\"username\": \"\"' -replace '\"password\": \".*\"', '\"password\": \"\"' | Set-Content '_Distribution\_System\auto_apply_config.json.template'"

echo [3/4] Copying system files...
robocopy "_System" "_Distribution\_System" *.py /NFL /NDL /NJH /NJS >nul
robocopy "_Templates" "_Distribution\_Templates" cover_letter_template.txt /NFL /NDL /NJH /NJS >nul
copy "*.bat" "_Distribution\" >nul
copy "README.txt" "_Distribution\" >nul

echo [4/4] Creating ZIP archive...
powershell -Command "Compress-Archive -Path '_Distribution\*' -DestinationPath '_Distribution\%BUNDLE_NAME%' -Force"

echo.
echo ============================================
echo Bundle created: _Distribution\%BUNDLE_NAME%
echo ============================================
echo.
echo Contents:
echo   - job-application-organizer.md (Claude skill)
echo   - All Python scripts
echo   - Batch launchers
echo   - Documentation
echo   - License and changelog
echo.
echo Ready to share!
pause
