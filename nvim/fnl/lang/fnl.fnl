:return

(fn []
  (vim.api.nvim_create_autocmd :BufWritePost
                               {:pattern :*.fnl
                                :command "silent! !fnlfmt --fix %:p"})
  (vim.cmd "ia lam λ"))
