(local au vim.api.nvim_create_autocmd)

;; TODO: check when config file is nil
(fn au-callback [langs]
  #(each [_ v (ipairs langs)]
     (let [f (require (.. :lang. v))]
       (f))))

(fn au-pattern [langs]
  (icollect [_ v (ipairs langs)]
    (.. "*." v)))

(λ set-lang-au [langs ?callback]
  (au [:BufRead :BufNewFile] {:pattern (au-pattern langs)
                              :callback (or ?callback (au-callback langs))
                              :once true}))

;; FIX: fnlfmt deleting what is correct.
;; (set-lang-au [:fnl]
;;              #(vim.api.nvim_create_autocmd :BufWritePost
;;                                            {:pattern :*.fnl
;;                                             :command "!fnlfmt --fix %:p"}))

(set-lang-au [:res] #(set vim.opt.omnifunc "rescript#Complete"))
(set-lang-au [:cljd] #(vim.cmd "setfiletype clojure"))

(fn au-when-lsp [capa bufnr]
  (when capa.documentFormattingProvider
    (au :BufWritePre {:buffer bufnr
                      :desc :format-on-save
                      :command "lua vim.lsp.buf.format()"})))

:return

{: au-when-lsp}
