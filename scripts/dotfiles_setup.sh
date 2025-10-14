#!/bin/bash
DOTFILES_DIR="$HOME/dotfiles"

# Start gnome-keyring-daemon if not running
if ! pgrep -x "gnome-keyring-daemon" >/dev/null; then
  echo "Starting gnome-keyring-daemon..."
  /usr/bin/gnome-keyring-daemon --start --components=secrets
  export GNOME_KEYRING_CONTROL=/run/user/1000/keyring
fi

# Pull latest changes
cd "$DOTFILES_DIR" && git pull

# Backup and symlink configs
backup_config() {
  local config_file="$1"
  if [ -e "$HOME/$config_file" ] && [ ! -L "$HOME/$config_file" ]; then
    echo "Backing up $HOME/$config_file"
    mv "$HOME/$config_file" "$HOME/$config_file.bak.$(date +%Y%m%d)"
  fi
}

symlink_config() {
  local source="$DOTFILES_DIR/$1"
  local dest="$HOME/$2"
  if [ -e "$source" ]; then
    backup_config "$2"
    ln -sf "$source" "$dest"
    echo "Symlinked $source -> $dest"
  fi
}

# Symlink your configs
symlink_config "hypr" ".config/hypr"
symlink_config "bashrc" ".bashrc"
symlink_config "tmux" ".config/tmux"
symlink_config "yazi" ".config/yazi"
symlink_config "foot" ".config/foot"
symlink_config "scripts/bin" ".local/bin"
[ -d "$DOTFILES_DIR/waybar" ] && symlink_config "waybar" ".config/waybar"

echo "Dotfiles setup complete!"
