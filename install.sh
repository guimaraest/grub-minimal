#!/bin/bash

set -e

THEME_DIR="/boot/grub/themes/grub-minimal"
GRUB_CONFIG="/etc/default/grub"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/theme"

echo "installing grub-minimal"

sudo rm -rf "$THEME_DIR"
sudo mkdir -p "$THEME_DIR"
sudo cp -r "$BUILD_DIR/." "$THEME_DIR/"

sudo sed -i '/^GRUB_THEME=/d' "$GRUB_CONFIG"

echo 'GRUB_THEME="/boot/grub/themes/grub-minimal/theme.txt"' | sudo tee -a "$GRUB_CONFIG" > /dev/null

echo
echo "theme installed"
echo "run this command to regen GRUB"
echo
echo "sudo update-grub"