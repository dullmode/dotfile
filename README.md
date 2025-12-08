# Dotfiles 🏠

## About i️ 
My dotfiles managed by [chezmoi](https://chezmoi.io) ⚡

## Requirements ✅
-  **chezmoi**
  - Detailed description is in Usage
-  **nvim**
  - Download nightly under `~/.local/bin` from the site
  - gcc for nvim-treesitter
  - `sudo apt-get install build-essential`
  - venv for mason (python)
  - `sudo apt install -y python3-venv`

## Quickstart ⚡

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

### chezmoi 🏠
```bash
# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"

# clone and deploy
chezmoi init http://github.com/dullmode/dotfile/

# make sure the repo is latest
chezmoi cd && git pull

# apply chezmoi 
chezmoi apply
```

and install formatter, lsp, linter by mason

## additional libraries 📚

### zsh, ripgrep 🔍

```bash
sudo apt update

# zsh
sudo apt install -y zsh
zsh --version

# ripgrep
sudo apt install -y ripgrep
rg --version

# additional package: uv libraries
curl -Ls https://astral.sh/uv/install.sh | bash
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

# claude code notification
# https://zenn.dev/hatappo/articles/8e086ca380cf87
sudo apt install espeak-ng                               
```

### zk 📝
```bash
mkdir -p ~/.local/bin

# Download the amd64 tar.gz (adjust version if newer)
wget -O ~/zk-v0.15.1-linux-amd64.tar.gz \
  https://github.com/zk-org/zk/releases/download/v0.15.1/zk-v0.15.1-linux-amd64.tar.gz

tar -xzf ~/zk-v0.15.1-linux-amd64.tar.gz -C ~/

chmod +x ~/.local/bin/zk

rm ~/zk-v0.15.1-linux-amd64.tar.gz   

zk --version

# load and create notes
zk init ~/notes

zk new "My First Note"
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

### wezterm 💻
- you may need a symlink if you use windows
- `mklink wezterm.lua "\\wsl$\Ubuntu\home\xxxxx\.config\wezterm\wezterm.lua"`

## Usage 🚀
```bash
# Install chezmoi 
sh -c "$(curl -fsLS get.chezmoi.io)"

# clone and deploy 
chezmoi init git@github.com:johnmanjiro13/dotfiles.git

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
