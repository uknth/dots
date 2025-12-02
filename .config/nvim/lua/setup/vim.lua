-- VIM defaults
--
-- Set leader key as `space`
local function set_leader(key)
  vim.g.mapleader = key
  vim.g.maplocalleader = key
  vim.keymap.set({"n", "v"}, key, "<nop>", { silent = true})
end

set_leader(" ")

-- Set vim default options
local options = {
  -- tab related configs
  shiftwidth = 4,
  tabstop = 4,
  expandtab = true,

  wrap = false, -- don't wrap text

  termguicolors = true, -- terminal colors
  background = "dark", -- colorscheme
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


-- set relative line number
vim.cmd.set("nu")
vim.cmd.set("relativenumber")

