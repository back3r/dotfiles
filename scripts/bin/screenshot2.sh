#!/usr/bin/env bash

# Required tools: grim, slurp, wl-copy, notify-send, satty

# Generate temporary filename
TMP_IMG="/tmp/hypr_screenshot_$(date +%Y%m%d_%H%M%S).png"

# Step 1: Capture region using slurp + grim
GEOM=$(slurp)
if [ -z "$GEOM" ]; then
  notify-send "Screenshot canceled" "No region selected."
  exit 1
fi

grim -g "$GEOM" "$TMP_IMG"
if [ ! -f "$TMP_IMG" ]; then
  notify-send "Screenshot failed" "Image file was not created."
  exit 1
fi

# Step 2: Copy image to clipboard using wl-copy
if command -v wl-copy >/dev/null 2>&1; then
  wl-copy <"$TMP_IMG"
  notify-send "Screenshot copied 📋" "Image copied to clipboard."
else
  notify-send "Warning" "wl-copy not found; skipping clipboard."
fi

# Step 3: Open satty for annotation and save the image
satty --filename "$TMP_IMG" --actions-on-enter save-to-file --actions-on-escape exit

# If the user saved the file, notify them
if [ -f "$TMP_IMG" ]; then
  notify-send "Screenshot saved 📸" "File saved to $TMP_IMG"
else
  # User exited without saving
  notify-send "Screenshot not saved" "But still copied to clipboard."
fi
