-- AI plugins for development
--
-- Hybrid Setup: Copilot + cursor-agent
-- =====================================
-- ✅ Copilot LSP - Inline code suggestions as you type
-- ✅ cursor-agent - Interactive AI chat for complex edits
--
-- cursor-agent is a CLI-only tool (no LSP support confirmed via --help)
-- So we use Copilot for inline predictions and cursor-agent for chat
--
require("pckr").add({
	-- Copilot for inline predictions
	-- ==========================================
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false }, -- Disable copilot's own UI, use sidekick instead
				panel = { enabled = false }, -- Disable panel, use sidekick instead
			})
		end,
	},

	-- Sidekick
	-- -----------
	-- Integrates AI features: CLI agents + inline predictions
	{
		"folke/sidekick.nvim",
		requires = { "zbirenbaum/copilot.lua" },
		config = function()
			require("sidekick").setup({
				-- Next Edit Suggestions (NES) - Inline Predictions via Copilot
				nes = {
					enabled = true, -- ✅ Enabled for Copilot inline suggestions
					auto_trigger = true, -- Automatically show suggestions as you type
					debounce = 150, -- Wait 150ms after typing before showing suggestions
					keys = {
						accept = "<M-l>",    -- Alt+l to accept suggestion
						next = "<M-]>",      -- Alt+] to go to next suggestion
						prev = "<M-[>",      -- Alt+[ to go to previous suggestion
						dismiss = "<M-e>",   -- Alt+e to dismiss suggestions
					},
				},
				-- CLI configuration for cursor-agent
				cli = {
					agents = {
						{
							name = "cursor-agent",
							cmd = "cursor-agent",
							-- Available flags: --cloud, --model, --force, --browser, etc.
							-- Common options:
							-- args = { "--model", "sonnet-4" }
							-- args = { "--workspace", vim.fn.getcwd() }  -- Explicit workspace
							-- args = { "--cloud" }  -- Cloud mode
							-- args = { "--browser" }  -- Enable browser automation
						},
					},
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
-- ========

-- NES (Inline Predictions) Keymaps - Copilot Suggestions
-- --------------------------------------------------------

-- Tab to jump to or apply next edit suggestion
vim.keymap.set({ "i", "n" }, "<tab>", function()
	if not require("sidekick").nes_jump_or_apply() then
		return "<Tab>" -- fallback to normal tab behavior
	end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })

-- Manually trigger inline suggestions
vim.keymap.set("i", "<C-Space>", function()
	require("sidekick").nes_trigger()
end, { desc = "Trigger Inline Suggestions" })

-- Accept the current inline suggestion (Alt+l)
vim.keymap.set("i", "<M-l>", function()
	require("sidekick").nes_accept()
end, { desc = "Accept Inline Suggestion" })

-- Dismiss inline suggestions (Alt+e)
vim.keymap.set("i", "<M-e>", function()
	require("sidekick").nes_dismiss()
end, { desc = "Dismiss Inline Suggestions" })


-- cursor-agent CLI Keymaps
-- -------------------------

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

