--
-- Code Outline
require("pckr").add({
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
    end,
  }
})


-- Code Completion using mini.completion
require("pckr").add({
  -- completion source - snippet
	{
		"rafamadriz/friendly-snippets",
	},
	{
		"nvim-mini/mini.snippets",
		branch = "stable",
		requires = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("mini.snippets").setup()
		end,
	},
	-- {
	-- 	"nvim-mini/mini.completion",
	-- 	branch = "stable",
	-- 	config = function()
	-- 		local imap_expr = function(lhs, rhs)
	-- 			vim.keymap.set('i', lhs, rhs, { expr = true })
	-- 		end
	-- 		require("mini.completion").setup({
	-- 			-- https://github.com/nvim-mini/mini.completion?tab=readme-ov-file#default-config
	-- 			-- configuration here
	-- 			--
	-- 			mappings = {
	-- 				force_twostep = '<C-Space>',
	-- 				force_fallback = '<A-Space>',
	-- 			},
	-- 		})
	--
	-- 		-- Tab to select next suggestion
	-- 		imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
	-- 		-- Shift+Tab to select previous suggestion
	-- 		imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
	-- 		-- Enter to accept suggestion
	-- 		imap_expr('<CR>', [[pumvisible() ? "\<C-y>" : "\<CR>"]])
	--
	--    end,
	-- },
  {
    'saghen/blink.cmp',
    requires = {
      'rafamadriz/friendly-snippets',
    },
    run = "cargo +nightly build --release",
    config = function()
      require('blink.cmp').setup({
        keymap = {
          preset = 'none',
          ['<Tab>'] = { 'select_next', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<CR>'] = { 'accept', 'fallback' },
          ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
          ['<C-e>'] = { 'hide' },
          ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
          ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        },
        completion = {
          documentation = {
            auto_show = false,
          },
          -- trigger = { prefetch_on_insert = false },
        },
        sources = {
          default = { 'lsp', 'path', 'buffer', 'snippets' },
        },
      })
    end
  },
})



-- Code Formatting
require("pckr").add({
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					go = { "gofmt" },
				},
			})
		end,
	},
})

require('pckr').add ({
  -- indent guide
  {
    'saghen/blink.indent',
    config = function()
      require('blink.indent').setup({
        mappings = {
          border = 'none',
        }
      })
    end
  },
})

-- bind: <leader>ff => format code
vim.keymap.set("n", "<leader>ff", function()
	require("conform").format()
end, { desc = "Code Format" })

vim.keymap.set("n", "<leader>fo", "<cmd>AerialToggle!<CR>", { desc = "Toggle Outline" })

