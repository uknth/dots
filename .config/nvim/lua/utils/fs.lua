
local function scan_config_and_require (path_suffix, require_prefix)
	local fd = vim.loop.fs_scandir(vim.fn.stdpath('config') .. path_suffix)

	for name in function() return vim.loop.fs_scandir_next(fd) end
  	do 
		require(require_prefix .. name:gsub('.lua\z', '')) 
	end
end

return { 
	require_glob = scan_config_and_require
}
	


