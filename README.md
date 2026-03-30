# 🐍 The Open Source Audit — Python

> **VIT | Open Source Software (NGMC) — Capstone Project**

---

<div align="center">

| Field | Detail |
|:---|:---|
| 👩‍💻 **Student Name** | Chhavi Mangalwaniya |
| 🎓 **Registration No** | 24BAI10296 |
| 📚 **Course** | Open Source Software — NGMC |
| 🖥️ **Software Audited** | Python (PSF Licence) |
| 📅 **Submission Date** | 31st March 2026 |

</div>

---

## 📌 About This Project

This repository is the complete submission for the **Open Source Audit Capstone Project**. The subject of the audit is **Python** — one of the world's most widely used open-source programming languages, governed by the Python Software Foundation (PSF) and released under the permissive PSF Licence.

The project consists of:
- A **14-page written report** (PDF) covering Python's origin, licence, philosophy, Linux footprint, ecosystem, and a comparison with its proprietary alternative (MATLAB)
- **Five shell scripts** that demonstrate practical Linux and Bash scripting skills connected to the themes of the audit

---

## 📁 Repository Structure

```
oss-audit-24BAI10296/
│
├── 📄 README.md                                          ← You are here
├── 📋 OSS_Audit_Report_24BAI10296_ChhaviMangalwaniya.pdf ← Full project report
│
├── 🔧 script1_system_identity.sh                        ← System welcome screen
├── 🔧 script2_package_inspector.sh                      ← FOSS package checker
├── 🔧 script3_disk_permission_auditor.sh                 ← Directory auditor
├── 🔧 script4_log_analyzer.sh                           ← Log file analyser
└── 🔧 script5_manifesto_generator.sh                    ← Manifesto generator
```

---

## 📜 Script Descriptions

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`

Displays a formatted system welcome screen containing:
- Linux distribution name (auto-detected from `/etc/os-release`)
- Kernel version and system architecture
- Currently logged-in user and their home directory
- System uptime and current date/time
- The open-source licence covering the OS and Python

**Shell concepts demonstrated:**
`variables` · `command substitution $()` · `echo` · `if [ -f ]` · `grep -oP` · `uname` · `whoami` · `date` · `uptime`

---

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`

Checks whether `python3` is installed on the system. Automatically detects whether the system uses `dpkg` (Debian/Ubuntu) or `rpm` (Fedora/RHEL) and queries the appropriate package manager. Uses a `case` statement to print open-source philosophy notes for several well-known FOSS packages.

**Shell concepts demonstrated:**
`if-then-else` · `case` statement · `dpkg -l` · `rpm -qi` · `grep -E` · `command -v` · pipe operators · `&>/dev/null`

---

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_permission_auditor.sh`

Loops through two arrays of directories — standard system directories and Python-specific installation paths — and reports permissions, owner, group, and disk usage for each. Falls back to Python's own `sysconfig` if standard paths are not found.

**Shell concepts demonstrated:**
`for` loop · bash arrays · `ls -ld` · `awk` field extraction · `du -sh` · `printf` for formatted output · `[ -d ]` directory check · `2>/dev/null`

---

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`

**Usage:**
```bash
./script4_log_analyzer.sh <logfile> [keyword]
```

Reads a log file line by line, counting how many lines contain a specified keyword (default: `error`). Includes retry logic if the file is not found, prints the last 5 matching lines, and outputs a severity verdict based on the count.

**Shell concepts demonstrated:**
`while IFS= read -r` loop · `$1` and `$2` positional arguments · counter variables · arithmetic expansion `$(())` · retry loop (do-while style) · `grep -i` · `tail` · tiered `if-then-else` verdict

---

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto_generator.sh`

An interactive script that asks the user three questions, then composes a personalised open-source philosophy statement using their answers. Saves the manifesto to a `.txt` file named after the current user with a date/time stamp.

**Shell concepts demonstrated:**
`read -p` interactive input · input validation with `[ -z ]` · string concatenation · writing to file with `>` and `>>` · `date` formatting · `cat` to display output · alias concept (commented demonstration)

---

## ⚙️ How to Run

### Prerequisites

- A Linux system (Ubuntu, Fedora, Debian, or similar)
- Bash shell (pre-installed on all Linux distros)
- `python3` installed (for Script 2's runtime check)

### Step 1 — Clone the repository

```bash
git clone https://github.com/<your-username>/oss-audit-24BAI10296.git
cd oss-audit-24BAI10296
```

### Step 2 — Make all scripts executable

```bash
chmod +x *.sh
```

### Step 3 — Run each script

```bash
# Script 1: System identity report (no arguments needed)
./script1_system_identity.sh

# Script 2: FOSS package inspector (no arguments needed)
./script2_package_inspector.sh

# Script 3: Disk and permission auditor (no arguments needed)
./script3_disk_permission_auditor.sh

# Script 4: Log file analyser — provide a log file path and optional keyword
./script4_log_analyzer.sh /var/log/syslog error

# With a custom keyword:
./script4_log_analyzer.sh /var/log/auth.log failed

# Script 5: Manifesto generator — fully interactive, follow the prompts
./script5_manifesto_generator.sh
```

---

## 🧰 Dependencies

All scripts use only **standard Linux utilities** — no additional packages need to be installed beyond what ships with any Linux distribution.

| Utility | Purpose | Notes |
|:---|:---|:---|
| `bash` | Shell interpreter | Pre-installed everywhere |
| `uname` | Kernel and architecture info | GNU coreutils |
| `whoami`, `hostname` | User and host identification | GNU coreutils |
| `date`, `uptime` | Time and uptime display | GNU coreutils |
| `ls`, `du` | File and disk information | GNU coreutils |
| `grep`, `awk`, `cut` | Text processing | GNU coreutils / gawk |
| `printf`, `echo` | Formatted output | Shell built-ins |
| `dpkg` | Package info on Debian/Ubuntu | Debian systems only |
| `rpm` | Package info on Fedora/RHEL | RPM-based systems only |
| `python3` | Runtime version check (Script 2) | Must be installed |

> **Note:** Scripts 1–3 and 5 run without `python3` installed. Script 2 will report that python3 is not installed if it is absent — that is expected behaviour, not an error.

---

## 🖥️ Tested On

| Distribution | Version | Status |
|:---|:---|:---|
| Ubuntu | 22.04 LTS | ✅ Tested |
| Fedora | 38 | ✅ Compatible |
| Debian | 12 (Bookworm) | ✅ Compatible |
| CentOS Stream | 9 | ✅ Compatible |

---

## 📝 Notes

- **Script 4** requires a readable plain-text log file. On systems where `/var/log/syslog` does not exist (e.g., Fedora), use `/var/log/messages` or `/var/log/dnf.log` instead.
- **Script 5** creates a file named `manifesto_<your-username>.txt` in the current working directory.
- Scripts auto-detect the package manager (`dpkg` vs `rpm`) so they work across Debian and RPM-based distros without modification.

---

## 📖 Report Summary

The full written report (`OSS_Audit_Report_24BAI10296_ChhaviMangalwaniya.pdf`) covers:

| Section | Content |
|:---|:---|
| **Part A — Origin & Philosophy** | Python's origin story, PSF licence analysis, four software freedoms, ethics of open source |
| **Part B — Linux Footprint** | Installation methods, key directories, user/group model, service management, update pipeline |
| **Part C — FOSS Ecosystem** | Dependencies, projects Python has enabled (NumPy, Django, TensorFlow), governance (PEP process, Steering Council) |
| **Part D — OSS vs Proprietary** | Python vs MATLAB comparison table with written verdict |
| **Scripts Documentation** | Code walkthrough, concepts used, and explanation for all five scripts |

---

## 🔗 Useful Links

- [Python Official Website](https://python.org)
- [CPython Source Code (GitHub)](https://github.com/python/cpython)
- [PSF Licence v2](https://python.org/psf/license)
- [Python Package Index (PyPI)](https://pypi.org)
- [PEP 20 — The Zen of Python](https://peps.python.org/pep-0020/)
- [GNU Free Software Definition](https://gnu.org/philosophy/free-sw.html)

---

<div align="center">

*VIT | Open Source Software NGMC | 2025–26*

*"Given enough eyeballs, all bugs are shallow." — Eric S. Raymond*

</div>
