---
description: Automated job application system - organize, track, and auto-apply to jobs
runInSubagent: false
---

# Job Application Organizer

Complete automated job application management system. Organizes existing applications, tracks status in Excel, auto-applies to new jobs on LinkedIn/Indeed, generates cover letters, and produces daily reports.

## What This Skill Does

1. **Auto-Apply**: Searches LinkedIn for jobs matching your criteria, auto-fills Easy Apply forms, uploads resume, generates tailored cover letters
2. **Track**: Scans all application folders, builds Excel tracker with color-coded statuses, identifies incomplete applications
3. **Organize**: Archives stale applications (45+ days), maintains clean folder structure
4. **Report**: Generates daily summary reports with application counts, status breakdown, and next actions

## Usage

```
/job-application-organizer setup
/job-application-organizer apply
/job-application-organizer track
/job-application-organizer full
/job-application-organizer status
```

## Commands

- `setup` - Initial configuration and dependency installation
- `apply` - Run auto-application engine (LinkedIn/Indeed)
- `track` - Update Excel tracker and generate reports (no new applications)
- `full` - Complete pipeline: apply + track + report
- `status` - Show current application statistics

## System Requirements

- Python 3.8+
- Chrome browser
- ChromeDriver (https://chromedriver.chromium.org/)
- Packages: selenium, openpyxl, schedule, pyautogui

## Configuration

Edit `_System/auto_apply_config.json`:
- `user_info`: Name, email, phone, LinkedIn profile
- `job_preferences`: Target titles, locations, experience levels
- `platforms`: LinkedIn/Indeed credentials
- `application_limits`: Daily max (default: 20), per-platform max (default: 10)
- `filters`: Exclude/require keywords, salary range

## Folder Structure

```
Job Application/
├── _System/           Core scripts + config
├── _Templates/        Resume + cover letter template
├── _Reports/          Excel tracker + daily reports
├── _Archive/          Stale applications (45+ days)
├── _Pending/          Incomplete applications
└── [Company_Date]/    Auto-generated per application
```

## Instructions

When invoked, determine the command from the user's request or args:

### setup
1. Check if system exists at `C:\Users\ALESAEI\Desktop\Job Application\_System`
2. If missing, deploy the complete system (use the full deployment code from the initial build)
3. Run `setup_system.bat` to install dependencies
4. Guide user to:
   - Download ChromeDriver
   - Edit `auto_apply_config.json` with their info
   - Add resume to `_Templates/resume.pdf`
5. Verify configuration is complete before proceeding

### apply
1. Verify system is configured (config file exists, resume exists)
2. Run `job_auto_applier.py` from `_System` directory
3. Report: applications submitted, companies applied to, errors encountered
4. Show path to Excel tracker for review

### track
1. Run `job_tracker.py` from `_System` directory
2. Report: total applications, status breakdown, incomplete count, archived count
3. Show paths to Excel tracker and latest daily report

### full
1. Run `integrated_job_system.py` from `_System` directory (applies + tracks)
2. Report complete summary with all metrics
3. Show paths to outputs

### status
1. Load and parse `_System/applied_log.json`
2. Load and scan application folders
3. Report:
   - Total applications (all time)
   - Applications today
   - Applications this week
   - Status breakdown
   - Recent applications (last 5)
   - Incomplete applications
4. Show path to Excel tracker

## Error Handling

- If ChromeDriver missing: guide to download page
- If config missing fields: show which fields need values
- If resume missing: show exact path where it should be placed
- If LinkedIn login fails: suggest manual login first, then re-run
- If daily limit reached: report count and suggest running tracker-only

## Output Format

Always report in this structure:
```
[COMMAND] Results
==================
Metric 1: value
Metric 2: value
...

Outputs:
  → Path to Excel tracker
  → Path to daily report (if generated)
  
Next Steps: [if applicable]
```

## Notes

- System respects daily limits (default: 20) to avoid detection
- Human-like typing delays and randomized intervals built in
- Duplicate detection: won't reapply to same company within 90 days
- Archives applications automatically after 45 days of no activity
- Cover letters auto-generated from template with company/position substitution
- Excel tracker color-coded: Green=Offer, Red=Rejected, Orange=Interview, Gray=No Response
