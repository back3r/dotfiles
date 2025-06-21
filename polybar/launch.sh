#!/usr/bin/env bash

# Kill all existing bars
killall -q polybar

# Launch bar on each connected monitor
for m in $(polybar --list-monitors | cut -d: -f1); do
  MONITOR=$m polybar --reload main &
done
