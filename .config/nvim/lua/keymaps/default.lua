-- default set of keymaps
-- 
-- utility functions
local map = require("utils.keymap").safe_set

-- ---------------------------------------------------
-- VIM KEYBINDINGS
-- ---------------------------------------------------

-- Quick access to some common actions
map("n", "<leader>fw", "<cmd>w<cr>", "Write")
map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
map("n", "<leader>dw", "<cmd>close<cr>", "Window")



-- Diagnostic keymaps
map('n', 'gx', vim.diagnostic.open_float, "Show diagnostics under cursor")


-- Easier access to beginning and end of lines
map("n", "<leader>h", "^", "Go to beginning of line")
map("n", "<leader>l", "$", "Go to end of line")

-- ---------------------------------------------------
-- Window Management Key Bindings
-- ---------------------------------------------------
-- Better window navigation
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })

-- Moving with ctrl+h,j,k,l
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", "resize up with ctrl + up arrow")
map("n", "<C-Down>", ":resize -2<CR>", "resize down with ctrl + down arrow")
map("n", "<C-Left>", ":vertical resize +2<CR>", "resize left with ctrl + left arrow")
map("n", "<C-Right>", ":vertical resize -2<CR>", "resize right with ctrl + right arrow")

-- ---------------------------------------------------
-- Buffers
-- ---------------------------------------------------
map("n", "<S-l>", ":bnext<CR>", "next buffer")
map("n", "<S-h>", ":bprevious<CR>", "previous buffer")


-- ---------------------------------------------------
-- Code Changes
-- ---------------------------------------------------
-- Indenting
map("v", "<", "<gv", "left indent")
map("v", ">", ">gv", "right indent")

-- Color Modes (light/dark)
map("n", "<leader>ut", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end, "Toggle between light and dark themes")

-- Clear selection after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")
