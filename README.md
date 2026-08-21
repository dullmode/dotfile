# Dotfiles 🏠

## About 
My dotfiles managed by [chezmoi](https://chezmoi.io) ⚡

## Requirements ✅
-  **chezmoi**
  - Detailed description is in Usage
-  **LazyVim**
  - Neovim >= 0.11.2 (needs to be built with LuaJIT)
  - Git >= 2.19.0 (for partial clones support)
  - a Nerd Font(v3.0 or greater) (optional, but needed to display some icons)
  - lazygit (optional)
  - tree-sitter-cli and a C compiler for nvim-treesitter. See here
  - curl for blink.cmp (completion engine)
  - for fzf-lua (optional)
  - - fzf: fzf (v0.25.1 or greater)
  - - live grep: ripgrep
  - - find files: fd
  - a terminal that support true color and undercurl:
  - - wezterm (Linux, Macos & Windows)

### nvim 🔥
```bash

mkdir -p ~/.local/bin

# Download the tarball for x86_64 (adjust version if newer)
wget -O ~/nvim-linux-x86_64.tar.gz \
  https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz

tar -xzf ~/nvim-linux-x86_64.tar.gz -C ~/

mv ~/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim

chmod +x ~/.local/bin/nvim

rm ~/nvim-linux-x86_64.tar.gz

nvim --version
```

### lazygit 🌳
```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

lazygit --version
```

### chezmoi 🏠
```bash
# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"

# clone and deploy
chezmoi init https://github.com/dullmode/dotfiles

# make sure the repo is latest
chezmoi cd && git pull

# apply chezmoi 
chezmoi apply
```

and install formatter, lsp, linter by mason

### zsh, ripgrep 🔍

```bash
sudo apt update

# zsh
sudo apt install -y zsh
zsh --version

# zsh - starship
curl -sS https://starship.rs/install.sh | sh
starship --version

```

### claude, markdown 🤖

```bash
volta install node

# claude
npm install -g @anthropic-ai/claude-code

# markdown
cd ~/.local/share/nvim/lazy/markdown-preview.nvim
npm install
```

## Usage 🚀
```bash
# Install chezmoi 
sh -c "$(curl -fsLS get.chezmoi.io)"

# clone and deploy
chezmoi init git@github.com:dullmode/dotfiles.git

# when you wanna add file to dotfile ➕
chezmoi add ~/.bashrc

# when you wanna edit file
chezmoi edit ~/.bashrc
# or
chezmoi cd && nvim

# apply chezmoi changes to home directory
chezmoi apply ~/.zshrc
# or apply all
chezmoi apply

# do not forget to push chezmoi changes!
chezmoi cd
git add .
git commit -m ""
git push
```
