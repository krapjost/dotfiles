-- :fennel:1664101143
local _local_1_ = require("utils")
local preq = _local_1_["preq"]
local _local_2_ = require("keymap")
local set_lsp_keymaps = _local_2_["set-lsp-keymaps"]
local function setup_lsp(client, bufnr)
  local capa = client.server_capabilities
  local navic = require("nvim-navic")
  local saga = require("lspsaga")
  navic.attach(client, bufnr)
  saga.init_lsp_saga({saga_winblend = 1, symbol_in_winbar = {in_custom = true, enable = true, separator = "\239\145\138 ", show_file = true, click_support = false}})
  if capa.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {buffer = bufnr, desc = "format-on-save", command = "lua vim.lsp.buf.format()"})
  else
  end
  vim.pretty_print(capa)
  return set_lsp_keymaps(bufnr)
end
local function _4_()
  local lsp_conf = preq("lspconfig")
  local servers = {"sumneko_lua", "clojure_lsp"}
  local coq = preq("coq")
  for _, server in ipairs(servers) do
    local lsp = lsp_conf[server]
    lsp.setup(coq.lsp_ensure_capabilities({on_attach = setup_lsp}))
  end
  return nil
end
return _4_()