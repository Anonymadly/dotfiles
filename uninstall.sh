#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/Dot Files" && pwd)"

echo -e "\033[0;31m󱂥\033[0m Dotfiles Uninstall Script"
echo "Detected dotfiles repo at: $DOTFILES_DIR"
echo ""
echo "What would you like to do?"
echo "[1] Remove only symlinks"
echo "[2] Remove symlinks and copy real files to target locations"
echo "[3] Decide per file"
read -rp "Enter choice [1/2/3]: " choice

if [[ "$choice" != "1" && "$choice" != "2" && "$choice" != "3" ]]; then
  echo -e "\033[0;31m\033[0m Invalid choice. Aborting."
  exit 1
fi

shopt -s dotglob nullglob

for item in "$DOTFILES_DIR"/*; do
  name="$(basename "$item")"

  # if [[ "$name" == .* ]] \
  #   || [[ "$name" == "install.sh" ]] \
  #   || [[ "$name" == "uninstall.sh" ]] \
  #   || [[ "$name" == "Other Files" ]] \
  #   || [[ "$name" == "LICENSE" ]] \
  #   || [[ "$name" == "README.md" ]];
  # then
  #   echo -e "\033[0;33m󰒭\033[0m Skipping $name"
  #   continue
  # fi

  if [[ "$name" == config_* ]]; then
    config_name="${name#config_}"
    target="$HOME/.config/$config_name"
  else
    target="$HOME/.$name"
  fi

  if [[ ! -L "$target" ]]; then
    echo -e "\033[0;33m󰒭\033[0m Skipping $target (doesn't exist or not a symlink)"
    continue
  fi

  action="$choice"

  if [[ "$choice" == "3" ]]; then
    echo ""
    echo -e "\033[0;34m󰡯\033[0m File: $target"
    echo "   [1] Remove symlink only"
    echo "   [2] Replace with real file from repo"
    read -rp "   What should be done? [1/2]: " action
    if [[ "$action" != "1" && "$action" != "2" ]]; then
      echo -e "\033[0;33m\033[0m Invalid choice. Skipping $target"
      continue
    fi
  fi

  echo -e "\033[0;31m󰛌\033[0m Removing symlink: $target"
  rm "$target"

  if [[ "$action" == "2" ]]; then
    echo -e "\033[0;32m\033[0m Copying $item → $target"
    mkdir -p "$(dirname "$target")"
    cp -R "$item" "$target"
  fi
done

echo ""
echo -e "\033[0;32m\033[0m Uninstallation complete."

