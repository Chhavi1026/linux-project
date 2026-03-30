#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Chhavi Mangalwaniya | Reg: 24BAI10296
# Course: Open Source Software — NGMC
# Purpose: Check if a FOSS package is installed, display its
#          version/licence info, and print a philosophy note
#          using a case statement.
# ============================================================

# --- Primary package for this audit ---
PACKAGE="python3"

# --- Helper function: print a section divider ---
divider() {
    echo "------------------------------------------------------------"
}

echo "============================================================"
echo "        FOSS PACKAGE INSPECTOR — OSS Audit Tool            "
echo "============================================================"
echo " Checking package: $PACKAGE"
divider

# --- Check if the package is installed ---
# We try multiple package managers to support Debian and RPM systems
if command -v dpkg &>/dev/null; then
    # Debian / Ubuntu based system
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        INSTALLED=true
        PKG_VERSION=$(dpkg -l "$PACKAGE" 2>/dev/null | grep "^ii" | awk '{print $3}')
        PKG_ARCH=$(dpkg -l "$PACKAGE" 2>/dev/null | grep "^ii" | awk '{print $4}')
        echo " Status   : INSTALLED (via dpkg)"
        echo " Version  : $PKG_VERSION"
        echo " Arch     : $PKG_ARCH"
    else
        INSTALLED=false
        echo " Status   : NOT installed on this system"
    fi
elif command -v rpm &>/dev/null; then
    # RPM based system (Fedora / CentOS / RHEL)
    if rpm -q "$PACKAGE" &>/dev/null; then
        INSTALLED=true
        # Extract version, licence, and summary from RPM metadata
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        INSTALLED=false
        echo " Status   : NOT installed on this system"
    fi
else
    # Fallback: just check if python3 binary exists in PATH
    if command -v python3 &>/dev/null; then
        INSTALLED=true
        echo " Status   : Found in PATH (package manager unavailable)"
        python3 --version
    else
        INSTALLED=false
        echo " Status   : python3 not found"
    fi
fi

# --- If installed, show runtime details ---
if [ "$INSTALLED" = true ]; then
    divider
    echo " Runtime version check:"
    # python3 --version prints to stdout; capture it
    PY_RUNTIME=$(python3 --version 2>&1)
    echo " $PY_RUNTIME"

    # Show the path to the python3 binary using which
    PY_PATH=$(which python3)
    echo " Binary   : $PY_PATH"
fi

divider

# --- Case statement: print a philosophy note for common FOSS packages ---
# This demonstrates the case construct across several known packages
echo " Open Source Philosophy Note:"
case $PACKAGE in
    python3|python)
        echo " Python: born from a desire to make programming readable and"
        echo " accessible to everyone — 'batteries included' philosophy."
        echo " The PSF licence ensures it remains free for all, forever."
        ;;
    httpd|apache2)
        echo " Apache HTTP Server: the web server that built the open"
        echo " internet — powers roughly 30% of all websites globally."
        ;;
    mysql|mariadb)
        echo " MySQL/MariaDB: open source at the heart of millions of"
        echo " applications — the M in the classic LAMP web stack."
        ;;
    vlc)
        echo " VLC: started by students in Paris who needed to stream"
        echo " video freely — now plays virtually any media format on Earth."
        ;;
    firefox)
        echo " Firefox: a non-profit's answer to the browser monopoly —"
        echo " proof that open source can compete with trillion-dollar firms."
        ;;
    git)
        echo " Git: Linus Torvalds built it in two weeks after a proprietary"
        echo " version-control tool revoked the Linux kernel's free licence."
        ;;
    *)
        echo " $PACKAGE: an open-source tool that someone chose to share"
        echo " freely so that others could learn from, improve, and build on."
        ;;
esac

echo "============================================================"
