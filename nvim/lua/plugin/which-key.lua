-- :fennel:1663746225
local u = require("utils")
local wk = u.preq("which-key")
return wk.register({["<leader>"] = {}}, {prefix = "<leader>", nowait = true})