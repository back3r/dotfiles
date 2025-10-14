#!/usr/bin/env bash

# Required tools: grim, slurp, zenity, wl-copy, notify-send

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

# Step 3: Ask user if they want to save the file
zenity --question --title="Save Screenshot?" --text="Do you want to save the screenshot to disk?"
USER_WANTS_SAVE=$?

if [ "$USER_WANTS_SAVE" -eq 0 ]; then
  # User chose to save
  SAVE_PATH=$(zenity --file-selection --save --confirm-overwrite \
    --title="Save Screenshot As" \
    --filename="$HOME/Pictures/screenshot_$(date +%Y%m%d_%H%M%S).png")

  if [ -n "$SAVE_PATH" ]; then
    mv "$TMP_IMG" "$SAVE_PATH"
    notify-send "Screenshot saved 📸" "$SAVE_PATH\nAlso copied to clipboard."
  else
    # User canceled file dialog
    rm -f "$TMP_IMG"
    notify-send "Screenshot not saved" "But still copied to clipboard."
  fi
else
  # User chose not to save
  rm -f "$TMP_IMG"
  notify-send "Screenshot not saved" "But still copied to clipboard."
fi
