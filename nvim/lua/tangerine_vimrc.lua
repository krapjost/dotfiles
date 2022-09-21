-- :fennel:1663759026
vim.diagnostic.config({signs = false, virtual_text = false, virtual_lines = {only_current_line = true}})
require("option")
require("plugin")
require("keymap")
require("autocmd")
return vim.cmd("colorscheme github_dark_default")