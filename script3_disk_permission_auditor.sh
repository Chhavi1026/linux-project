#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Chhavi Mangalwaniya | Reg: 24BAI10296
# Course: Open Source Software — NGMC
# Purpose: Loop through key system directories, report their
#          permissions, owner, group, and disk usage.
#          Also checks Python-specific config directories.
# ============================================================

# --- List of standard system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib" "/opt")

# --- Python-specific directories to check ---
PYTHON_DIRS=(
    "/usr/lib/python3"
    "/usr/lib/python3.10"
    "/usr/lib/python3.11"
    "/usr/lib/python3.12"
    "/usr/local/lib/python3"
    "/etc/python3"
)

# --- Helper: print a formatted divider line ---
divider() {
    printf '%0.s-' {1..66}
    echo
}

echo "================================================================"
echo "          DISK & PERMISSION AUDITOR — OSS Audit Tool           "
echo "================================================================"
printf "%-20s %-22s %-8s %s\n" "Directory" "Permissions/Owner/Grp" "Size" "Status"
divider

# --- Main loop over system directories ---
# For each directory, check existence, extract permissions and size
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # ls -ld gives: permissions links owner group size date name
        # awk pulls out the permission string, owner, and group fields
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        # du -sh gives human-readable size; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-22s %-8s %s\n" "$DIR" "$PERMS $OWNER:$GROUP" "$SIZE" "OK"
    else
        printf "%-20s %-22s %-8s %s\n" "$DIR" "N/A" "N/A" "MISSING"
    fi
done

divider
echo ""
echo "================================================================"
echo "          PYTHON INSTALLATION DIRECTORY CHECK                  "
echo "================================================================"
printf "%-35s %-20s %s\n" "Python Directory" "Permissions" "Status"
divider

# --- Check Python-specific directories ---
# This section demonstrates a separate for loop over a different array
FOUND_PYTHON=false

for PYDIR in "${PYTHON_DIRS[@]}"; do
    if [ -d "$PYDIR" ]; then
        PERMS=$(ls -ld "$PYDIR" | awk '{print $1}')
        OWNER=$(ls -ld "$PYDIR" | awk '{print $3":"$4}')
        SIZE=$(du -sh "$PYDIR" 2>/dev/null | cut -f1)
        printf "%-35s %-20s %s\n" "$PYDIR" "$PERMS ($OWNER)" "FOUND — ${SIZE}"
        FOUND_PYTHON=true
    fi
done

# If none of the expected Python dirs exist, try to find Python dynamically
if [ "$FOUND_PYTHON" = false ]; then
    echo " None of the expected Python directories found."
    # Try to locate python3 stdlib path via python3 itself
    if command -v python3 &>/dev/null; then
        STDLIB=$(python3 -c "import sysconfig; print(sysconfig.get_path('stdlib'))" 2>/dev/null)
        if [ -n "$STDLIB" ] && [ -d "$STDLIB" ]; then
            PERMS=$(ls -ld "$STDLIB" | awk '{print $1}')
            OWNER=$(ls -ld "$STDLIB" | awk '{print $3":"$4}')
            SIZE=$(du -sh "$STDLIB" 2>/dev/null | cut -f1)
            printf "%-35s %-20s %s\n" "$STDLIB" "$PERMS ($OWNER)" "FOUND — ${SIZE}"
        fi
    fi
fi

divider
echo ""
echo " Note: /usr/bin is world-executable (rwxr-xr-x) by design so"
echo " all users can run binaries like python3. Config dirs under"
echo " /etc are typically root-owned to prevent unauthorised changes."
echo "================================================================"
