#!/bin/bash

# Install packages for the dotfiles environment
# This runs once when chezmoi apply is executed

echo "Installing packages..."

# Essential packages that must be present
essential_packages=(
    "curl"
    "git"
    "wget"
    "unzip"
    "zsh"              # Shell
)

# LazyVim dependency packages
lazyvim_dep_packages=(
    "build-essential"  # C compiler (gcc, g++, make) for nvim-treesitter
    "ripgrep"          # For live grep in fzf-lua
    "fzf"              # For fuzzy finding
    "fd-find"          # For finding files in fzf-lua
)

# Utility packages
util_packages=(
    "espeak-ng"        # Text-to-speech synthesizer
)

# Combine all packages
all_packages=("${essential_packages[@]}" "${lazyvim_dep_packages[@]}" "${util_packages[@]}")

# Update package list
sudo apt update

# Install packages
for pkg in "${all_packages[@]}"; do
    if ! dpkg -l | grep -q "^ii  $pkg "; then
        echo "Installing $pkg..."
        sudo apt install -y "$pkg"
    else
        echo "$pkg is already installed"
    fi
done

# Create symlink for fd (Ubuntu/Debian installs as 'fdfind')
if command -v fdfind &> /dev/null && ! command -v fd &> /dev/null; then
    mkdir -p ~/.local/bin
    ln -sf $(which fdfind) ~/.local/bin/fd
    echo "Created symlink: fd -> fdfind"
fi

echo "Installing starship prompt for zsh..."

if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh
    echo "starship installed successfully"
else
    echo "starship is already installed"
fi

# Verify installation
starship --version

# Node packages (installed via npm from run_once_02-install-node-packages.sh):
# - volta (Node.js version manager)
# - node (latest via volta)
# - npm (comes with node)
# - @anthropic-ai/claude-code (Claude Code CLI)

echo "Package installation complete!"