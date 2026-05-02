#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$CONFIG_DIR/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

link_config() {
  local src="$1"
  local dest="$2"

  if [ ! -e "$src" ]; then
    echo "skip: source not found: $src"
    return
  fi

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok: already linked: $dest -> $src"
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "backup: $dest -> $BACKUP_DIR/"
    mv "$dest" "$BACKUP_DIR/"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "link: $dest -> $src"
}

link_config "$DOTFILES_DIR/ghostty" "$CONFIG_DIR/ghostty"
link_config "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
link_config "$DOTFILES_DIR/sheldon" "$CONFIG_DIR/sheldon"
link_config "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"
link_config "$DOTFILES_DIR/wezterm" "$CONFIG_DIR/wezterm"
link_config "$DOTFILES_DIR/zed/settings.json" "$CONFIG_DIR/zed/settings.json"
link_config "$DOTFILES_DIR/zsh-abbr" "$CONFIG_DIR/zsh-abbr"
