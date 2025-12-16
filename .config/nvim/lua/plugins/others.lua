-- Other essential plugins
require('pckr').add({
  --
  -- For Presentation (Marp)
  -- 
  {
    "mpas/marp-nvim",
    config = function()
      require("marp").setup({
        port = 8080,
        wait_for_response_timeout = 30,
        wait_for_response_delay = 1,
      })
    end
  },
  --
  -- Vim Session Management
  --
  {
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup({
        autostart = true,
        use_git_branch = true,
        autoload = true,
      })
      require('telescope').load_extension('persisted')
    end,
  },
})
-- Marp Binding
vim.keymap.set("n", "<leader>MT", "<cmd>MarpToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>MS", "<cmd>MarpStatus<cr>", { noremap = true, silent = true })

-- Persisted (Session Management)
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope persisted<cr>", { desc = "[S]earch [S]essions" })
-- 
