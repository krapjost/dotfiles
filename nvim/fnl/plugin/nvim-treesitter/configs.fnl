:return

{:ensure_installed [:python
                    :lua
                    :fennel
                    :clojure
                    :commonlisp
                    :markdown
                    :dart
                    :javascript
                    :typescript
                    :json
                    :norg
                    :ocaml]
 :autotag {:enable true}
 :textobjects {:move {:enable true
                      :set_jumps true
                      :goto_next_start {"]m" "@function.outer"
                                        "]]" "@class.outer"}
                      :goto_next_end {"]M" "@function.outer"
                                      "][" "@class.outer"}
                      :goto_previous_start {"[m" "@function.outer"
                                            "[[" "@class.outer"}
                      :goto_previous_end {"[M" "@function.outer"
                                          "[]" "@class.outer"}}
               :select {:enable true
                        :lookahead true
                        :keymaps {:af "@function.outer"
                                  :if "@function.inner"
                                  :ac "@class.outer"
                                  :ic "@class.inner"
                                  :al "@loop.outer"
                                  :il "@loop.inner"
                                  :ap "@parameter.outer"
                                  :ip "@parameter.inner"
                                  :am "@comment.outer"}}}
 :sync_install false
 :auto_install true
 :highlight {:enable true}
 :rainbow {:enable true :extended_mode true}}