-- Telescope Setup
require("pckr").add({
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
			{
				"danielfalk/smart-open.nvim",
				branch = "0.2.x",
				config = function()
					require("telescope").load_extension("smart_open")
				end,
				requires = {
					{ "kkharji/sqlite.lua" },
					{ "nvim-telescope/telescope-fzf-native.nvim" },
				},
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					smart_open = {
						match_algorithm = "fzf",
						disable_devicons = false,
					},
					persisted = {
						layout_config = { width = 0.55, height = 0.55 },
					},
				},
			})
		end,
	},
})

-- Telescope Keymaps
--
-- bind: <leader>so => search smart_open
vim.keymap.set("n", "<leader>so", function()
	require("telescope").extensions.smart_open.smart_open()
end, { noremap = true, silent = true, desc = "[S]earch [S]mart Open" })

-- bind: <leader>sf => search files
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })

-- bind: <leader><leader> = search files
vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })

-- bind: <leader>sg => search by grepping
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]repping" })

-- bind: <leader>sb => search buffers
vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch [B]uffers" })

-- bind: <leader>sh => search help tags
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp tags" })
