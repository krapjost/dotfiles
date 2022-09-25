(local {: preq} (require :utils))
(local {: set-lsp-keymaps} (require :keymap))

(fn setup-lsp [client bufnr]
  (let [capa client.server_capabilities
        navic (require :nvim-navic)
        saga (require :lspsaga)]
    (navic.attach client bufnr)
    (saga.init_lsp_saga {:saga_winblend 1
                         :symbol_in_winbar {:in_custom true
                                            :enable true
                                            :separator " "
                                            :show_file true
                                            :click_support false}})
    (when capa.documentFormattingProvider
      (vim.api.nvim_create_autocmd :BufWritePre
                                   {:buffer bufnr
                                    :desc :format-on-save
                                    :command "lua vim.lsp.buf.format()"}))
    (vim.pretty_print capa)
    (set-lsp-keymaps bufnr)))

(#(let [lsp-conf (preq :lspconfig)
        servers [:sumneko_lua :clojure_lsp]
        coq (preq :coq)]
    (each [_ server (ipairs servers)]
      (let [lsp (. lsp-conf server)]
        (-> (coq.lsp_ensure_capabilities {:on_attach setup-lsp})
            (lsp.setup))))))
