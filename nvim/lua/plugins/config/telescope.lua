return function()
  local telescope = require('telescope')
  telescope.setup({
    defaults = {
      ['dynamic_preview_title:'] = true,
      file_ignore_patterns = { 'node_modules', 'target', 'dist', 'www' },
      winblend = 10,
      layout_strategy = 'flex',
      layout_config = {
        horizontal = { prompt_position = 'bottom', preview_width = 0.6 },
        vertical = { mirror = false },
        width = 0.9,
        height = 0.8,
        preview_cutoff = 120,
      },
      preview = {},
    },
    pickers = {
      symbols = {
        theme = 'cursor',
      },
      registers = {
        theme = 'cursor',
      },
      live_grep = {
        theme = 'ivy',
      },
      find_files = {
        theme = 'dropdown',
        find_command = {
          'rg',
          '--files',
          '--hidden',
          '--no-ignore',
          '-g',
          '!**/.git/*',
          '-g',
          '!**/node_modules/*',
          '-g',
          '!*.png',
        },
      },
    },
  })
  require('telescope').load_extension('harpoon')
end
