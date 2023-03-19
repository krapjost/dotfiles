return function()
  local snipmate = require('luasnip.loaders.from_snipmate')
  snipmate.lazy_load({ paths = '~/.config/nvim/snippets' })
end
