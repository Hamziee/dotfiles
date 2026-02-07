#!/bin/bash
set -e
cd "$(dirname "$0")"

### dotfiles backup script ###

echo "Creating directories if they do not exist..."
mkdir -p .config/hypr .config/waybar .config/wofi .config/systemd/user

echo "Copying Hypr configs..."
cp -rf ~/.config/hypr/ .config/hypr/

echo "Copying wallpapers..."
cp -rf ~/.config/wallpapers/ .config/wallpapers

echo "Copying Waybar configs..."
cp -rf ~/.config/waybar/ .config/waybar/

echo "Copying Wofi configs..."
cp -rf ~/.config/wofi/ .config/wofi/

echo "Copying vcable script..."
cp -f ~/vcable.sh vcable.sh

echo "Copying vcable service..."
cp -f ~/.config/systemd/user/vcable.service .config/systemd/user/vcable.service

echo "Backup completed."
