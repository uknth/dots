# Neovim Configuration

A modern, modular Neovim configuration focused on LSP, code completion, fuzzy finding, and AI-assisted development.

## Structure

```
.
├── init.lua                 # Entry point
├── README.md                # User documentation
├── KEYMAPS.md               # Comprehensive keymap reference
├── AGENTS.md                # AI agent context documentation
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
│   │   ├── ai.lua          # AI integrations (Copilot + cursor-agent)
│   │   └── others.lua      # Other plugins (Marp, Persisted)
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
- **Keymaps**: `<leader>sk`
- **Sessions**: `<leader>ss` (persisted.nvim integration)
- **Extensions**: FZF native, Smart Open, Persisted

#### LSP & Language Support
- **LSP Config**: Neovim native LSP
- **Mason**: Automatic LSP server installation
- **Installed Servers**: lua_ls, vimls, gopls, copilot
- **Java Support**: nvim-jdtls for advanced Java development features

#### Treesitter
- **Supported Languages**: bash, c, lua, vim, markdown, go, java, javascript, json, make, python, regex, yaml
- **Auto-install**: Enabled

#### Code Features
- **Completion**: blink.cmp with LSP integration
  - `<Tab>` - Select next completion (or NES if no menu)
  - `<S-Tab>` - Select previous completion
  - `<CR>` - Accept completion
  - `<C-Space>` - Show/toggle completion menu
  - `<C-e>` - Hide completion menu
  - `<C-u>`/`<C-d>` - Scroll documentation
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
- **NES (Next Edit Suggestions)**: Copilot CLI with LSP mode for inline code suggestions
  - Accept suggestion: `<M-l>` (Alt+l)
  - Next suggestion: `<M-]>` (Alt+])
  - Previous suggestion: `<M-[>` (Alt+[)
  - Dismiss: `<M-e>` (Alt+e)
  - Accept/Navigate with Tab: `<Tab>`
- **Agentic Window**: cursor-agent via zellij mux for interactive AI assistance
  - Toggle: `<C-.>` or `<leader>aa`
  - Select agent: `<leader>as`
  - Close session: `<leader>ad`
  - Send selection: `<leader>at`
  - Send file: `<leader>af`
  - Send visual: `<leader>av`
  - Select prompt: `<leader>ap`

#### Mini.nvim Modules
- **mini.basics**: Basic configurations and mappings
- **mini.bufremove**: Better buffer deletion (`<leader>bd`)
- **mini.comment**: Fast commenting (`gcc`, `gcl`, `gcv`, `gct`)
- **mini.snippets**: Snippet engine
- **mini.icons**: Icon provider

#### Other Plugins
- **blink.cmp**: Fast, extensible completion engine (Rust-based)
- **blink.indent**: Indent guides integration
- **persisted.nvim**: Session management via Telescope (`<leader>ss`)
- **marp-nvim**: Markdown presentation support
  - Toggle preview: `<leader>MT`
  - Status: `<leader>MS`

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
   - Rust with nightly toolchain (for blink.cmp: `rustup toolchain install nightly`)
   - ripgrep (for live_grep)
   - fd (optional, for better file finding)
   - copilot CLI (for NES inline suggestions)
   - cursor-agent (optional, for agentic window)
   - zellij (optional, for agentic window mux backend)

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
- AI agent context is documented in `AGENTS.md`
- Tab key intelligently prioritizes: blink.cmp menu → NES suggestions → normal Tab
- blink.cmp requires Rust with nightly toolchain for compilation

## License

Personal configuration - use freely.
