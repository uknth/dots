require("pckr").add({
	{ "neovim/nvim-lspconfig", tag = "v2.5.0" },

	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
        ensure_installed = {
          "java-debug-adapter",
          "java-test",
        }
      })
		end,
	},

	{
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
