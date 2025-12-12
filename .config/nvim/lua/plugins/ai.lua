-- AI Integration
-- ===============
-- NES (Next Edit Suggestions): Copilot CLI with LSP mode
-- Agentic Window: cursor-agent via zellij mux
--
require("pckr").add({
	{
		"folke/sidekick.nvim",
		config = function()
			require("sidekick").setup({
				-- NES: Inline suggestions via Claude Code (LSP mode)
				nes = {
					enabled = true,
				},
				-- CLI: claude code for agentic window
				cli = {
					mux = {
						backend = "zellij",
						enabled = true,
					},
				},
			})
		end,
	},
})


-- Keymaps
-- =======

-- NES (Inline Suggestions) - Copilot CLI
-- ---------------------------------------
-- Tab to jump to or apply next edit suggestion
vim.keymap.set({ "i", "n" }, "<Tab>", function()
	-- In insert mode, check if blink.cmp completion menu is visible first
	if vim.fn.mode() == "i" then
		local blink_ok, blink = pcall(require, 'blink.cmp')
		if blink_ok and blink.is_visible() then
			return "<C-n>"
		end
	end
	if not require("sidekick").nes_jump_or_apply() then
		return "<Tab>"
	end
end, { expr = true, desc = "Accept/Navigate NES or Tab" })

vim.keymap.set("i", "<M-l>", function()
	require("sidekick").nes_accept()
end, { desc = "Accept Inline Suggestion" })

vim.keymap.set("i", "<M-e>", function()
	require("sidekick").nes_dismiss()
end, { desc = "Dismiss Inline Suggestion" })

-- Agentic Window - cursor-agent
-- ------------------------------
vim.keymap.set({ "n", "t", "i", "x" }, "<C-.>", function()
	require("sidekick.cli").toggle()
end, { desc = "Toggle Agentic Window" })

vim.keymap.set("n", "<leader>aa", function()
	require("sidekick.cli").toggle()
end, { desc = "Toggle Agentic Window" })

vim.keymap.set("n", "<leader>as", function()
	require("sidekick.cli").select()
end, { desc = "Select Agent" })

vim.keymap.set("n", "<leader>ad", function()
	require("sidekick.cli").close()
end, { desc = "Close Agentic Session" })

vim.keymap.set({ "x", "n" }, "<leader>at", function()
	require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send Selection to Agent" })

vim.keymap.set("n", "<leader>af", function()
	require("sidekick.cli").send({ msg = "{file}" })
end, { desc = "Send File to Agent" })

vim.keymap.set("x", "<leader>av", function()
	require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual to Agent" })

vim.keymap.set({ "x", "n" }, "<leader>ap", function()
	require("sidekick.cli").prompt()
end, { desc = "Select Prompt" })

