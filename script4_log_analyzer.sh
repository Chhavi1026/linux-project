#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Chhavi Mangalwaniya | Reg: 24BAI10296
# Course: Open Source Software — NGMC
# Purpose: Read a log file line by line, count occurrences of
#          a keyword, and print a summary with matching lines.
# Usage  : ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Accept command-line arguments ---
LOGFILE=$1                      # First argument: path to log file
KEYWORD=${2:-"error"}           # Second argument: keyword (default: "error")

# --- Counters ---
COUNT=0          # Tracks how many lines match the keyword
LINE_NUM=0       # Tracks current line number for display

# --- Validate that a logfile argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- File existence check with retry logic ---
# Retry up to 3 times if the file is not found (do-while style using a counter)
RETRIES=0
MAX_RETRIES=3

while [ ! -f "$LOGFILE" ]; do
    RETRIES=$((RETRIES + 1))
    echo " [Attempt $RETRIES/$MAX_RETRIES] File not found: $LOGFILE"

    # If max retries reached, ask the user for an alternative file
    if [ $RETRIES -ge $MAX_RETRIES ]; then
        read -p " Enter an alternative log file path (or press Enter to exit): " ALT_FILE
        if [ -z "$ALT_FILE" ]; then
            echo " No file provided. Exiting."
            exit 1
        fi
        LOGFILE="$ALT_FILE"
        RETRIES=0   # Reset counter for the new path
    fi
done

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo " Warning: $LOGFILE exists but is empty. Nothing to analyse."
    exit 0
fi

echo "============================================================"
echo "        LOG FILE ANALYZER — OSS Audit Tool                 "
echo "============================================================"
echo " Log file : $LOGFILE"
echo " Keyword  : '$KEYWORD' (case-insensitive)"
echo "------------------------------------------------------------"

# --- Read the file line by line using a while-read loop ---
# IFS= prevents trimming of leading/trailing whitespace
# -r prevents backslash interpretation
while IFS= read -r LINE; do
    LINE_NUM=$((LINE_NUM + 1))

    # If the line contains the keyword (case-insensitive), increment counter
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi

done < "$LOGFILE"

echo " Total lines scanned : $LINE_NUM"
echo " Keyword matches     : $COUNT"
echo "------------------------------------------------------------"

# --- Show the last 5 lines that matched the keyword ---
# We use grep with -i (case-insensitive) and pipe into tail
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -n "$MATCHES" ]; then
    echo " Last 5 matching lines:"
    echo ""
    # Loop through each matching line and print with a prefix
    while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done <<< "$MATCHES"
else
    echo " No matching lines found for keyword: '$KEYWORD'"
fi

echo "------------------------------------------------------------"

# --- Summary verdict using if-then-else ---
if [ $COUNT -eq 0 ]; then
    echo " Result: Clean — no '$KEYWORD' entries detected."
elif [ $COUNT -lt 10 ]; then
    echo " Result: Minor — $COUNT occurrence(s). Worth monitoring."
elif [ $COUNT -lt 50 ]; then
    echo " Result: Moderate — $COUNT occurrences. Investigate soon."
else
    echo " Result: High — $COUNT occurrences. Immediate attention needed."
fi

echo "============================================================"
