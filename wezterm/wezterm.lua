local wezterm = require 'wezterm'

return {
  color_scheme = "Poimandres", -- or "Poimandres Storm"
  enable_tab_bar = false,
  window_background_opacity = 1,
  window_padding = {
    left = 8,
    right = 8,
    top = 0,
    bottom = 0,
  },
  font_size = 14.3,
  line_height = 1.6,
  font = wezterm.font 'FiraCode Nerd Font Mono',
  -- You can specify some parameters to influence the font selection;
  -- for example, this selects a Bold, Italic font variant.
}
