(local cmp (require :cmp))
(local luasnip (require :luasnip))
(set vim.opt.completeopt [:menu :menuone :noselect])

(local mapping {:<C-b> (cmp.mapping.scroll_docs -4)
                :<C-f> (cmp.mapping.scroll_docs 4)
                :<C-space> (cmp.mapping.complete)
                :<C-e> (cmp.mapping.close)
                :<up> cmp.config.disable
                :<down> cmp.config.disable
                :<Tab> (cmp.mapping (fn [fallback]
                                      (if (cmp.visible) (cmp.select_next_item)
                                          (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                                          (fallback)))
                                    [:i :s])
                :<S-Tab> (cmp.mapping (fn [fallback]
                                        (if (cmp.visible)
                                            (cmp.select_prev_item)
                                            (luasnip.jumpable -1)
                                            (luasnip.jump -1)
                                            (fallback)))
                                      [:i :s])
                :<space> (cmp.mapping.confirm {:select false})})

(cmp.setup.cmdline "/" {:mapping (cmp.mapping.preset.cmdline)
                        :sources [{:name :buffer}]})

(cmp.setup.cmdline ":"
                   {:mapping (cmp.mapping.preset.cmdline)
                    :sources [{:name :path} {:name :cmdline}]})

(local icons {:Text ""
              :Method ""
              :Function ""
              :Constructor "⌘"
              :Field "ﰠ"
              :Variable :V
              :Class "ﴯ"
              :Interface ""
              :Module ""
              :Unit :U
              :Property "ﰠ"
              :Value ""
              :Enum ""
              :Keyword :K
              :Snippet ""
              :Color ""
              :File ""
              :Reference ""
              :Folder ""
              :EnumMember ""
              :Constant ""
              :Struct "פּ"
              :Event ""
              :Operator ""
              :TypeParameter ""})

:return

{:experimental {:ghost_text true}
 :window {:documentation {:border :solid} :completion {:border :solid}}
 :preselect cmp.PreselectMode.None
 :snippet {:expand (fn [args]
                     (luasnip.lsp_expand args.body))}
 : mapping
 :sources [{:name :nvim_lsp} {:name :luasnip} {:name :buffer} {:name :path}]
 :formatting {:fields [:kind :abbr :menu]
              :format (fn [_ vim-item]
                        (set vim-item.menu vim-item.kind)
                        (set vim-item.kind (. icons vim-item.kind))
                        vim-item)}}
