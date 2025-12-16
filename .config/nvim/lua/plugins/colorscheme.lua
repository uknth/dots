-- Colorscheme for development
--
require("pckr").add({
  {
    "projekt0n/github-nvim-theme",
    config = function ()
      require('github-theme').setup({
        styles = {
          comments = 'NONE',
          types = 'bold',
        },
      })
    end
  },
  {
    "bluz71/vim-moonfly-colors",
    config = function()
      vim.g.moonflyItalics = false
      vim.g.moonflyNormalPmenu = true
      vim.g.moonflyNormalFloat = true
      vim.o.winborder = "single"
      vim.g.moonflyUndercurls = false
    end
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({
        options = {
          -- "carbonfox" uses a very dark background by default
          transparent = false,
        }
      })
    end
  }
})
