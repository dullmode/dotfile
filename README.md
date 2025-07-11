# Dotfiles 🏠

## About ℹ️ 
My dotfiles managed by [chezmoi](https://chezmoi.io) ⚡

## Requirements ✅
- 💻 **chezmoi**
  - Detailed description is in Usage
- 🎨 **nvim**
  - Download nightly from site and create symbolic to local/bin
  - gcc for nvim-treesitter
  - `sudo apt-get install build-essential`
  - venv for mason (python)
  - `sudo apt install -y python3-venv`
- 🚀 **volta**
  - node
  - `volta install node`
  - claude
  - `npm install -g @anthropic-ai/claude-code`
  - markdown
  - `dull@AX24026:~/.local/share/nvim/lazy/markdown-preview.nvim$ npm install`

## Not requirements ⚠️
- 🎨 nvim config file
- 🖥️ bashrc
- 🔎 rg
- 🔎 zk

## after nvim setting reccomandtion
use mason and install these lsp, formatter, and linter
 - python
 - zk

init zk
 - zk init notes

## Usage 🔧  
```bash
# Install chezmoi 📥
sh -c "$(curl -fsLS get.chezmoi.io)"

# clone and deploy 🎯
chezmoi init git@github.com:johnmanjiro13/dotfiles.git

# when you wanna add file to dotfile ➕
chezmoi add ~/.bashrc

# when you wanna edit file 📝
chezmoi edit ~/.bashrc
# or
chezmoi cd && nvim

# apply chezmoi changes to home directory 🔄
chezmoi apply ~/.zshrc
# or apply all
chezmoi apply

# do not forget to push chezmoi changes! 📡
chezmoi cd
git add .
git commit -m ""
git push
```
