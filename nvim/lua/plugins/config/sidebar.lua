return function()
  local sidebar = require('sidebar-nvim')
  local harpoon = require('harpoon')
  local file = string.match(
    vim.fn.system('git rev-parse --show-toplevel 2> /dev/null | tr -d \'\n\''),
    '/(%w+)$'
  )

  local harpoon_marks = {
    title = 'Harpoon Marks',
    icon = '',
    draw = function()
      local marks = harpoon.get_mark_config().marks
      local keymaps = { 'H ', 'T ', 'N ', 'S ' }
      local lines = {}

      for idx = 1, #marks do
        if idx > 4 then
          table.insert(lines, '  ' .. marks[idx].filename)
        else
          table.insert(lines, keymaps[idx] .. marks[idx].filename)
        end
      end

      return {
        lines = lines,
      }
    end,
  }

  local opts = {
    sections = { 'todos', 'files', harpoon_marks, 'diagnostics', 'git' },
    hide_statusline = true,
    section_separator = { '' },
    section_title_separator = {},
    todos = { ignored_paths = { 'snippets' } },
  }
  sidebar.setup(opts)
end
