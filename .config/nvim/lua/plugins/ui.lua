-- Set of UI plugins for Neovim
--
-- Mini Icons
require("pckr").add({
	"nvim-mini/mini.icons",
	branch = "stable",
	config = function()
		require("mini.icons").setup()
	end,
})
-- NeoTree for file explorer
require("pckr").add({
	{ "MunifTanjim/nui.nvim" },

	{ "nvim-tree/nvim-web-devicons" },

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("neo-tree").setup({
				-- options go here
				-- https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#configuration
				clipboard = {
					sync = "universal",
				},
			})
		end,
	},
})
-- keymaps for neo-tree
--
-- bind: <leader>e => Toggle Explorer
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
-- bind: <leader>nf => Floating Explorer
vim.keymap.set("n", "<leader>nf", "<cmd>Neotree position=float<cr>", { desc = "Show floating explorer" })
-- bind: <leader>nl => Explorer on left
vim.keymap.set("n", "<leader>nl", "<cmd>Neotree position=left<cr>", { desc = "Show floating explorer" })
-- bind: <leader>nb => Floating buffer explorer
vim.keymap.set("n", "<leader>nb", "<cmd>Neotree position=float buffers", { desc = "Show floating buffer" })
-- bind: <leader>ng => Floating git status
vim.keymap.set("n", "<leader>ng", "<cmd>Neotree position=float status", { desc = "Show floating Git status" })
--
-- Status Lines & Buffers
require("pckr").add({
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({})
		end,
	},
})
-- UI elements using Noice
-- plugin that completely replaces the UI for messages, cmdline and the popupmenu
--
require('pckr').add{
  {  'rcarriga/nvim-notify' },
  {
    "folke/noice.nvim",
    requires = {
      {
         'rcarriga/nvim-notify',
      },
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end
  }
}
-- Whichkey to show suggestions  of neovim keymaps
--
require('pckr').add({
  {
    "folke/which-key.nvim",
    config = function()
    end
  }
})
-- bind: <leader>? => show 'whichkey' suggestions
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
