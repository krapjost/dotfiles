:return

{:ensure_installed [:lua :fennel :clojure :markdown :dart :typescript]
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
 :incremental_selection {:enable true
                         :keymaps {:init_selection :<leader>s
                                   :node_incremental :<leader>i
                                   :node_decremental :<leader>d}}
 :highlight {:enable true :additional_vim_regex_highlighting [:clojure]}
 :rainbow {:enable true :extended_mode true}}
