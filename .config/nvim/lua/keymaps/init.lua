-- import keymaps from the keymap directory
--
--
--
local require_glob = require('utils.fs').require_glob

require ('keymaps.default')
require_glob('/lua/keymaps/plugins', 'keymaps.plugins.')

