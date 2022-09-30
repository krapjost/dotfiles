(vim.diagnostic.config {:signs true :virtual_text false :virtual_lines false})
(local lspconfig (require :lspconfig))
(local cmp-lsp (require :cmp_nvim_lsp))
(local servers [:sumneko_lua :clojure_lsp :dartls :rescriptls :ltex])

(set vim.lsp.handlers.textDocument/signatureHelp
     (vim.lsp.with vim.lsp.handlers.signature_help {:border :solid}))

(set vim.lsp.handlers.textDocument/hover
     (vim.lsp.with vim.lsp.handlers.hover {:border :solid}))

(set lconfigs.fennel-ls (require :lang.fnl))

(fn attach-navic [client bufnr]
  (when client.server_capabilities.documentSymbolProvider
    (local navic (require :nvim-navic))
    (navic.attach client bufnr)
    (set vim.opt.winbar "%{%v:lua.require'nvim-navic'.get_location()%}")))

(fn setup-lsp [client bufnr]
  (attach-navic client bufnr)
  (let [{:server_capabilities capa : name} client
        navic (require :nvim-navic)
        {: map-for-language : map-when-lsp} (require :keymap)
        {: au-when-lsp} (require :autocmd)]
    (when (= name :fennel-ls)
      (vim.pretty_print capa))
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
  (when (= server :rescriptls)
    (tset conf :cmd (require :lang.res)))
  (when (= server :sumneko_lua)
    (tset conf :settings (require :lang.lua)))
  (when (= server :ltex)
    (tset conf :settings (require :lang.ltex)))
  conf)

(#(each [_ s (ipairs servers)]
    (let [ls (. lspconfig s)
          conf (make-conf s)]
      (ls.setup conf))))
