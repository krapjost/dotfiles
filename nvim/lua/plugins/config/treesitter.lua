return function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'lua',
      'rust',
      'typescript',
    },
    autotag = { enable = true },
    textobjects = {
      swap = {
        enable = true,
        swap_next = {
          ['<M-j>'] = '@parameter.inner',
        },
        swap_previous = {
          ['<M-k>'] = '@parameter.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          af = '@function.outer',
          ['if'] = '@function.inner',
          ac = '@class.outer',
          ic = '@class.inner',
          al = '@loop.outer',
          il = '@loop.inner',
          ap = '@parameter.outer',
          ip = '@parameter.inner',
          am = '@comment.outer',
        },
      },
    },
    auto_install = true,
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'vz',
        node_incremental = 'z',
        node_decremental = 'Z',
      },
    },
    highlight = {
      enable = true,
    },
    rainbow = { enable = true, extended_mode = true },
    sync_install = false,
  })
end
