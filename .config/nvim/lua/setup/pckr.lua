-- Bootstrap --
--
-- Download packer if not present and initialise
--
--
local function init_pckr() 

  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	-- if pckr_path doesn't exist, download it from git
  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

	-- exists, then prepend to vim runtime
  vim.opt.rtp:prepend(pckr_path) 
end

-- This initialises pckr with default configurations
init_pckr()
-- for more advanced init refer 
-- https://github.com/lewis6991/pckr.nvim?tab=readme-ov-file#custom-initialization
--
-- require('pckr').setup{}
