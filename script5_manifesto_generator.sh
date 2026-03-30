#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Chhavi Mangalwaniya | Reg: 24BAI10296
# Course: Open Source Software — NGMC
# Purpose: Ask the user three interactive questions, compose a
#          personalised open source philosophy manifesto, and
#          save it to a .txt file with date/time stamp.
# ============================================================

# --- Alias concept demonstrated via comment ---
# In a real shell session you might type: alias py='python3'
# That is the spirit of open source — make tools easy to reach.
# Here we define a reusable variable as a lightweight alias substitute:
DIVIDER="------------------------------------------------------------"

# --- Welcome banner ---
echo "============================================================"
echo "     OPEN SOURCE MANIFESTO GENERATOR — OSS Audit Tool      "
echo "============================================================"
echo " Answer three questions honestly."
echo " Your answers will be woven into a personal manifesto"
echo " about why open source matters to you."
echo "$DIVIDER"
echo ""

# --- Interactive user input using read ---
read -p " 1. Name one open-source tool you use every day: " TOOL

read -p " 2. In one word, what does 'freedom' mean to you? " FREEDOM

read -p " 3. Name one thing you would build and share freely: " BUILD

# --- Validate that all three inputs are non-empty ---
# If any input is blank, assign a sensible default
if [ -z "$TOOL" ]; then
    TOOL="the Linux terminal"
fi
if [ -z "$FREEDOM" ]; then
    FREEDOM="autonomy"
fi
if [ -z "$BUILD" ]; then
    BUILD="a learning tool for students"
fi

# --- Capture current date for the manifesto header ---
DATE=$(date '+%d %B %Y')
TIME=$(date '+%H:%M:%S')

# --- Compose output filename using the current user's name ---
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "$DIVIDER"
echo " Generating your manifesto..."
echo "$DIVIDER"
echo ""

# --- Build the manifesto by writing to a file using > and >> ---
# > creates (or overwrites) the file; >> appends subsequent lines

echo "============================================================" > "$OUTPUT"
echo "            OPEN SOURCE MANIFESTO                          " >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo " Author : $(whoami)" >> "$OUTPUT"
echo " Date   : $DATE at $TIME" >> "$OUTPUT"
echo "------------------------------------------------------------" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- First paragraph: personal connection to open source ---
echo "I believe in open source because I have seen what it does." >> "$OUTPUT"
echo "Every day I use $TOOL — a piece of software that someone" >> "$OUTPUT"
echo "built, refined, and then chose to share with the world for" >> "$OUTPUT"
echo "free, not out of obligation but out of conviction that" >> "$OUTPUT"
echo "knowledge shared is knowledge multiplied." >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Second paragraph: the meaning of freedom in this context ---
echo "To me, freedom in software means $FREEDOM. It means the" >> "$OUTPUT"
echo "right to look inside the tools I depend on, to understand" >> "$OUTPUT"
echo "them, to improve them, and to pass them on. A program" >> "$OUTPUT"
echo "whose source code is locked away is a tool with a leash." >> "$OUTPUT"
echo "Open source cuts that leash." >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Third paragraph: commitment to contribute ---
echo "I commit to giving back. One day I want to build" >> "$OUTPUT"
echo "$BUILD and release it openly — not because I have to," >> "$OUTPUT"
echo "but because the developers who built $TOOL once made" >> "$OUTPUT"
echo "the same choice for me. Every line of code I share" >> "$OUTPUT"
echo "is a vote for a world where software serves people," >> "$OUTPUT"
echo "not the other way around." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "------------------------------------------------------------" >> "$OUTPUT"
echo " 'Given enough eyeballs, all bugs are shallow.'" >> "$OUTPUT"
echo "                         — Eric S. Raymond" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm and display the saved manifesto ---
echo " Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
echo ""
echo "============================================================"
echo " You can share this file or add it to your OSS portfolio."
echo "============================================================"
