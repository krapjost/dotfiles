-- :fennel:1664077640
vim.diagnostic.config({signs = true, virtual_lines = {only_current_line = true}, virtual_text = false})
require("option")
require("plugin")
require("keymap")
require("autocmd")
return vim.cmd("colorscheme seoulbones")