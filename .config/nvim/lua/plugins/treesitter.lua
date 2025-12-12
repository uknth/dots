-- Treesitter, requires Treesitter binary and some compilations
require("pckr").add({
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
        "bash",
				"c",
				"lua",
				"vim",
				"markdown",
				"go",
				"gomod",
				"gosum",
				"java",
				"javascript",
				"json",
				"lua",
				"make",
				"python",
        "regex",
				"yaml",
			},
		})
	end,
})
