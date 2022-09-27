(local data-dir (vim.fn.stdpath :data))
(local rescript-cmd [:node
                     (.. data-dir
                         :/site/pack/paqs/start/vim-rescript/server/out/server.js)
                     :--stdio])

:return

{: rescript-cmd}
