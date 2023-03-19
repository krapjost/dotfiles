return function()
  local leap = require('leap')
  leap.set_default_keymaps()
  leap.setup({
    -- max_aot_targets = nil,
    -- character_classes = { ' \\t\\r\\n' },
    highlight_unlabeled = false,
    case_sensitive = false,
  })
end
