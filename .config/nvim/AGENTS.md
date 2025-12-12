# Neovim Configuration - AI Agent Context

## Overview

This is a modular Neovim configuration (version 0.9+) focused on LSP integration, code completion, fuzzy finding, and AI-assisted development. The configuration uses `pckr.nvim` as the package manager and follows a clean, organized structure.

**Location**: `~/.config/nvim`  
**Colorscheme**: NordFox (nightfox.nvim)  
**Leader Key**: `<Space>`

---

## Directory Structure

```
.
├── init.lua                  # Entry point - loads all setup modules
├── .neoconf.json             # Neodev/Neoconf configuration
├── .gitignore                # Git ignore patterns
├── README.md                 # User documentation
├── KEYMAPS.md                # Comprehensive keymap reference
├── AGENTS.md                 # This file - AI agent context
├── after/
│   └── ftplugin/             # Filetype-specific settings
│       ├── lua.vim           # Lua: 2-space indentation
│       └── go.vim            # Go: 8-space indentation
└── lua/
    ├── setup/                # Core configuration modules
    │   ├── vim.lua           # Vim options, leader key, defaults
    │   ├── pckr.lua          # Package manager bootstrap
    │   ├── diagnostics.lua   # Diagnostic signs and configuration
    │   ├── plugins.lua       # Plugin loader (requires all plugin files)
    │   ├── keymaps.lua       # Default/global keymaps
    │   └── lang.lua          # Language-specific setup loader
    ├── plugins/              # Plugin configurations (one file per category)
    │   ├── telescope.lua     # Fuzzy finder + extensions
    │   ├── lsp.lua           # LSP servers via Mason
    │   ├── mini.lua          # Mini.nvim modules (basics, bufremove, comment)
    │   ├── treesitter.lua    # Syntax highlighting and parsing
    │   ├── ui.lua            # UI plugins (neo-tree, lualine, bufferline, etc.)
    │   ├── code.lua          # Code completion, snippets, formatting, outline
    │   ├── colorscheme.lua   # Colorscheme plugins
    │   ├── ai.lua            # AI integrations (NES + agentic window)
    │   └── others.lua        # Other plugins (Marp, Persisted)
    └── lang/                 # Language-specific configurations
        └── java.lua          # Java development with JDTLS
```

---

## Configuration Philosophy

1. **Modular Design**: Each plugin category has its own file in `lua/plugins/`
2. **Minimal Dependencies**: Uses lightweight plugins where possible (e.g., mini.nvim suite)
3. **LSP-First**: Native Neovim LSP with Mason for server management
4. **Stable Branches**: Plugins use stable branches when available for reliability
5. **Clean Keybindings**: Leader-based keymaps with mnemonic names
6. **Filetype Overrides**: Language-specific settings in `after/ftplugin/`

---

## Key Plugins & Their Roles

### Package Management
- **pckr.nvim**: Fast, minimal plugin manager with auto-bootstrap

### Fuzzy Finding
- **telescope.nvim**: Primary fuzzy finder
- **telescope-fzf-native.nvim**: FZF algorithm for faster sorting
- **telescope-smart-open.nvim**: Frecency-based file picker
- **persisted.nvim**: Session management with Telescope integration

### LSP & Language Support
- **nvim-lspconfig**: Native LSP client configuration
- **mason.nvim**: Automatic LSP server installation
- **nvim-jdtls**: Advanced Java development (separate config in `lua/lang/java.lua`)
- **Installed Servers**: lua_ls, vimls, gopls, copilot

### Treesitter
- **nvim-treesitter**: Syntax highlighting and code parsing
- **Languages**: bash, c, lua, vim, markdown, go, java, javascript, json, make, python, regex, yaml

### Code Features
- **blink.cmp**: Fast, extensible completion engine (Rust-based)
- **blink.indent**: Indent guide integration
- **mini.snippets**: Snippet engine
- **friendly-snippets**: Community snippet collection
- **conform.nvim**: Code formatting (stylua, black, isort, rustfmt, prettier, gofmt)
- **aerial.nvim**: Code outline/symbol navigation

### UI Enhancements
- **neo-tree.nvim**: File explorer with git integration
- **lualine.nvim**: Status line
- **bufferline.nvim**: Buffer tabs
- **mini.icons**: Icon provider
- **nvim-web-devicons**: Additional icons
- **nvim-notify**: Notification system
- **noice.nvim**: Enhanced UI for messages, cmdline, and popupmenu
- **which-key.nvim**: Keymap help popup

### Mini.nvim Suite
- **mini.basics**: Sensible defaults and basic mappings
- **mini.bufremove**: Better buffer deletion
- **mini.comment**: Fast commenting
- **mini.snippets**: Snippet engine
- **mini.icons**: Icon provider

### AI Integration
- **sidekick.nvim**: Dual-mode AI integration
  - **NES (Next Edit Suggestions)**: Inline code suggestions via Copilot CLI (LSP mode)
  - **Agentic Window**: Interactive AI chat with multiple agents (Claude Code, cursor-agent) via zellij mux

### Colorschemes
- **nightfox.nvim**: NordFox theme (active)
- **moonfly**: Alternative theme

### Other Utilities
- **blink.cmp**: Fast completion engine built in Rust with LSP integration
- **blink.indent**: Modern indent guide with blink.cmp integration
- **persisted.nvim**: Automatic session management per directory
- **marp-nvim**: Markdown presentation support (Marp preview server)

---

## Important Files & Their Purpose

### Entry Point
- **`init.lua`**: Loads all setup modules in order:
  1. `setup.vim` - Vim options and leader key
  2. `setup.pckr` - Bootstrap package manager
  3. `setup.diagnostics` - Diagnostic signs
  4. `setup.plugins` - Load all plugin configurations
  5. `setup.keymaps` - Global keymaps
  6. `setup.lang` - Language-specific configs
  7. Set colorscheme

### Core Setup Modules
- **`lua/setup/vim.lua`**: 
  - Leader key: `<Space>`
  - Default indentation: 4 spaces, expandtab
  - No text wrapping
  - Terminal colors, dark background
  - Relative line numbers

- **`lua/setup/pckr.lua`**: 
  - Auto-bootstraps pckr.nvim if not installed
  - Initializes plugin manager

- **`lua/setup/diagnostics.lua`**: 
  - Defines diagnostic signs (Error, Warn, Hint, Info)
  - Configures diagnostic display

- **`lua/setup/plugins.lua`**: 
  - Requires all plugin configuration files
  - Order: telescope → mini → code → lsp → treesitter → ui → ai → colorscheme → others

- **`lua/setup/keymaps.lua`**: 
  - Global keymaps (window navigation, buffer management, etc.)
  - Non-plugin-specific bindings

- **`lua/setup/lang.lua`**: 
  - Loads language-specific configurations from `lua/lang/`

### Plugin Configuration Files

Each file in `lua/plugins/` handles a specific category:

- **`telescope.lua`**: Fuzzy finding setup + keymaps (`<leader>sf`, `<leader>sg`, `<leader>sk`, `<leader>ss`, etc.)
- **`lsp.lua`**: LSP servers, Mason setup, LSP keymaps (gd, gr, K, etc.)
- **`mini.lua`**: Mini.nvim modules (basics, bufremove, comment)
- **`treesitter.lua`**: Treesitter configuration and language parsers
- **`ui.lua`**: File explorer, status line, notifications, which-key
- **`code.lua`**: Completion, snippets, formatting, code outline
- **`ai.lua`**: AI integrations (NES via Copilot CLI, agentic window via cursor-agent)
- **`colorscheme.lua`**: Theme plugins
- **`others.lua`**: Session management (persisted), presentations (marp)

---

## Default Settings

### Indentation
- **Default**: 4 spaces, expandtab
- **Lua**: 2 spaces (via `after/ftplugin/lua.vim`)
- **Go**: 8 spaces (via `after/ftplugin/go.vim`)

### Display
- Line numbers: Enabled with relative numbering
- Text wrapping: Disabled
- Terminal colors: Enabled
- Listchars: Disabled by default

### Key Bindings Style
- **Leader**: `<Space>`
- **Mnemonic prefixes**:
  - `<leader>s` = Search (Telescope)
  - `<leader>n` = Neo-tree
  - `<leader>l` = LSP/Diagnostics
  - `<leader>f` = Format/Outline
  - `<leader>b` = Buffers
  - `<leader>w` = Windows
  - `<leader>a` = AI/Agentic features
  - `<leader>c` = Code actions

---

## LSP Configuration

### Server Management
- **Mason** auto-installs LSP servers on first launch
- Servers configured: lua_ls, vimls, gopls, copilot
- Java uses separate JDTLS configuration

### LSP Keymaps (when server attaches)
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `gy` - Go to type definition
- `gD` - Go to declaration
- `K` - Hover documentation
- `<leader>ca` - Code action
- `<leader>cr` - Rename symbol
- `<leader>cc` - Run codelens

---

## Completion System

### Provider: blink.cmp
- Fast, extensible completion engine built in Rust
- LSP integration for intelligent suggestions
- Snippet support via mini.snippets
- Fallback to buffer/path completion

### Keymaps
- `<Tab>` - Select next completion item (or NES if no menu visible)
- `<S-Tab>` - Select previous completion item
- `<CR>` - Accept completion
- `<C-Space>` - Show/toggle completion menu
- `<C-e>` - Hide completion menu
- `<C-u>`/`<C-d>` - Scroll documentation up/down

**Note**: Tab prioritizes blink.cmp menu over NES suggestions

---

## AI Integration Details

### NES (Next Edit Suggestions)
- **Provider**: Copilot CLI with LSP mode
- **Auto-trigger**: Enabled with 150ms debounce
- **Keymaps**:
  - `<Tab>` - Accept/navigate suggestion (if no completion popup)
  - `<M-l>` - Accept inline suggestion
  - `<M-]>` - Next suggestion
  - `<M-[>` - Previous suggestion
  - `<M-e>` - Dismiss suggestion

### Agentic Window
- **Providers**: Multiple agents supported
  - `claude` - Claude Code CLI
  - `cursor-agent` - Cursor Agent
- **Agent Selection**: Auto-select enabled (no popup), use `<leader>as` to manually switch
- **Mux**: zellij backend
- **Keymaps**:
  - `<C-.>` or `<leader>aa` - Toggle agentic window
  - `<leader>as` - Select agent (switch between claude/cursor-agent)
  - `<leader>ad` - Close agentic session
  - `<leader>at` - Send selection to agent
  - `<leader>af` - Send file to agent
  - `<leader>av` - Send visual selection to agent
  - `<leader>ap` - Select prompt

---

## Formatting Configuration

### conform.nvim Formatters
- **Lua**: stylua
- **Python**: isort, black (sequential)
- **Rust**: rustfmt (LSP fallback)
- **JavaScript**: prettierd/prettier (first available)
- **Go**: gofmt

### Format Keymap
- `<leader>ff` - Format current buffer

---

## Common Editing Patterns

### File Navigation
1. `<leader><leader>` or `<leader>sf` - Find files
2. `<leader>so` - Smart open (frecency-based)
3. `<leader>sg` - Live grep
4. `<leader>ss` - Search sessions
5. `<leader>e` - Toggle file explorer

### Code Navigation
1. `gd` - Go to definition
2. `gr` - Find references
3. `{` / `}` - Jump between symbols (aerial)
4. `<leader>fo` - Toggle code outline

### Code Editing
1. Type → Get inline suggestions (NES)
2. `<M-l>` - Accept suggestion
3. `<leader>ca` - Code actions
4. `<leader>ff` - Format code
5. `gcc` - Comment/uncomment

### AI Assistance
1. `<C-.>` - Open agentic window
2. `<leader>as` - Select agent
3. Select code → `<leader>at` - Send to agent
4. `<leader>af` - Send entire file to agent

---

## Common Tasks for AI Agents

### Adding a New Plugin
1. Create/edit file in `lua/plugins/` for the category
2. Use `require("pckr").add({ ... })` syntax
3. Configure plugin in the `config` function
4. Add keymaps below the plugin configuration
5. Update `KEYMAPS.md` and `README.md` if needed

### Adding LSP Server
1. Edit `lua/plugins/lsp.lua`
2. Add server name to `ensure_installed` list in Mason setup
3. Add server configuration in `lspconfig[server].setup()` call
4. Restart Neovim - Mason will auto-install

### Adding Language Support
1. Add parser to Treesitter's `ensure_installed` in `lua/plugins/treesitter.lua`
2. Add formatter to `conform.nvim` in `lua/plugins/code.lua`
3. Create `after/ftplugin/<language>.vim` for filetype-specific settings
4. Optionally create `lua/lang/<language>.lua` for complex setups

### Modifying Keymaps
1. Plugin-specific: Edit keymaps in respective `lua/plugins/*.lua` file
2. Global keymaps: Edit `lua/setup/keymaps.lua`
3. Always update `KEYMAPS.md` to reflect changes

### Changing Colorscheme
1. Add plugin in `lua/plugins/colorscheme.lua`
2. Set colorscheme in `init.lua` (line 9)

---

## Important Constraints

### DO NOT
- Remove or modify the pckr bootstrap logic
- Change the plugin loading order in `setup/plugins.lua` (dependencies matter)
- Delete working configurations unless explicitly requested
- Modify LSP keymaps without checking conflicts
- Add plugins without considering mini.nvim alternatives first

### ALWAYS
- Test changes by restarting Neovim
- Update documentation (README.md, KEYMAPS.md) when changing keymaps
- Maintain the modular structure (one file per category)
- Use stable plugin branches when available
- Add comments for complex configurations

### PREFERENCES
- **Lightweight**: Prefer minimal, fast plugins (e.g., blink.cmp for completion)
- **Native**: Use native Neovim features when possible (e.g., LSP, diagnostics)
- **Modular**: Keep plugin configs in separate files by category
- **Documented**: Every keymap should be documented in KEYMAPS.md
- **Performance**: Choose Rust-based plugins when performance matters (e.g., blink.cmp, telescope-fzf)

---

## Troubleshooting Context

### Plugin Issues
- Plugins installed via pckr in `~/.local/share/nvim/site/pack/pckr/`
- Check `:PckrStatus` for plugin state
- Re-sync with `:PckrSync`

### LSP Issues
- Check `:LspInfo` for server status
- Mason installs servers to `~/.local/share/nvim/mason/`
- Check `:Mason` for installation status

### Completion Not Working
1. Check if LSP server is attached (`:LspInfo`)
2. Verify blink.cmp is loaded (`:lua print(require('blink.cmp').is_visible())`)
3. Check for keymap conflicts (especially Tab)
4. Ensure blink.cmp was compiled successfully (requires Rust nightly)
5. Check `:messages` for any blink.cmp errors

### AI Features Not Working
1. Verify `copilot` CLI is installed and in PATH (for NES)
2. Verify desired agent is installed:
   - `claude code` - Claude Code CLI
   - `cursor-agent` - Cursor Agent
3. Check zellij is installed and running for mux backend
4. Use `<leader>as` to select available agent if auto-select fails
5. Review sidekick.nvim configuration in `lua/plugins/ai.lua`

---

## File Modification Guidelines

### When editing plugin configurations:
1. **Location**: Modify the appropriate file in `lua/plugins/`
2. **Testing**: Restart Neovim after changes
3. **Documentation**: Update README.md and KEYMAPS.md if keymaps change
4. **Consistency**: Follow existing code style and patterns

### When adding new features:
1. **Research**: Check if mini.nvim has a module for it first
2. **Category**: Add to existing plugin file or create new one
3. **Require**: Add require statement to `lua/setup/plugins.lua`
4. **Document**: Add to README.md with usage examples

### When debugging:
1. **Check Logs**: `:messages` for error messages
2. **LSP Logs**: `:LspLog` for LSP-specific issues
3. **Plugin Status**: `:PckrStatus` for plugin state
4. **Keymaps**: `:map` to check all keymaps

---

## Version Information

- **Neovim**: >= 0.9
- **Config Version**: Personal configuration (updated December 2024)
- **License**: Personal use - freely available

---

## Quick Reference for Agents

### Most Common Files to Edit
1. `lua/plugins/lsp.lua` - LSP servers and configuration
2. `lua/plugins/code.lua` - Completion, formatting, snippets
3. `lua/plugins/ai.lua` - AI integrations
4. `lua/plugins/telescope.lua` - Fuzzy finding and extensions
5. `lua/plugins/others.lua` - Session management, presentations
6. `lua/setup/keymaps.lua` - Global keymaps
7. `init.lua` - Colorscheme and load order

### Most Common Tasks
1. **Add LSP server**: Edit `lua/plugins/lsp.lua`
2. **Add formatter**: Edit `lua/plugins/code.lua`
3. **Add keymap**: Edit appropriate plugin file + update KEYMAPS.md
4. **Add plugin**: Edit/create file in `lua/plugins/` + update `lua/setup/plugins.lua`
5. **Change indentation**: Create/edit `after/ftplugin/<filetype>.vim`

### Documentation Files
- **README.md**: User-facing documentation, feature overview
- **KEYMAPS.md**: Complete keymap reference
- **AGENTS.md**: This file - context for AI agents

---

*This document is maintained for AI agent context. Keep it updated when making structural changes to the configuration.*
