require ('pckr').add ({
  {
    "ray-x/guihua.lua"
  },
  {
    "ray-x/go.nvim",
    requires = {
      { "ray-x/guihua.lua" },
      { "neovim/nvim-lspconfig" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("go").setup({})

      -- Go Autocommand to format/goimport on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
        require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end
  },
})
--
-- keymaps
vim.keymap.set("n", "<leader>gc", "<cmd>GoCmt<cr>", { desc = "Go Comment" })
vim.keymap.set("n", "<leader>gat", "<cmd>GoAddTag<cr>", { desc = "Go Add Tag" })
vim.keymap.set("n", "<leader>grt", "<cmd>GoRmTag<cr>", { desc = "Go Remove Tag" })
vim.keymap.set("n", "<leader>gtt", "<cmd>GoTest<cr>", { desc = "Go Test" })

