-- Bootstrap Lazy.nvim
--
--

local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

--
-- clone the lazy repository, if it doesn't exist to `lazypath`
--
-- note: if the computer is completely new, my configuration in dotfiles forces the github
-- to use `ssh` instead of https, in-spite-of the url being passed as https
-- the resulting situation is that if the key isn't in the accepted key for the `github`
-- it fails silently
--
-- In such an event use this command manually to clone the lazy.nvim in the desired folder
-- git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
--
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = fn.system({ 
		"git", 
		"clone", 
		"--filter=blob:none", 
		"--branch=stable", 
		"https://github.com/folke/lazy.nvim.git", 
		lazypath })

	if vim.v.shell_error ~= 0 then

		vim.api.nvim_echo({
		{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
		{ out, "WarningMsg" },
		{ "\nPress any key to exit..." },
		}, true, {})

		fn.getchar()
		os.exit(1)
	end
end

-- 
vim.opt.rtp:prepend(lazypath)
--

--
-- setup lazy
--
--
-- if lazy doesn't exist, abort
require ("lazy").setup({
	spec = {{ import = "config.plugins" }},
})

