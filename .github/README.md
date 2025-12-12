# Dotfiles

Personal dotfiles managed with [yadm](https://yadm.io/) - Yet Another Dotfiles Manager.

**Repository**: [uknth/dots](https://github.com/uknth/dots)

## Overview

This repository contains configuration files for a macOS development environment, including:

- **Shell**: Zsh with Oh My Zsh framework
- **Editors**: Neovim (primary), VS Code, Zed, Sublime Text
- **Terminals**: Ghostty, Alacritty, WezTerm
- **Development**: Go, Rust, Node.js, Java (SDKMAN)
- **DevOps**: Docker, Kubernetes (kind, helm, skaffold), Google Cloud
- **Productivity**: Obsidian, Raycast, Rectangle, Bitwarden

## Quick Start

### Fresh System Setup

```bash
# Install yadm
brew install yadm

# Clone dotfiles
yadm clone git@github.com:uknth/dots.git

# Run bootstrap script
yadm bootstrap
```

The bootstrap script automatically:
- Initializes git submodules (Oh My Zsh)
- Installs Homebrew (if missing)
- Installs all packages from `.Brewfile`
- Installs Rust nightly toolchain

### Updating Dotfiles

```bash
# Pull latest changes
yadm pull

# Add changes
yadm add <file>
yadm commit -m "message"
yadm push
```

## Structure

### Shell Configuration

- `.zshrc` - Main Zsh configuration
- `.profile/` - Modular shell scripts
  - `env.sh` - Environment variables
  - `exports.sh` - Export statements
  - `aliases.sh` - Command aliases

### Neovim

Location: `.config/nvim/`

Plugin categories:
- `ai.lua` - AI assistance plugins
- `code.lua` - Code editing enhancements
- `colorscheme.lua` - Theme configuration
- `lsp.lua` - Language Server Protocol
- `mini.lua` - mini.nvim suite
- `telescope.lua` - Fuzzy finder
- `treesitter.lua` - Syntax parsing
- `ui.lua` - UI enhancements

See `.config/nvim/KEYMAPS.md` for key bindings.

### Terminal Emulators

- `.config/ghostty/config` - Ghostty terminal
- `.alacritty.yml` - Alacritty terminal
- `.wezterm.lua` - WezTerm terminal

### Package Management

`.Brewfile` contains all Homebrew packages and casks.

#### Development Tools
```
fd, fzf, ripgrep, gitui, lazygit, tree, wget, zellij, zoxide
go, node, rust, rustup, luarocks, tree-sitter-cli
helm, kind, skaffold, gcloud-cli
```

#### GUI Applications
```
bitwarden, bruno, firefox, ghostty, insomnia, obsidian
raycast, rectangle, visual-studio-code, zed, sublime-text
syncthing-app, linearmouse, localsend
```

#### Nerd Fonts
Multiple Nerd Font variants for powerline/icon support in terminals.

### Security

Encrypted files (via `yadm encrypt`):
- `.ssh/id_rsa*` - SSH private keys
- `.ssh/config.d/*` - SSH host configurations

Archive location: `.local/share/yadm/archive`

## Key Features

### Modular Shell Config

Shell environment is sourced from modular scripts in `.profile/`:
- Easy to maintain and version control
- Separate concerns (aliases, exports, env vars)
- Automatically loaded by `.zshrc`

### Useful Aliases

```bash
w               # SSH to workstation
cc/ca           # cursor-agent
brew-save       # Update .Brewfile with installed packages
zola-*          # Dockerized Zola static site generator
```

### Integration Tools

- **fzf** - Command-line fuzzy finder
- **zoxide** - Smarter cd command
- **SDKMAN** - Java version management
- **rustup** - Rust toolchain management
- Docker Desktop with CLI completions

## Configuration Highlights

### Zsh Theme
Using `robbyrussell` theme from Oh My Zsh.

### Editor
Primary: Neovim with lazy plugin management
Default: vim (fallback)

### Path Extensions
```bash
~/.local/bin
~/.cargo/bin
/opt/homebrew/opt/rustup/bin
/opt/homebrew/opt/sqlite/bin
~/.codeium/windsurf/bin
```

## Maintenance

### Update Brewfile

```bash
brew list | xargs -L1 > .Brewfile
yadm add .Brewfile
yadm commit -m "Update Brewfile"
```

Or use the alias:
```bash
brew-save
```

### Encrypt Sensitive Files

```bash
yadm encrypt
```

Files listed in `.config/yadm/encrypt` are automatically encrypted.

## Platform

Designed for **macOS** (Darwin). The bootstrap script includes platform detection and skips Homebrew installation on non-Darwin systems.

## License

Personal configuration files - use at your own discretion.
