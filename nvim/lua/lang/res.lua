-- :fennel:1664266116
local data_dir = vim.fn.stdpath("data")
local rescript_cmd = {"node", (data_dir .. "/site/pack/paqs/start/vim-rescript/server/out/server.js"), "--stdio"}
return {["rescript-cmd"] = rescript_cmd}