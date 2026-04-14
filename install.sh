#!/usr/bin/env bash
set -euo pipefail

DOT="${DOTFILES_HOME:-$HOME/dotfiles}"
TGTCFG="$HOME/.config"
BACKUP_DIR="$HOME/.dotbackup/$(date +%Y%m%d_%H%M%S)"

log() {
  printf '[dotfiles] %s\n' "$1"
}

backup_if_exists() {
  local target="$1"

  if [[ -L "$target" || -e "$target" ]]; then
    mkdir -p "$BACKUP_DIR"
    log "backup: $target -> $BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/"
  fi
}

link_path() {
  local src="$1"
  local dst="$2"

  if [[ ! -e "$src" && ! -L "$src" ]]; then
    log "skip: source not found: $src"
    return
  fi

  backup_if_exists "$dst"
  ln -s "$src" "$dst"
  log "linked: $dst -> $src"
}

main() {
  log "start install"
  log "dotfiles root: $DOT"

  mkdir -p "$TGTCFG"

  # homeへの貼り付け
  link_path "$DOT/home/.zshrc" "$HOME/.zshrc"
  link_path "$DOT/home/.tmux.conf" "$HOME/.tmux.conf"
  link_path "$DOT/home/.gitconfig" "$HOME/.gitconfig"
  link_path "$DOT/home/.gitignore_global" "$HOME/.gitignore_global"

  # xdgへの貼り付け
  link_path "$DOT/xdg_config/shell" "$TGTCFG/shell"
  link_path "$DOT/xdg_config/starship.toml" "$TGTCFG/starship.toml"
  link_path "$DOT/xdg_config/nvim" "$TGTCFG/nvim"

  log "install complete"

  cat <<EOF

Next steps:
  exec zsh
  tmux
  nvim

Backup dir:
  $BACKUP_DIR
EOF
}

main "$@"

