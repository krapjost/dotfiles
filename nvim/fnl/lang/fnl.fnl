(local lspconfig (require :lspconfig))

:return

{:default_config {:cmd [:/home/krap/project/fennel/fennel-ls/fennel-ls]
                  :filetypes [:fennel]
                  :root_dir (fn [dir]
                              (lspconfig.util.find_git_ancestor dir))
                  :settings []}}
