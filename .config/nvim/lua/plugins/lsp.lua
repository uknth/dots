-- LSP Configuration
require("pckr").add({
	{
		-- default neovim LSP
		"neovim/nvim-lspconfig",
		tag = "v2.5.0",
		requires = {
			{ "saghen/blink.cmp" },
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			require("lspconfig")["lua_ls"].setup({ capabilities = capabilities })
			require("lspconfig")["gopls"].setup({ capabilities = capabilities })
			require("lspconfig")["jdtls"].setup({ capabilities = capabilities })
		end,
	},
	{
		-- Mason to download LSP servers
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = {
          -- java
				},
			})
		end,
	},
	{
		-- configure existing lsp servers
		"mason-org/mason-lspconfig.nvim",
		requires = {
			{ "mason-org/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"vimls",
					"gopls",
					"copilot",
					"jdtls",
				},
				automatic_installation = true,
				automatic_enable = true,
			})
		end,
	},
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to t[Y]pe definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "K", function()
	return vim.lsp.buf.hover()
end, { desc = "Hover action" })
