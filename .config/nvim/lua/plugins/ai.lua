-- AI plugins for development
--
require("pckr").add({
	-- Sidekick
	-- -----------
	-- Sidekick is your Neovim AI sidekick that integrates Copilot LSP's "Next Edit Suggestions"
	-- with a built-in terminal for any AI CLI
	{
		"folke/sidekick.nvim",
		config = function()
			require("sidekick").setup({
        cli = {
          mux = {
            backend = "zellij",
            enabled = true,
          }
        }
      })
		end,
	},
})

vim.keymap.set({ "i", "n" }, "<tab>", function()
	-- if there is a next edit, jump to it, otherwise apply it if any
	if not require("sidekick").nes_jump_or_apply() then
		return "<Tab>" -- fallback to normal tab
	end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })

vim.keymap.set({ "n", "t", "i", "x" }, "<C-.>", function()
	require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle" })

vim.keymap.set("n", "<leader>aa", function()
	require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle CLI" })

vim.keymap.set("n", "<leader>as", function()
	require("sidekick.cli").select()
end, { desc = "Sidekick CLI Agent" })

vim.keymap.set("n", "<leader>ad", function()
	require("sidekick.cli").close()
end, { desc = "Detach a CLI Session" })

vim.keymap.set({ "x", "n" }, "<leader>at", function()
	require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send Selection to Agent" })

vim.keymap.set("n", "<leader>af", function()
  require("sidekick.cli").send({ msg = "{file}" })
end, { desc = "Send File to Agent" })

vim.keymap.set("x", "<leader>av", function() 
  require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual Selection to Agent" })

vim.keymap.set({"x","n"}, "<leader>ap", function()
  require("sidekick.cli").prompt()
end, { desc = "Sidekick Select Prompt" })

