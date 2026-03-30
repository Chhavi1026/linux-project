#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Chhavi Mangalwaniya | Reg: 24BAI10296
# Course: Open Source Software — NGMC
# Purpose: Display a formatted welcome screen with system info
#          and details about the open-source OS licence.
# ============================================================

# --- Student & software variables ---
STUDENT_NAME="Chhavi Mangalwaniya"
REG_NUMBER="24BAI10296"
SOFTWARE_CHOICE="Python"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                          # Kernel version from uname
ARCH=$(uname -m)                            # Hardware architecture
USER_NAME=$(whoami)                         # Currently logged-in user
HOME_DIR=$HOME                              # Home directory of current user
UPTIME=$(uptime -p)                         # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')        # Formatted current date
CURRENT_TIME=$(date '+%H:%M:%S')            # Current time (24-hour)
HOSTNAME=$(hostname)                        # Machine hostname

# --- Detect Linux distribution name ---
# /etc/os-release is the standard file on modern Linux systems
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -oP '(?<=^PRETTY_NAME=").*(?=")' /etc/os-release)
else
    DISTRO="Unknown Linux Distribution"
fi

# --- OS Licence detection ---
# Linux kernel is licensed under GPL v2; we check the distro type
# to give the most accurate licence message
if echo "$DISTRO" | grep -qi "ubuntu\|debian\|mint"; then
    OS_LICENSE="GNU GPL v2 (Linux Kernel) — Debian/Ubuntu ecosystem"
elif echo "$DISTRO" | grep -qi "fedora\|centos\|rhel\|rocky"; then
    OS_LICENSE="GNU GPL v2 (Linux Kernel) — Red Hat / Fedora ecosystem"
else
    OS_LICENSE="GNU GPL v2 (Linux Kernel) — Open Source"
fi

# --- Display formatted output ---
echo "================================================================"
echo "         OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT            "
echo "================================================================"
echo " Student  : $STUDENT_NAME ($REG_NUMBER)"
echo " Software : $SOFTWARE_CHOICE (PSF Licence)"
echo "----------------------------------------------------------------"
echo " Hostname : $HOSTNAME"
echo " Distro   : $DISTRO"
echo " Kernel   : $KERNEL"
echo " Arch     : $ARCH"
echo "----------------------------------------------------------------"
echo " User     : $USER_NAME"
echo " Home Dir : $HOME_DIR"
echo " Uptime   : $UPTIME"
echo "----------------------------------------------------------------"
echo " Date     : $CURRENT_DATE"
echo " Time     : $CURRENT_TIME"
echo "----------------------------------------------------------------"
echo " OS Lic.  : $OS_LICENSE"
echo "================================================================"
echo " Python is licensed under the PSF (Python Software Foundation) "
echo " Licence — a permissive open-source licence that allows free   "
echo " use, modification, and redistribution with attribution.       "
echo "================================================================"
