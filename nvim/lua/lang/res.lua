-- :fennel:1664598715
local data_dir = vim.fn.stdpath("data")
return {"node", (data_dir .. "/site/pack/paqs/start/vim-rescript/server/out/server.js"), "--stdio"}