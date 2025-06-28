#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/Dot Files" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup"

echo -e "\033[0;32m\033[0m  Starting dotfiles installation from $DOTFILES_DIR"
echo -e "\033[0;34m󱂷\033[0m Backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

shopt -s dotglob nullglob

for item in "$DOTFILES_DIR"/*; do
  name="$(basename "$item")"

  # Skip hidden files/folders and git-related internals + any scripts + other types of configs
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

  # Special case: config_<name> → ~/.config/<name>
  if [[ "$name" == config_* ]]; then
    config_name="${name#config_}"
    target="$HOME/.config/$config_name"
  else
    target="$HOME/.$name"
  fi

  # Backup existing non-symlink targets
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo -e "\033[0;33m󰸧\033[0m Backing up $target → $BACKUP_DIR"
    mkdir -p "$(dirname "$BACKUP_DIR/$name")"
    mv "$target" "$BACKUP_DIR/"
  fi

  # Remove existing symlink (if any)
  if [[ -L "$target" ]]; then
    rm "$target"
  fi

  echo -e "\033[0;32m\033[0m Linking $target → $item"
  mkdir -p "$(dirname "$target")"
  ln -s "$item" "$target"
done

# Remove backup dir if it's empty
if [ -d "$BACKUP_DIR" ] && [ -z "$(ls -A "$BACKUP_DIR")" ]; then
  echo -e "\033[0;34m󱂨\033[0m No backups were needed. Removing empty backup directory."
  rmdir "$BACKUP_DIR"
fi

echo -e "\033[0;32m\033[0m All dotfiles linked successfully."

