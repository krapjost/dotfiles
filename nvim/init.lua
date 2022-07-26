setmetatable(_G, { __index = vim })
require('plugins'):sync().load()
require('options')
require('autocmds').default()
require('keymaps').set()
api.nvim_set_hl(0, "EndOfBuffer", { fg = 'bg' })
