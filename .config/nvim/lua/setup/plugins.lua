-- include all plugins here, actual initialization happens in the plugin specific file
--
-- Telescope [ https://github.com/nvim-telescope/telescope.nvim ]
-- telescope.nvim is a highly extendable fuzzy finder over lists.
--
-- Extensions: fzf, smart_open
--
require('plugins.telescope')

-- Mini [ https://github.com/nvim-mini/mini.nvim ]
-- Library of 40+ independent Lua modules improving overall Neovim (version 0.9 and higher) experience with minimal effort
--
require('plugins.mini')

-- LSP [ https://github.com/neovim/nvim-lspconfig ]
-- nvim-lspconfig is a collection of LSP server configurations for the Nvim LSP client.
--
require('plugins.lsp')

-- Treesitter for Neovim [ https://github.com/nvim-treesitter/nvim-treesitter ]
-- Provide a simple and easy way to use the interface for tree-sitter in Neovim
--
-- Treesitter = Tree-sitter is a parser generator tool and an incremental parsing library
--
require('plugins.treesitter')

-- Set of UI Plugins
--
-- mini.icon, neotree
require('plugins.ui')

-- Code completion, formatting
--
require('plugins.code')


-- AI related Plugins
--
require('plugins.ai')

-- Colorschemes
--
require('plugins.colorscheme')
