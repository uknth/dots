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
	{
		"nvim-mini/mini.completion",
		branch = "stable",
		config = function()
			require("mini.completion").setup({
				-- https://github.com/nvim-mini/mini.completion?tab=readme-ov-file#default-config
				-- configuration here
				--
			})


    end,
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

-- bind: <leader>ff => format code
vim.keymap.set("n", "<leader>ff", function()
	require("conform").format()
end, { desc = "Code Format" })

vim.keymap.set("n", "<leader>fo", "<cmd>AerialToggle!<CR>", { desc = "Toggle Outline" })

