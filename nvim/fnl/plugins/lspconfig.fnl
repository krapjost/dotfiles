(vim.diagnostic.config {:signs true
                        :virtual_text false
                        :virtual_lines {:only_current_line true}})

(fn setup-lsp [client bufnr]
  (let [{:server_capabilities capa : name} client
        navic (require :nvim-navic)
        saga (require :lspsaga)
        {: map-for-language : map-when-lsp} (require :keymap)
        {: au-when-lsp} (require :autocmd)]
    (when capa.documentSymbolProvider
      (navic.attach client bufnr)
      (set vim.opt.winbar "%{%v:lua.require'nvim-navic'.get_location()%}"))
    (saga.init_lsp_saga (require :plugins.lspsaga))
    (vim.pretty_print capa)
    (au-when-lsp bufnr capa)
    (map-for-language name " " bufnr)
    (map-when-lsp capa "\\" bufnr)))

(fn make-conf [server]
  (local conf {:on_attach setup-lsp})
  (when (= server :rescriptls)
    (let [{: rescript-cmd} (require :lang.res)]
      (tset conf :cmd rescript-cmd)))
  conf)

(#(let [lspconfig (require :lspconfig)
        coq (require :coq)
        servers [:sumneko_lua :clojure_lsp :dartls :rescriptls]]
    (each [_ s (ipairs servers)]
      (let [ls (. lspconfig s)
            conf (make-conf s)]
        (-> (coq.lsp_ensure_capabilities conf)
            (ls.setup))))))
