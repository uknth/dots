# Neovim Configuration

A modern, modular Neovim configuration focused on LSP, code completion, fuzzy finding, and AI-assisted development.

## Structure

```
.
├── init.lua                 # Entry point
├── KEYMAPS.md               # Comprehensive keymap reference
├── .gitignore               # Git ignore rules
├── .neoconf.json            # Neoconf configuration
├── lua/
│   ├── setup/              # Core setup modules
│   │   ├── vim.lua         # Vim options and leader key
│   │   ├── pckr.lua        # Package manager bootstrap
│   │   ├── diagnostics.lua # Diagnostic signs and configuration
│   │   ├── plugins.lua     # Plugin loader
│   │   ├── keymaps.lua     # Default keymaps
│   │   └── lang.lua        # Language-specific setup loader
│   ├── plugins/            # Plugin configurations
│   │   ├── telescope.lua   # Fuzzy finder
│   │   ├── lsp.lua         # LSP and Mason
│   │   ├── mini.lua        # Mini.nvim modules
│   │   ├── treesitter.lua  # Syntax highlighting
│   │   ├── ui.lua          # UI plugins (neo-tree, lualine, etc.)
│   │   ├── code.lua        # Code completion and formatting
│   │   ├── colorscheme.lua # Colorscheme plugins
│   │   └── ai.lua          # AI integrations (Sidekick)
│   └── lang/               # Language-specific configurations
│       └── java.lua        # Java development with JDTLS
└── after/
    └── ftplugin/           # Filetype-specific settings
        ├── lua.vim         # Lua: 2-space indentation
        └── go.vim          # Go: 8-space indentation
```

## Features

### Core Functionality
- **Package Manager**: [pckr.nvim](https://github.com/lewis6991/pckr.nvim) - Fast, minimal plugin manager
- **Leader Key**: `<Space>`
- **Colorscheme**: NordFox (from nightfox.nvim) - Also includes Moonfly colors
- **Line Numbers**: Enabled with relative numbering
- **Default Indentation**: 4 spaces (customizable per filetype)

### Plugin Categories

#### Fuzzy Finding (Telescope)
- **File search**: `<leader><leader>` or `<leader>sf`
- **Smart open**: `<leader>so` (frecency-based file picker)
- **Live grep**: `<leader>sg`
- **Buffers**: `<leader>sb`
- **Help tags**: `<leader>sh`
- **Extensions**: FZF native, Smart Open

#### LSP & Language Support
- **LSP Config**: Neovim native LSP
- **Mason**: Automatic LSP server installation
- **Installed Servers**: lua_ls, vimls, gopls, copilot
- **Java Support**: nvim-jdtls for advanced Java development features

#### Treesitter
- **Supported Languages**: bash, c, lua, vim, markdown, go, java, javascript, json, make, python, regex, yaml
- **Auto-install**: Enabled

#### Code Features
- **Completion**: mini.completion with LSP integration
- **Snippets**: mini.snippets with friendly-snippets
- **Formatting**: conform.nvim with formatters:
  - Lua: stylua
  - Python: isort, black
  - Rust: rustfmt
  - JavaScript: prettier/prettierd
  - Go: gofmt
- **Code Outline**: aerial.nvim
  - Toggle: `<leader>fo`
  - Previous symbol: `{`
  - Next symbol: `}`

#### UI Enhancements
- **File Explorer**: neo-tree.nvim (`<leader>e` to toggle)
- **Status Line**: lualine.nvim
- **Buffer Line**: bufferline.nvim
- **Icons**: mini.icons, nvim-web-devicons
- **Notifications**: nvim-notify with noice.nvim
- **Key Help**: which-key.nvim (`<leader>?`)

#### AI Integration
- **Sidekick**: AI-powered code suggestions and CLI integration
  - Toggle CLI: `<C-.>` or `<leader>aa`
  - Select agent: `<leader>as`
  - Detach/close session: `<leader>ad`
  - Send selection: `<leader>at`
  - Send file: `<leader>af`
  - Send visual: `<leader>av`
  - Select prompt: `<leader>ap`
  - Apply suggestions: `<Tab>`

#### Mini.nvim Modules
- **mini.basics**: Basic configurations and mappings
- **mini.bufremove**: Better buffer deletion (`<leader>bd`)
- **mini.comment**: Fast commenting (`gcc`, `gcl`, `gcv`, `gct`)
- **mini.completion**: Lightweight completion
- **mini.snippets**: Snippet engine
- **mini.icons**: Icon provider

## Key Mappings

### Window Management
- `<C-h/j/k/l>`: Navigate windows
- `<leader>-`: Split window below
- `<leader>|`: Split window right
- `<leader>wd`: Delete window

### Buffer Management
- `<S-h>`: Previous buffer
- `<S-l>`: Next buffer
- `<leader>```: Switch to last buffer
- `<leader>bd`: Delete buffer

### Diagnostics
- `<leader>ld`: Show line diagnostics
- `]d` / `[d`: Next/previous diagnostic
- `]e` / `[e`: Next/previous error

### Code Actions
- `<leader>ff`: Format code
- `<leader>fo`: Toggle code outline

### File Explorer (neo-tree)
- `<leader>e`: Toggle explorer
- `<leader>nf`: Floating explorer
- `<leader>nl`: Left explorer
- `<leader>nb`: Buffer explorer
- `<leader>ng`: Git status

### Other
- `<` / `>`: Better indenting in visual mode
- `n` / `N`: Better search navigation

## Installation

1. **Prerequisites**:
   - Neovim >= 0.9
   - Git
   - A C compiler (for telescope-fzf-native)
   - ripgrep (for live_grep)
   - fd (optional, for better file finding)

2. **Install**:
   ```bash
   # Backup existing config
   mv ~/.config/nvim ~/.config/nvim.backup
   
   # Clone this config
   git clone <your-repo> ~/.config/nvim
   
   # Start Neovim - pckr will auto-install
   nvim
   ```

3. **First Launch**:
   - Pckr will automatically bootstrap and install plugins
   - Mason will install configured LSP servers
   - Treesitter will install parsers

## Notes

- Filetype-specific indentation is handled in `after/ftplugin/`
- Language-specific configurations (like Java) are organized in `lua/lang/` and loaded via `lua/setup/lang.lua`
- LSP servers are auto-installed via Mason
- All plugin configs are modular and can be disabled by commenting out the require in `lua/setup/plugins.lua`
- The configuration uses stable branches where available for reliability
- A comprehensive keymap reference is available in `KEYMAPS.md`

## License

Personal configuration - use freely.
