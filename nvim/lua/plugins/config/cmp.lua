local function make_sorting(cmp)
  local compare = cmp.config.compare
  return {
    priority_weight = 2.0,
    comparators = {
      require('copilot_cmp.comparators').prioritize,
      compare.offset,
      compare.exact,
      compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
      compare.recently_used,
      compare.locality,
      compare.kind,
      compare.sort_text,
      compare.order,
    },
  }
end
return function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')

  cmp.setup({
    snippet = {
      expand = function(args)
        if luasnip then
          luasnip.lsp_expand(args.body)
        end
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<up>'] = cmp.config.disable,
      ['<down>'] = cmp.config.disable,
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          return cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          return luasnip.expand_or_jump()
        else
          return fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function()
        if cmp.visible() then
          return cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          return luasnip.jump(-1)
        else
          return fallback()
        end
      end, { 'i', 's' }),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'copilot', priority = 7 },
      { name = 'nvim_lsp', priority = 6 },
      { name = 'nvim_lua', priority = 5 },
      { name = 'luasnip', priority = 4 },
      { name = 'path', priority = 3 },
      { name = 'buffer', priority = 3 },
    }),
    sorting = make_sorting(cmp),
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    }),
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })
end
