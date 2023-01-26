-- :fennel:1674714291
local opt = vim.opt
opt.laststatus = 3
opt.autoread = true
opt.termguicolors = true
opt.background = "dark"
opt.ignorecase = true
opt.cursorline = true
opt.smartcase = true
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.timeoutlen = 100
opt.smartindent = true
opt.expandtab = true
opt.wrap = false
opt.sidescroll = 10
opt.clipboard = "unnamedplus"
opt.list = true
opt.mouse = "a"
opt.updatetime = 50
opt.autoread = true
vim.g.neoterm_default_mod = "botright"
vim.g.neoterm_autoscroll = 1
vim.g.neoterm_size = 13
return vim.cmd.colorscheme("poimandres")