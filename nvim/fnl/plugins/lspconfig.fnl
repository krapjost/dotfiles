(vim.diagnostic.config {:signs true :virtual_text false :virtual_lines false})
(local lspconfig (require :lspconfig))
(local cmp-lsp (require :cmp_nvim_lsp))
(local servers [:sumneko_lua :clojure_lsp :dartls :rescriptls :ltex])

(fn setup-lsp [client bufnr]
  (let [{:server_capabilities capa : name} client
        navic (require :nvim-navic)
        {: map-for-language : map-when-lsp} (require :keymap)
        {: au-when-lsp} (require :autocmd)]
    (when capa.documentSymbolProvider
      (navic.attach client bufnr)
      (set vim.opt.winbar "%{%v:lua.require'nvim-navic'.get_location()%}"))
    (au-when-lsp capa bufnr)
    (map-for-language name " " bufnr)
    (map-when-lsp capa ";" bufnr)))

(local capabilities (vim.lsp.protocol.make_client_capabilities))
(set capabilities.textDocument.completion.completionItem
     {:documentationFormat [:markdown :plaintext]
      :snippetSupport true
      :preselectSupport true
      :insertReplaceSupport true
      :labelDetailsSupport true
      :deprecatedSupport true
      :commitCharactersSupport true
      :tagSupport {:valueSet {1 1}}
      :resolveSupport {:properties [:documentation
                                    :detail
                                    :additionalTextEdits]}})

(fn make-conf [server]
  (local conf {:on_attach setup-lsp : capabilities})
  ;; (when (= server :rescriptls)
  ;;   (let [{: rescript-cmd} (require :lang.res)]
  ;;     (tset conf :cmd rescript-cmd)))
  ;; (when (= server :sumneko_lua)
  ;;   (tset conf :settings (require :lang.lua)))
  ;; (when (= server :ltex)
  ;;   (tset conf :settings (require :lang.ltex)))
  conf)

(#(each [_ s (ipairs servers)]
    (let [ls (. lspconfig s)
          conf (make-conf s)]
      (ls.setup conf))))
