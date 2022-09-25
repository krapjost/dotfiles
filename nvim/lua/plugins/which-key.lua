-- :fennel:1664101758
local wk = require("which-key")
return wk.register({["<leader>"] = {g = {name = "+Git"}, j = {name = "+Jump"}, t = {name = "+Toggle"}, i = {name = "+Iced"}, f = {name = "+Find"}, l = {name = "+Lsp"}, b = {name = "+Buffer", o = {name = "+Order"}}}})