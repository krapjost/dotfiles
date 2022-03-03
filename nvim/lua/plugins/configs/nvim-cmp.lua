vim.opt.completeopt = "menuone,noselect"
return function()
   local cmp = require "cmp"
   local ls = require "luasnip"
   cmp.setup {
      sources = {
         { name = "nvim_lsp", max_item_count = 10 },
         { name = "luasnip", max_item_count = 5 },
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
         format = function(entry, item)
            local icons = require "plugins.configs.lspkind_icons"
            item.kind = string.format("%s %s", icons[item.kind], item.kind)
            item.menu = ({
               nvim_lsp = "[LSP]",
               nvim_lua = "[Lua]",
               buffer = "[BUF]",
            })[entry.source.name]
            return item
         end,
         fields = { "kind", "abbr", "menu" },
      },

      mapping = {
         ["<C-j>"] = cmp.mapping.select_next_item(),
         ["<C-k>"] = cmp.mapping.select_prev_item(),
         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
         ["<C-f>"] = cmp.mapping.scroll_docs(4),
         ["<C-e>"] = cmp.mapping.abort(),
         ["<C-Space>"] = cmp.mapping.complete(),
         ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
         },
         ["<Tab>"] = cmp.mapping(function(fallback)
            if ls.expand_or_jumpable() then
               ls.expand_or_jump()
            else
               fallback()
            end
         end, { "i", "c" }),
         ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_prev_item()
            elseif ls.jumpable(-1) then
               ls.jump(-1)
            else
               fallback()
            end
         end, { "i", "c" }),
      },
   }
   cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })
   cmp.setup.cmdline(":", { sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }) })
end
