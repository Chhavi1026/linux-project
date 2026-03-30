# OSS Audit — Python
### Open Source Software Capstone Project | VIT NGMC

| Field | Detail |
|---|---|
| **Student Name** | Chhavi Mangalwaniya |
| **Registration No** | 24BAI10296 |
| **Course** | Open Source Software (NGMC) |
| **Chosen Software** | Python (PSF Licence) |

---

## About This Project

This repository contains the shell scripts for the Open Source Audit capstone project. The subject of the audit is **Python** — one of the most widely used open-source programming languages in the world, governed by the Python Software Foundation and released under the permissive PSF Licence.

---

## Repository Contents

```
oss-audit-24BAI10296/
├── script1_system_identity.sh        # System welcome screen with OS and licence info
├── script2_package_inspector.sh      # FOSS package checker with case-based notes
├── script3_disk_permission_auditor.sh# Directory permissions and disk usage auditor
├── script4_log_analyzer.sh           # Log file keyword counter and summariser
├── script5_manifesto_generator.sh    # Interactive open source manifesto generator
└── README.md                         # This file
```

---

## Script Descriptions

### Script 1 — System Identity Report
Displays a formatted system welcome screen showing the Linux distribution, kernel version, current user and home directory, system uptime, current date/time, and the open-source licence covering the OS.

**Concepts used:** variables, `echo`, command substitution `$()`, `uname`, `whoami`, `hostname`, `date`, `uptime`, conditional distro detection via `/etc/os-release`.

### Script 2 — FOSS Package Inspector
Checks whether Python (`python3`) is installed on the system using either `dpkg` (Debian/Ubuntu) or `rpm` (Fedora/RHEL). Displays version, licence, and summary information. Uses a `case` statement to print a philosophical note about several FOSS packages.

**Concepts used:** `if-then-else`, `case` statement, `dpkg`/`rpm`, `grep`, `command -v`, pipe operators.

### Script 3 — Disk and Permission Auditor
Loops through a predefined list of system directories and Python installation directories, reporting permissions, owner, group, and disk usage for each. Uses `ls -ld` and `awk` to extract fields.

**Concepts used:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`, directory existence check with `[ -d ]`.

### Script 4 — Log File Analyzer
Reads a log file line by line, counts how many lines contain a given keyword (default: `error`), and prints the last 5 matching lines. Includes retry logic if the file is not found.

**Concepts used:** `while read` loop, `if-then-else`, counter variables, `$1` and `$2` command-line arguments, `grep -i`, `tail`, retry loop with `read` for user input.

### Script 5 — Open Source Manifesto Generator
Asks the user three interactive questions and composes a personalised open source philosophy statement using their answers, saving it to a timestamped `.txt` file.

**Concepts used:** `read` for interactive input, string concatenation, writing to file with `>` and `>>`, `date` command, input validation, alias concept demonstrated via comment.

---

## How to Run on Linux

### Step 1 — Clone the repository
```bash
git clone https://github.com/<your-username>/oss-audit-24BAI10296.git
cd oss-audit-24BAI10296
```

### Step 2 — Make scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_permission_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run each script

```bash
# Script 1: System identity report
./script1_system_identity.sh

# Script 2: Package inspector
./script2_package_inspector.sh

# Script 3: Disk and permission auditor
./script3_disk_permission_auditor.sh

# Script 4: Log file analyzer (provide a log file path)
./script4_log_analyzer.sh /var/log/syslog error
# Or with a custom keyword:
./script4_log_analyzer.sh /var/log/auth.log failed

# Script 5: Manifesto generator (interactive)
./script5_manifesto_generator.sh
```

---

## Dependencies

All scripts use only standard Linux utilities — no external packages need to be installed:

| Utility | Purpose | Available on |
|---|---|---|
| `bash` | Shell interpreter | All Linux distros |
| `uname` | Kernel/OS info | All Linux distros |
| `whoami`, `hostname` | User/host info | All Linux distros |
| `date`, `uptime` | Time/uptime | All Linux distros |
| `dpkg` | Package info | Debian/Ubuntu |
| `rpm` | Package info | Fedora/RHEL/CentOS |
| `ls`, `du`, `df` | File/disk info | All Linux distros |
| `grep`, `awk`, `cut` | Text processing | All Linux distros |
| `python3` | Runtime version check | Must be installed |

---

## Notes

- Scripts are tested on Ubuntu 22.04 LTS and Fedora 38.
- Script 4 requires a readable log file. On systems where `/var/log/syslog` is not present, use `/var/log/messages` or any plain-text log file.
- Script 5 generates a file named `manifesto_<username>.txt` in the current directory.

---

*VIT | Open Source Software NGMC | 2024–25*
