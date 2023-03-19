return function()
  local tint = require('tint')
  tint.setup({
    tint = -50, -- Darken colors, use a positive value to brighten
    saturation = 0.5, -- Saturation to preserve
    transforms = tint.transforms.SATURATE_TINT, -- Showing default behavior, but value here can be predefined set of transforms
    highlight_ignore_patterns = { 'WinSeparator', 'Status.*' }, -- Highlight group patterns to ignore, see `string.find`
    window_ignore_function = function(winid)
      local bufid = vim.api.nvim_win_get_buf(winid)
      local buftype = vim.api.nvim_buf_get_option(bufid, 'buftype')
      local floating = vim.api.nvim_win_get_config(winid).relative ~= ''

      return buftype == 'terminal' or buftype == 'nofile' or floating
    end,
  })
end
