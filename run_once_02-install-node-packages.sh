#!/bin/bash

# Install Volta (Node.js version manager) and Node.js
# This runs once when chezmoi apply is executed

echo "Installing Volta and Node.js..."

# Install Volta if not already installed
if ! command -v volta &> /dev/null; then
    echo "Installing Volta..."
    curl https://get.volta.sh | bash

    # Source volta in current session
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"

    echo "Volta installed successfully"
else
    echo "Volta is already installed"
fi

# Install Node.js using Volta
if ! volta list node &> /dev/null || ! volta list node | grep -q "node@"; then
    echo "Installing Node.js with Volta..."
    volta install node
    echo "Node.js installed successfully"
else
    echo "Node.js is already installed via Volta"
fi

# Verify installation
volta --version
node --version
npm --version

# Install Claude Code CLI
if ! npm list -g @anthropic-ai/claude-code &> /dev/null; then
    echo "Installing Claude Code CLI..."
    npm install -g @anthropic-ai/claude-code
    echo "Claude Code installed successfully"
else
    echo "Claude Code is already installed"
fi

echo "Node.js and Claude Code setup complete!"