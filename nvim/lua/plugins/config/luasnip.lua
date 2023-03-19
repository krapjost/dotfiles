return function()
  local snipmate = require('luasnip.loaders.from_snipmate')
  snipmate.lazy_load({ paths = '~/snippets/snipmate/snippets' })
end
