-- Loading Starts here
--
-- Loading Following
-- 1. config/init.lua: initialises config
-- 2. keymaps/init.lua: sets up keymap

require('config.init')
require('keymaps.init')

-- COLORSCHEME
vim.cmd.colorscheme(
    require("utils.cs").colorscheme("github_light_colorblind")
)
