#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup"

echo "🔧 Starting dotfiles installation from $DOTFILES_DIR"
echo "📦 Backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

shopt -s dotglob nullglob

for item in "$DOTFILES_DIR"/*; do
  name="$(basename "$item")"

  # Skip hidden files/folders and git-related internals + any scripts + other types of configs
  if [[ "$name" == .* ]] \
    || [[ "$name" == "install.sh" ]] \
    || [[ "$name" == "uninstall.sh" ]] \
    || [[ "$name" == "Other Files" ]] \
    || [[ "$name" == "LICENSE" ]] \
    || [[ "$name" == "README.md" ]];
  then
    echo "⚠️ Skipping $name"
    continue
  fi

  # Special case: config_<name> → ~/.config/<name>
  if [[ "$name" == config_* ]]; then
    config_name="${name#config_}"
    target="$HOME/.config/$config_name"
  else
    target="$HOME/.$name"
  fi

  # Backup existing non-symlink targets
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "📦 Backing up $target → $BACKUP_DIR"
    mkdir -p "$(dirname "$BACKUP_DIR/$name")"
    mv "$target" "$BACKUP_DIR/"
  fi

  # Remove existing symlink (if any)
  if [[ -L "$target" ]]; then
    rm "$target"
  fi

  echo "🔗 Linking $target → $item"
  mkdir -p "$(dirname "$target")"
  ln -s "$item" "$target"
done

# Remove backup dir if it's empty
if [ -d "$BACKUP_DIR" ] && [ -z "$(ls -A "$BACKUP_DIR")" ]; then
  echo "🧹 No backups were needed. Removing empty backup directory."
  rmdir "$BACKUP_DIR"
fi

echo "✅ All dotfiles linked successfully."

