return function()
   local icons = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
   }
   local cmp = require "cmp"
   local ls = require "luasnip"
   cmp.setup {
      sources = {
         { name = "luasnip" },
         { name = "nvim_lsp" },
         { name = "nvim_lua" },
         { name = "buffer", keyword_length = 5 },
         { name = "cmdline" },
         { name = "path" },
      },
      experimental = { ghost_text = true },
      snippet = {
         expand = function(args)
            ls.lsp_expand(args.body)
         end,
      },
      formatting = {
         format = function(_, item)
            item.kind = icons[item.kind]
            return item
         end,
         fields = { "kind", "abbr", "menu" },
      },
      mapping = {
         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
         ["<C-f>"] = cmp.mapping.scroll_docs(4),
         ["<C-e>"] = cmp.mapping.abort(),
         ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
         ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_next_item()
            elseif ls.expand_or_jumpable() then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
               fallback()
            end
         end, { "i", "c" }),
         ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_prev_item()
            elseif ls.jumpable(-1) then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
               fallback()
            end
         end, { "i", "c" }),
      },
   }
   cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })
   cmp.setup.cmdline(":", { sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }) })
end
