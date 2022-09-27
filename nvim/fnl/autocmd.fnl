(local au vim.api.nvim_create_autocmd)

(lambda set-lang-autocmd [lang ?callback]
  (au [:BufRead :BufNewFile] {:pattern (.. "*." lang)
                              :callback (or ?callback
                                            (require (.. :lang. lang)))
                              :once true}))

(set-lang-autocmd :fnl)
(set-lang-autocmd :res #(set vim.opt.omnifunc "rescript#Complete"))
(set-lang-autocmd :cljd #(vim.cmd "setfiletype clojure"))

(fn au-when-lsp [bufnr capa]
  (when capa.documentFormattingProvider
    (au :BufWritePre {:buffer bufnr
                      :desc :format-on-save
                      :command "lua vim.lsp.buf.format()"})))

:return

{: au-when-lsp}
