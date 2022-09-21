-- :fennel:1663764434
local u = require("utils")
local telescope = require("telescope")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local function on_attach(client, bufnr)
  u["set-keymap"]("<leader>fa", ":lua require('telescope').extensions.flutter.commands()<cr>", {noremap = true})
  return telescope.load_extension("flutter")
end
return {lsp = {closing_tags = {highlight = "ErrorMsg", prefix = ">", enabled = true}, capabilities = capabilities, on_attach = on_attach}}