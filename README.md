# Dotfiles 🏠

## About 
My dotfiles managed by [chezmoi](https://chezmoi.io) ⚡

## Requirements ✅

> **Note**: Packages and binaries are automatically installed when you run `chezmoi apply`:
>
> **System packages (via `run_once_` scripts):**
> - Packages (curl, git, wget, unzip, zsh, build-essential, ripgrep, fzf, fd-find, espeak-ng) and starship prompt via `run_once_01-install-packages.sh`
> - Node packages (Volta, Node.js, npm, Claude Code CLI) via `run_once_02-install-node-packages.sh`
>
> **External binaries (via `.chezmoiexternal.toml`):**
> - nvim (v0.11.5)
> - tree-sitter (v0.24.4 - GLIBC 2.36 compatible)
> - lazygit (latest release)

## Installation 🚀

### chezmoi 🏠
```bash
# One-liner: install chezmoi, clone dotfiles, and apply
sh -c "$(curl -fsLS get.chezmoi.io) -- init --apply dullmode"
```

After all binaries and packages installed. install formatter, lsp, and linter using mason in nvim.

## Usage 🚀
```bash
# when you wanna add file to dotfile ➕
chezmoi add ~/.bashrc

# apply chezmoi changes to home directory
chezmoi apply ~/.zshrc
# or apply all
chezmoi apply
# or refresh all
chezmoi apply --init --refresh-externals
