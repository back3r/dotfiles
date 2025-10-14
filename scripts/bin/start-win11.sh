#!/usr/bin/env bash

VM="win11"
CONN="qemu:///system"

if ! virsh --connect "$CONN" domstate "$VM" | grep -q running; then
  virsh --connect "$CONN" start "$VM"
fi

virt-viewer --connect "$CONN" "$VM"
