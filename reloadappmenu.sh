#!/usr/bin/env bash
set -e

MENU_SRC="/etc/xdg/menus/arch-applications.menu"
MENU_DST="/etc/xdg/menus/applications.menu"

echo "Checking XDG menu files..."

if [[ ! -f "$MENU_SRC" ]]; then
  echo "ERROR: $MENU_SRC not found. Is archlinux-xdg-menu installed?"
  exit 1
fi

sudo cp -f "$MENU_SRC" "$MENU_DST"

echo "Rebuilding KDE service cache..."
if command -v kbuildsycoca6 >/dev/null 2>&1; then
  kbuildsycoca6 --noincremental
elif command -v kbuildsycoca5 >/dev/null 2>&1; then
  kbuildsycoca5 --noincremental
else
  echo "WARNING: kbuildsycoca not found. KDE apps may not update."
fi

echo "Done."

