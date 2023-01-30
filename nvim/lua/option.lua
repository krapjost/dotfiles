local opt = vim.opt
local g = vim.g

vim.go.fillchars = 'eob: '
opt.pumheight = 8
opt.laststatus = 3
opt.autoread = true
opt.termguicolors = true

opt.background = 'dark'
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
opt.clipboard = 'unnamedplus'
opt.list = true
opt.mouse = 'a'
opt.updatetime = 50
opt.autoread = true
g.neoterm_default_mod = 'botright'
g.neoterm_autoscroll = 1
g.neoterm_size = 13

if g.neovide then
  opt.guifont = { 'FiraCode Nerd Font Mono', ':h9' }
  g.neovide_hide_mouse_when_typing = true
  g.neovide_scroll_animation_length = 0.1
  g.neovide_cursor_animation_length = 0.1
  g.neovide_cursor_trail_size = 0.5
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_animate_in_insert_mode = true
  g.neovide_cursor_animate_command_line = false
  g.neovide_cursor_vfx_particle_density = 100
  g.neovide_cursor_vfx_particle_speed = 50
  g.neovide_cursor_vfx_particle_lifetime = 0.5
  g.neovide_cursor_vfx_mode = 'pixiedust'
end

local colors = require('poimandres.palette')

local TelescopeColor = {
  TelescopeMatching = { fg = colors.teal1 },
  TelescopeSelection = {
    fg = colors.text,
    bg = colors.background1,
    bold = true,
  },
  TelescopePromptBorder = { fg = colors.blueGray1 },
  TelescopeResultsBorder = { fg = colors.blueGray1 },
  TelescopePreviewBorder = { fg = colors.blueGray1 },
  TelescopeResultsNormal = { fg = colors.blueGray1 },
  TelescopePromptNormal = { fg = colors.teal1 },
  TelescopePromptTitle = { fg = colors.blueGray1 },
  TelescopeResultsTitle = { fg = colors.blueGray1 },
  TelescopePreviewTitle = { fg = colors.blueGray1 },
}

for hl, col in pairs(TelescopeColor) do
  vim.api.nvim_set_hl(0, hl, col)
end
