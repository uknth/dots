-- vim configurations
--
-- 
-- functions
--
-- set_leader sets the leader key
local function set_leader(key)
	vim.g.mapleader = key
	vim.g.maplocalleader = key
	vim.keymap.set({"n", "v"}, key, "<nop>", { silent = true})
end


-- configurations
--
--
set_leader(" ")


-- CONFIGURATIONS
-- vim configurations
local options = {
  shiftwidth = 4,
  tabstop = 4,
  expandtab = true,
  wrap = false,
  termguicolors = true,
  conceallevel = 1,

  -- colorscheme
  background = "dark",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Other Vim Properties
-- make buffer modifiable
vim.cmd.set("ma")
-- set line number
vim.cmd.set("nu")
-- sets line number relative
vim.cmd.set("relativenumber")

