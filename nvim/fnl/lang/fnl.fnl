(fn attach-fnlfmt []
  (vim.api.nvim_create_autocmd :BufWritePost
                               {:pattern :*.fnl
                                :command "silent! !fnlfmt --fix %:p"}))

:return

attach-fnlfmt
