#!/bin/bash

# Install Neovim
# This runs once when chezmoi apply is executed

echo "Installing Neovim..."

NVIM_VERSION="v0.11.5"
NVIM_DIR="$HOME/.local/nvim-linux-x86_64"
NVIM_BIN="$HOME/.local/bin/nvim"

# Check if already installed
if command -v nvim &> /dev/null; then
    CURRENT_VERSION=$(nvim --version | head -n1 | awk '{print $2}')
    if [ "$CURRENT_VERSION" = "$NVIM_VERSION" ]; then
        echo "Neovim $NVIM_VERSION is already installed"
        exit 0
    fi
fi

# Download and extract Neovim
echo "Downloading Neovim $NVIM_VERSION..."
wget -O /tmp/nvim-linux-x86_64.tar.gz \
  "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz"

# Remove old installation if exists
rm -rf "$NVIM_DIR"

# Extract to ~/.local/
tar -xzf /tmp/nvim-linux-x86_64.tar.gz -C "$HOME/.local/"

# Create symlink
mkdir -p "$HOME/.local/bin"
ln -sf "$NVIM_DIR/bin/nvim" "$NVIM_BIN"

# Cleanup
rm /tmp/nvim-linux-x86_64.tar.gz

# Verify installation
nvim --version

echo "Neovim installation complete!"