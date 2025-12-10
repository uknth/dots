# Neovim Keymaps Reference

This document lists all custom keymaps configured in this Neovim setup, along with important default Vim keymaps that aren't overridden.

**Leader Key**: `Space`

---

## Table of Contents
- [Window Operations](#window-operations)
- [Buffer Management](#buffer-management)
- [File Explorer (Neo-tree)](#file-explorer-neo-tree)
- [Search (Telescope)](#search-telescope)
- [Code Navigation & Outline](#code-navigation--outline)
- [Code Editing](#code-editing)
- [Code Formatting & Actions](#code-formatting--actions)
- [Comments](#comments)
- [Diagnostics](#diagnostics)
- [AI Features (Sidekick)](#ai-features-sidekick)
- [UI & Help](#ui--help)
- [Vim Default Keymaps (Not Overridden)](#vim-default-keymaps-not-overridden)

---

## Window Operations

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<C-h>` | `<C-w>h` | Go to Left Window |
| `n` | `<C-j>` | `<C-w>j` | Go to Lower Window |
| `n` | `<C-k>` | `<C-w>k` | Go to Upper Window |
| `n` | `<C-l>` | `<C-w>l` | Go to Right Window |
| `n` | `<leader>-` | `<C-W>s` | Split Window Below |
| `n` | `<leader>\|` | `<C-W>v` | Split Window Right |
| `n` | `<leader>wd` | `<C-W>c` | Delete Window |

---

## Buffer Management

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<S-h>` | `:bprevious` | Previous Buffer |
| `n` | `<S-l>` | `:bnext` | Next Buffer |
| `n` | `<leader>\`` | `:e #` | Switch to Other Buffer (Alternate) |
| `n` | `<leader>bd` | `mini.bufremove.delete()` | Delete Buffer |

---

## File Explorer (Neo-tree)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>e` | `:Neotree toggle` | Toggle Neotree |
| `n` | `<leader>nf` | `:Neotree position=float` | Show Floating Explorer |
| `n` | `<leader>nl` | `:Neotree position=left` | Show Explorer on Left |
| `n` | `<leader>nb` | `:Neotree position=float buffers` | Show Floating Buffer Explorer |
| `n` | `<leader>ng` | `:Neotree position=float status` | Show Floating Git Status |

---

## Search (Telescope)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader><leader>` | `telescope.builtin.find_files` | Search Files (Quick Access) |
| `n` | `<leader>sf` | `telescope.builtin.find_files` | [S]earch [F]iles |
| `n` | `<leader>so` | `telescope.extensions.smart_open` | [S]earch [S]mart Open (Frecency) |
| `n` | `<leader>sg` | `telescope.builtin.live_grep` | [S]earch by [G]repping |
| `n` | `<leader>sb` | `telescope.builtin.buffers` | [S]earch [B]uffers |
| `n` | `<leader>sh` | `telescope.builtin.help_tags` | [S]earch [H]elp Tags |

---

## Code Navigation & Outline

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `{` | `:AerialPrev` | Jump to Previous Symbol (Aerial) |
| `n` | `}` | `:AerialNext` | Jump to Next Symbol (Aerial) |
| `n` | `<leader>fo` | `:AerialToggle!` | Toggle Code Outline |

### LSP Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `gd` | `vim.lsp.buf.definition` | Goto Definition |
| `n` | `gr` | `vim.lsp.buf.references` | Go to References |
| `n` | `gI` | `vim.lsp.buf.implementation` | Go to Implementation |
| `n` | `gy` | `vim.lsp.buf.type_definition` | Go to t[Y]pe Definition |
| `n` | `gD` | `vim.lsp.buf.declaration` | Go to Declaration |
| `n` | `K` | `vim.lsp.buf.hover` | Hover Documentation |

---

## Code Editing

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `x` | `<` | `<gv` | Better Indenting (maintains selection) |
| `x` | `>` | `>gv` | Better Indenting (maintains selection) |
| `n`, `x`, `o` | `n` | Smart next search | Next Search Result (auto-centers) |
| `n`, `x`, `o` | `N` | Smart prev search | Previous Search Result (auto-centers) |

---

## Code Formatting & Actions

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>ff` | `conform.format()` | Format Code (using conform.nvim) |
| `n`, `x` | `<leader>ca` | `vim.lsp.buf.code_action` | Code Action |
| `n`, `x` | `<leader>cc` | `vim.lsp.codelens.run` | Run Codelens |
| `n` | `<leader>cr` | `vim.lsp.buf.rename` | Rename Symbol |

---

## Comments

Using `mini.comment` plugin:

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `gcc` | Toggle comment | Comment/Uncomment (motion/line) |
| `n` | `gcl` | Toggle comment line | Comment/Uncomment Line |
| `v` | `gcv` | Toggle comment visual | Comment/Uncomment Visual Selection |
| `n` | `gct` | Toggle comment textobject | Comment/Uncomment Text Object |

---

## Diagnostics

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>ld` | `vim.diagnostic.open_float` | Show Line Diagnostics (floating window) |
| `n` | `]d` | `vim.diagnostic.goto_next` | Next Diagnostic |
| `n` | `[d` | `vim.diagnostic.goto_prev` | Previous Diagnostic |
| `n` | `]e` | `vim.diagnostic.goto_next` (ERROR) | Next Error Diagnostic |
| `n` | `[e` | `vim.diagnostic.goto_prev` (ERROR) | Previous Error Diagnostic |

---

## AI Features (Sidekick)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n`, `t`, `i`, `x` | `<C-.>` | `sidekick.cli.toggle()` | Toggle Sidekick CLI |
| `n` | `<leader>aa` | `sidekick.cli.toggle()` | Toggle Sidekick CLI |
| `n` | `<leader>as` | `sidekick.cli.select()` | Sidekick CLI Agent |
| `n` | `<leader>ad` | `sidekick.cli.close()` | Detach a CLI Session |
| `x`, `n` | `<leader>at` | `sidekick.cli.send({msg = "{this}"})` | Send Selection to Agent |
| `n` | `<leader>af` | `sidekick.cli.send({msg = "{file}"})` | Send File to Agent |
| `x` | `<leader>av` | `sidekick.cli.send({msg = "{selection}"})` | Send Visual Selection to Agent |
| `x`, `n` | `<leader>ap` | `sidekick.cli.prompt()` | Sidekick Select Prompt |
| `i`, `n` | `<Tab>` | `sidekick.nes_jump_or_apply()` | Goto/Apply Next Edit Suggestion |

---

## UI & Help

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>?` | `which-key.show()` | Show Buffer Local Keymaps (which-key) |

---

## Vim Default Keymaps (Not Overridden)

These are essential Vim keymaps that remain available in this configuration:

### Motion/Navigation

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `h`, `j`, `k`, `l` | Move left, down, up, right |
| `n` | `w`, `b`, `e` | Move forward/backward by word |
| `n` | `0`, `$` | Move to start/end of line |
| `n` | `gg`, `G` | Move to first/last line |
| `n` | `%` | Jump to matching bracket |
| `n` | `f{char}`, `F{char}` | Find character forward/backward |
| `n` | `t{char}`, `T{char}` | Till character forward/backward |
| `n` | `;`, `,` | Repeat f/t/F/T forward/backward |
| `n` | `<C-u>`, `<C-d>` | Scroll half-page up/down |
| `n` | `<C-b>`, `<C-f>` | Scroll full-page up/down |
| `n` | `*`, `#` | Search word under cursor forward/backward |

### Editing

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `i`, `a` | Insert before/after cursor |
| `n` | `I`, `A` | Insert at start/end of line |
| `n` | `o`, `O` | Open new line below/above |
| `n` | `x`, `X` | Delete character under/before cursor |
| `n` | `d{motion}` | Delete with motion (e.g., `dw`, `dd`, `d$`) |
| `n` | `c{motion}` | Change with motion (e.g., `cw`, `cc`, `c$`) |
| `n` | `y{motion}` | Yank/copy with motion (e.g., `yw`, `yy`, `y$`) |
| `n` | `p`, `P` | Paste after/before cursor |
| `n` | `u`, `<C-r>` | Undo, Redo |
| `n` | `.` | Repeat last change |
| `n` | `r{char}` | Replace character under cursor |
| `n` | `~` | Toggle case of character |
| `n` | `J` | Join lines |

### Visual Mode

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `v` | Visual character mode |
| `n` | `V` | Visual line mode |
| `n` | `<C-v>` | Visual block mode |
| `v` | `o` | Switch cursor to other end of selection |
| `v` | `d`, `c`, `y` | Delete, change, yank selection |

### Marks & Jumps

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `m{a-z}` | Set mark at cursor position |
| `n` | `'{mark}` | Jump to mark's line |
| `n` | `` `{mark}`` | Jump to mark's exact position |
| `n` | `<C-o>`, `<C-i>` | Jump to older/newer cursor position |
| `n` | `''`, ``` `` ``` | Jump back to last position |

### Search & Replace

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `/pattern` | Search forward for pattern |
| `n` | `?pattern` | Search backward for pattern |
| `n` | `:%s/old/new/g` | Replace all occurrences in file |
| `n` | `:s/old/new/g` | Replace in current line |
| `n` | `:noh` | Clear search highlighting |

### Registers & Macros

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `"{register}` | Use specific register (e.g., `"ay`, `"ap`) |
| `n` | `q{register}` | Start recording macro |
| `n` | `q` | Stop recording macro |
| `n` | `@{register}` | Play macro |
| `n` | `@@` | Replay last macro |

### Text Objects

| Mode | Key | Description |
|------|-----|-------------|
| `o`, `v` | `iw`, `aw` | Inner word, a word |
| `o`, `v` | `is`, `as` | Inner sentence, a sentence |
| `o`, `v` | `ip`, `ap` | Inner paragraph, a paragraph |
| `o`, `v` | `i(`, `a(` (or `i)`, `a)`) | Inner/around parentheses |
| `o`, `v` | `i{`, `a{` (or `i}`, `a}`) | Inner/around braces |
| `o`, `v` | `i[`, `a[` (or `i]`, `a]`) | Inner/around brackets |
| `o`, `v` | `i"`, `a"` | Inner/around double quotes |
| `o`, `v` | `i'`, `a'` | Inner/around single quotes |
| `o`, `v` | `i\`` , `a\`` | Inner/around backticks |
| `o`, `v` | `it`, `at` | Inner/around tag (HTML/XML) |

### Command Mode

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `:w` | Write/save file |
| `n` | `:q` | Quit |
| `n` | `:wq` or `:x` | Write and quit |
| `n` | `:q!` | Quit without saving |
| `n` | `:e {file}` | Edit file |
| `n` | `:bn`, `:bp` | Next/previous buffer |
| `n` | `:b {name}` | Switch to buffer by name |

### Window Management (Default, not overridden)

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `<C-w>s` | Split window horizontally |
| `n` | `<C-w>v` | Split window vertically |
| `n` | `<C-w>q` | Close current window |
| `n` | `<C-w>=` | Equalize window sizes |
| `n` | `<C-w>_` | Maximize window height |
| `n` | `<C-w>\|` | Maximize window width |
| `n` | `<C-w>r` | Rotate windows |
| `n` | `<C-w>T` | Move window to new tab |

### Folding

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `za` | Toggle fold |
| `n` | `zo` | Open fold |
| `n` | `zc` | Close fold |
| `n` | `zR` | Open all folds |
| `n` | `zM` | Close all folds |

### Other Useful Defaults

| Mode | Key | Description |
|------|-----|-------------|
| `n` | `ZZ` | Save and quit |
| `n` | `ZQ` | Quit without saving |
| `i` | `<C-n>`, `<C-p>` | Auto-completion next/previous |
| `i` | `<C-w>` | Delete word before cursor |
| `i` | `<C-u>` | Delete all before cursor in line |

---

## Mode Abbreviations

- `n` = Normal mode
- `i` = Insert mode
- `v` = Visual mode
- `x` = Visual mode (character/line)
- `o` = Operator-pending mode
- `t` = Terminal mode

---

## Notes

1. **mini.basics** plugin provides additional sensible defaults and basic mappings
2. **Option toggle prefix** is set to `\` for toggling common options (from mini.basics)
3. Completion is handled by `mini.completion` - use `<C-n>` and `<C-p>` in insert mode
4. Code formatting uses `conform.nvim` with support for multiple languages (Lua, Python, Rust, JavaScript, Go)
5. LSP keymaps are defined in `lua/plugins/lsp.lua` and are available when LSP servers are active
6. Aerial code outline navigation with `{` and `}` is only available when Aerial attaches to a buffer
