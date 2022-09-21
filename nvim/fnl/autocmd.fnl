(local au vim.api.nvim_create_autocmd)

(lambda create-lang-au [lang ?callback]
  (au [:BufRead :BufNewFile] {:pattern (.. "*." lang)
                              :callback (or ?callback
                                            (require (.. :lang. lang)))
                              :once true}))

(create-lang-au :res)
(create-lang-au :fnl)
(create-lang-au :cljd #(vim.cmd "setfiletype clojure"))
