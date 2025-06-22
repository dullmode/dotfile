# Dotfiles 🏠

## About ℹ️ 
My dotfiles managed by [chezmoi](https://chezmoi.io) ⚡

## Requirements ✅
- 💻 chezmoi  
- 🎨 nvim (and symbolic to ./local/bin)
- 🚀 volta()

## Not requirements ⚠️
- 🎨 nvim config file
- 🖥️ bashrc
- 🔎 rg

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
