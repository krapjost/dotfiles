return function()
  local telescope = require('telescope')
  telescope.setup({
    defaults = {
      ['dynamic_preview_title:'] = true,
      file_ignore_patterns = {
        '^./.git/',
        '^node_modules/',
        '^vendor/',
        'data',
        'bin',
        'build',
        'target',
        'dist',
        'www',
        '%.jpeg',
        '%.png',
        '%.psd',
        '%.mp4',
        '%.webp',
        '%.gif',
        '%.pdf',
        '%.ttf',
        '%.lock',
      },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--trim',
      },
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
          'fd',
          '--type',
          'f',
          '--strip-cwd-prefix',
        },
      },
    },
    extensions = {
      repo = {
        list = {
          fd_opts = {
            '--type',
            'd',
            '--exclude',
            'node_modules',
            '--max-depth',
            '2',
          },
          search_dirs = {
            '~/project',
            '~/dotfiles',
          },
        },
      },
    },
  })
  telescope.load_extension('harpoon')
  telescope.load_extension('frecency')
  telescope.load_extension('repo')
  telescope.load_extension('gpt')
end
