(local u (require :utils))
(local telescope (require :telescope))
(local capabilities (vim.lsp.protocol.make_client_capabilities))
(fn on_attach [client bufnr]
  (u.set-keymap :<leader>fa
                ":lua require('telescope').extensions.flutter.commands()<cr>"
                {:noremap true})
  (telescope.load_extension :flutter))

:return

{:lsp {:closing_tags {:highlight :ErrorMsg :prefix ">" :enabled true}
       : capabilities
       : on_attach}}
