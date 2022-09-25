-- :fennel:1664083016
local opt = vim.opt
local g = vim.g
g.mapleader = " "
g.maplocalleader = ","
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
opt.timeoutlen = 0
opt.cmdheight = 0
opt.smartindent = true
opt.expandtab = true
opt.linebreak = true
opt.clipboard = "unnamedplus"
opt.list = true
opt.mouse = "a"
opt.updatetime = 100
opt.autoread = true
return nil