# Dotfiles 🏠

## About 
My dotfiles managed by [chezmoi](https://chezmoi.io) ⚡

## Installation 🚀

```bash
# One-liner: install chezmoi, clone dotfiles, and apply
sh -c "$(curl -fsLS get.chezmoi.io) -- init --apply dullmode"
```

## Usage 🚀
```bash
# syncs the chezmoi source from actual file
ckezmoi add ~/.config/nvim

# apply chezmoi changes to home directory
chezmoi apply ~/.zshrc
# or apply all
chezmoi apply
# or refresh all
chezmoi apply --init --refresh-externals
```
