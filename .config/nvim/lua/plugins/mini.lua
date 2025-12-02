require("pckr").add({
	-- Basic Configurations
	{
		"nvim-mini/mini.basics",
		branch = "stable",
		config = function()
			require("mini.basics").setup({
        -- Basic options ('number', 'ignorecase', and many more)
        options = {
          basic = true,
          -- Extra UI features ('winblend', 'listchars', 'pumheight', ...)
          extra_ui = true,
          -- Presets for window borders ('single', 'double', ...)
          -- Default 'auto' infers from 'winborder' option
          win_borders = "auto",
        },
        -- Basic mappings (better 'jk', save with Ctrl+S, ...)
        mappings = {
          basic = true,
          -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
          -- Supply empty string to not create these mappings.
          option_toggle_prefix = [[\]],
          -- Window navigation with <C-hjkl>, resize with <C-arrow>
          windows = true,
          -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
          move_with_alt = false,
        },
        -- Autocommands. Set field to `false` to disable
        autocommands = {
          -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
          basic = true,
          -- Set 'relativenumber' only in linewise and blockwise Visual mode
          relnum_in_visual_mode = true,
        },
        -- Whether to disable showing non-error feedback
        silent = false,
		  })
		end,
	},
	-- Remove Buffer
	{
		"nvim-mini/mini.bufremove",
		branch = "stable",
		config = function()
			require("mini.bufremove").setup({})
		end,
	},
	-- Commenting utility
	{
		"nvim-mini/mini.comment",
		branch = "stable",
		config = function()
			require("mini.comment").setup({
				mapping = {
					-- Keymaps
					--
					-- bind: gcc => comment block
					-- bind: gcl => comment line
					-- bind: gcv => comment visual
					-- bind: gct => comment text object
					--
					-- comment
					comment = "gcc",
					-- comment line
					comment_line = "gcl",
					-- comment visual
					comment_visual = "gcv",
					-- comment text
					textobject = "gct",
				},
			})
		end,
	},
})

-- Delete Buffer using `mini.bufremove`
-- bind: <leader>bd => [B]uffer [D]elete
vim.keymap.set("n", "<leader>bd", function()
	require("mini.bufremove").delete()
end, { desc = "[B]uffer [D]elete" })
