#!/bin/bash
#
# Public Dotfiles Installation Script
# Deploys cross-platform development environment configurations via GNU Stow
#

set -e

DOTFILES="$HOME/.dotfiles"

echo "Installing public dotfiles..."
echo ""

# Check prerequisites
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow not installed"
    echo "  Install with: brew install stow"
    exit 1
fi

# Change to dotfiles directory
cd "$DOTFILES"

echo "Deploying configurations..."
echo ""

# --- Files-only packages (no folding concerns) ---

echo "  • Zsh → ~/.zshrc, ~/.zshenv"
stow -v zsh

echo "  • Git → ~/.gitconfig.public, ~/.global.gitignore"
stow -v git

echo "  • Homebrew → ~/.Brewfile"
stow -v brew

# --- Packages needing --no-folding (tools write their own data to these dirs) ---

echo "  • SSH → ~/.ssh/"
stow -v --no-folding ssh

echo "  • GnuPG → ~/.gnupg/"
stow -v --no-folding gnupg

# --- ~/.config packages (mkdir prevents ~/.config itself from becoming a symlink) ---

mkdir -p "$HOME/.config"

# Folding fine — we own all files in these dirs
echo "  • Neovim → ~/.config/nvim/"
stow -v nvim

echo "  • Lazygit → ~/.config/lazygit/"
stow -v lazygit

echo "  • mpv → ~/.config/mpv/"
stow -v mpv

echo "  • Ranger → ~/.config/ranger/"
stow -v ranger

# --no-folding — these tools write their own files to config dir
echo "  • Ghostty → ~/.config/ghostty/"
stow -v --no-folding ghostty

echo "  • Zed → ~/.config/zed/"
stow -v --no-folding zed

# --- macOS-only packages ---

if [[ "$(uname)" == "Darwin" ]]; then
    echo "  • xbar → ~/Library/Application Support/xbar/plugins/"
    stow -v --no-folding xbar
fi

echo ""
echo "Public dotfiles installed successfully!"
echo ""
echo "Next steps:"
echo "  1. Install Homebrew packages: brew bundle --global"
echo "  2. Install private dotfiles: cd ~/.dotfiles-private && ./install.sh"
echo "  3. Restart shell: exec zsh"
echo ""
