#!/usr/bin/env bash

# Wi-Fi Hotspot Manager using nmcli
# Author: ChatGPT
# Tested on: Arch Linux

# CONFIGURATION
IFACE="wlan0"       # Change this to your Wi-Fi interface (use `ip link` to find it)
SSID="MyHotspot"    # Your desired Hotspot name
PASSWORD="test1234" # At least 8 characters

# COLORS
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

function check_nmcli_installed {
  if ! command -v nmcli &>/dev/null; then
    echo -e "${RED}Error: nmcli (NetworkManager) is not installed.${RESET}"
    exit 1
  fi
}

function check_interface {
  if ! ip link show "$IFACE" >/dev/null 2>&1; then
    echo -e "${RED}Error: Interface '$IFACE' not found.${RESET}"
    exit 1
  fi
}

function start_hotspot {
  echo -e "${YELLOW}Starting Wi-Fi Hotspot on interface ${IFACE}...${RESET}"
  nmcli dev wifi hotspot ifname "$IFACE" ssid "$SSID" password "$PASSWORD"
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}Hotspot '$SSID' started successfully.${RESET}"
  else
    echo -e "${RED}Failed to start hotspot.${RESET}"
  fi
}

function stop_hotspot {
  echo -e "${YELLOW}Stopping Wi-Fi Hotspot...${RESET}"
  HOTSPOT_NAME=$(nmcli -t -f NAME,TYPE connection show --active | grep wifi | cut -d: -f1)
  if [ -n "$HOTSPOT_NAME" ]; then
    nmcli connection down "$HOTSPOT_NAME"
    echo -e "${GREEN}Hotspot stopped.${RESET}"
  else
    echo -e "${RED}No active hotspot found.${RESET}"
  fi
}

function usage {
  echo -e "${YELLOW}Usage: $0 {start|stop}${RESET}"
  exit 1
}

# MAIN
check_nmcli_installed
check_interface

case "$1" in
start)
  start_hotspot
  ;;
stop)
  stop_hotspot
  ;;
*)
  usage
  ;;
esac
