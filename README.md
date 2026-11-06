# Job Application Organizer

**Automated job application management system** — organize, track, and auto-apply to jobs via LinkedIn and Indeed. Built for Claude Code with standalone Python execution support.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)

---

## 🚀 Features

- ✅ **Auto-Apply**: Searches LinkedIn for matching jobs, auto-fills Easy Apply forms
- ✅ **Smart Tracking**: Excel tracker with color-coded statuses (Offer/Rejected/Interview/Applied)
- ✅ **Auto-Organization**: Creates company folders, generates cover letters, archives stale apps
- ✅ **Daily Reports**: Application statistics and next-action recommendations
- ✅ **Claude Integration**: Run as `/job-application-organizer` skill in Claude Code
- ✅ **Duplicate Detection**: Won't reapply to same company within 90 days
- ✅ **Human-Like**: Randomized typing delays and cooldown periods
- ✅ **Configurable**: Daily limits, keyword filters, multiple platforms

---

## 📦 Quick Start

### Method 1: Claude Code Skill (Recommended)

1. **Download skill file**: [`job-application-organizer.md`](job-application-organizer.md)
2. **Install**: Copy to `~/.claude/skills/` (Windows: `C:\Users\[USERNAME]\.claude\skills\`)
3. **Restart Claude** or run `/help`
4. **Run**: `/job-application-organizer setup`

### Method 2: Standalone Python

1. **Clone repository**:
   ```bash
   git clone https://github.com/yourusername/job-application-organizer.git
   cd job-application-organizer
   ```

2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Download ChromeDriver**: [https://chromedriver.chromium.org/](https://chromedriver.chromium.org/)

4. **Configure**: Edit `_System/auto_apply_config.json` with your info

5. **Run**:
   ```bash
   # Windows
   run_full_system.bat
   
   # Mac/Linux
   python _System/integrated_job_system.py
   ```

---

## 🛠️ Installation

### Requirements

- Python 3.8+
- Google Chrome browser
- ChromeDriver (matching your Chrome version)
- Windows 10/11 (Mac/Linux compatible with path adjustments)

### Dependencies

```bash
pip install selenium openpyxl schedule pyautogui
```

Or use the included `setup_system.bat` (Windows) to install automatically.

### Configuration

Edit `_System/auto_apply_config.json`:

```json
{
  "user_info": {
    "full_name": "Your Name",
    "email": "your.email@example.com",
    "phone": "+1234567890",
    "linkedin": "https://linkedin.com/in/yourprofile",
    "location": "City, State",
    "years_experience": "5",
    "field": "software engineering"
  },
  "job_preferences": {
    "titles": ["Software Engineer", "Backend Developer"],
    "locations": ["Remote", "New York", "San Francisco"],
    "experience_levels": ["Mid-Level", "Senior"],
    "employment_types": ["Full-time", "Contract"]
  },
  "platforms": {
    "linkedin": {
      "enabled": true,
      "username": "your.email@example.com",
      "password": "your_password"
    }
  },
  "application_limits": {
    "daily_max": 20,
    "per_platform_max": 10,
    "cooldown_seconds": 30
  }
}
```

Add your resume: `_Templates/resume.pdf`

---

## 📖 Usage

### Claude Code Commands

```bash
/job-application-organizer setup    # Initial configuration
/job-application-organizer apply    # Auto-apply to jobs
/job-application-organizer track    # Update tracker only
/job-application-organizer full     # Apply + track + report
/job-application-organizer status   # Show current stats
```

### Standalone Execution

**Windows:**
```bash
run_full_system.bat         # Manual: Apply + track + report
run_tracker_only.bat        # Manual: Track existing apps only
start_scheduler.bat         # Automated: Runs daily at 9 AM
```

**Mac/Linux:**
```bash
python _System/integrated_job_system.py      # Full pipeline
python _System/job_tracker.py                # Tracker only
python _System/schedule_full_system.py       # Daily scheduler
```

---

## 📁 Folder Structure

```
job-application-organizer/
├── _System/                      # Core automation scripts
│   ├── job_auto_applier.py       # LinkedIn auto-apply engine
│   ├── job_tracker.py            # Excel tracker generator
│   ├── integrated_job_system.py  # Full pipeline orchestrator
│   ├── schedule_full_system.py   # Daily scheduler
│   └── auto_apply_config.json    # Configuration file
├── _Templates/                   # Resume & cover letter templates
│   ├── cover_letter_template.txt
│   └── resume.pdf                # Add your resume here
├── _Reports/                     # Generated outputs
│   ├── Job_Tracker.xlsx          # Master Excel tracker
│   └── Daily_Report_*.txt        # Daily summaries
├── _Archive/                     # Stale applications (45+ days)
├── _Pending/                     # Incomplete applications
└── [Company_YYYYMMDD]/           # Auto-generated per application
```

---

## 🎯 How It Works

1. **Search**: System searches LinkedIn for jobs matching your titles/locations
2. **Filter**: Applies keyword filters and duplicate detection
3. **Apply**: Auto-fills Easy Apply forms with your info, uploads resume
4. **Document**: Creates company folder with resume + generated cover letter
5. **Track**: Updates Excel tracker with color-coded statuses
6. **Archive**: Moves stale applications (45+ days) to archive
7. **Report**: Generates daily summary with stats and next actions

---

## 🔒 Safety Features

- ✅ Daily application limits (default: 20) to avoid detection
- ✅ Human-like typing delays (randomized 50-150ms per character)
- ✅ Cooldown periods between applications (30+ seconds)
- ✅ Duplicate detection (won't reapply within 90 days)
- ✅ LinkedIn login handled separately (not automated)
- ✅ No credentials stored in distributed files

---

## 📊 Outputs

### Excel Tracker (`_Reports/Job_Tracker.xlsx`)
- Complete application list
- Color-coded statuses:
  - 🟢 **Green** = Offer Received
  - 🔴 **Red** = Rejected
  - 🟠 **Orange** = Interview Scheduled
  - ⚪ **Gray** = No Response (30+ days)
- Days since last activity
- Missing documents flagged

### Daily Reports (`_Reports/Daily_Report_[date].txt`)
- Application count by status
- Incomplete applications
- Recommended next actions

### Application Log (`_System/applied_log.json`)
- Full history of all applications
- Used for duplicate detection
- Track progress over time

---

## 🛠️ Troubleshooting

### ChromeDriver Not Found
- Download from [https://chromedriver.chromium.org/](https://chromedriver.chromium.org/)
- Match your Chrome version: `chrome://settings/help`
- Add to PATH or place in `C:\Windows\System32\`

### LinkedIn Login Failed
- Login manually first in Chrome
- Check credentials in `auto_apply_config.json`
- LinkedIn may require 2FA — handle manually first time

### Module Not Found
- Run: `pip install selenium openpyxl schedule pyautogui`
- Or: `setup_system.bat` (Windows)

### Daily Limit Reached
- System hit configured `daily_max` (default: 20)
- Change in `auto_apply_config.json` or wait until tomorrow
- Run tracker-only: `run_tracker_only.bat`

---

## 🔧 Customization

### Add More Job Titles
Edit: `auto_apply_config.json` → `job_preferences` → `titles`

### Change Daily Limit
Edit: `auto_apply_config.json` → `application_limits` → `daily_max`

### Modify Cover Letter Template
Edit: `_Templates/cover_letter_template.txt`

### Change Archive Threshold (default: 45 days)
Edit: `_System/job_tracker.py` → `archive_old_applications(days_threshold=45)`

---

## 🗓️ Roadmap

### v1.1.0 (Planned)
- Indeed full automation
- Greenhouse ATS integration
- Lever ATS integration
- Email follow-up automation

### v1.2.0 (Planned)
- Web dashboard
- AI-powered cover letter customization
- Resume tailoring per job posting
- Interview scheduler integration

See [CHANGELOG.md](CHANGELOG.md) for full version history.

---

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

Free to use, modify, and distribute.

---

## 🤝 Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📧 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/job-application-organizer/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/job-application-organizer/discussions)

---

## ⚠️ Disclaimer

This tool automates job applications for personal use. Users are responsible for:
- Ensuring compliance with platform Terms of Service
- Reviewing applications before submission
- Following up on applications appropriately
- Respecting daily application limits

Use responsibly and ethically.

---

## 🌟 Star History

If this project helped you land a job, consider giving it a star! ⭐

---

**Version**: 1.0.0  
**Released**: 2026-11-06  
**Maintained by**: [Your Name]
