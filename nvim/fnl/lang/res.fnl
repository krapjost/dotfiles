(local data-dir (vim.fn.stdpath :data))

:return

[:node
 (.. data-dir :/site/pack/paqs/start/vim-rescript/server/out/server.js)
 :--stdio]
