(set vim.opt.omnifunc "rescript#Complete")

(local opts {:noremap true :silent true})

(fn rescript_keymap []
  "rescript keymap"
  (vim.keymap.set :n :<leader>rf ":RescriptFormat<CR>" opts)
  (vim.keymap.set :n :<leader>rt ":RescriptTypeHint<CR>" opts)
  (vim.keymap.set :n :<leader>rb ":RescriptBuild<CR>" opts)
  (vim.keymap.set :n :gd ":RescriptJumpToDefinition<CR>" opts))

(fn attach-res-au []
  (vim.api.nvim_create_autocmd :BufEnter
                               {:pattern :*.res :callback rescript_keymap}))

:return

attach-res-au
