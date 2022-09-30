-- :fennel:1664562745
vim.diagnostic.config({signs = true, virtual_text = false, virtual_lines = false})
local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local servers = {"sumneko_lua", "clojure_lsp", "dartls", "rescriptls", "ltex"}
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "solid"})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "solid"})
local function setup_lsp(client, bufnr)
  local _let_1_ = client
  local capa = _let_1_["server_capabilities"]
  local name = _let_1_["name"]
  local navic = require("nvim-navic")
  local _let_2_ = require("keymap")
  local map_for_language = _let_2_["map-for-language"]
  local map_when_lsp = _let_2_["map-when-lsp"]
  local _let_3_ = require("autocmd")
  local au_when_lsp = _let_3_["au-when-lsp"]
  if capa.documentSymbolProvider then
    navic.attach(client, bufnr)
    vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  else
  end
  au_when_lsp(capa, bufnr)
  map_for_language(name, " ", bufnr)
  return map_when_lsp(capa, ";", bufnr)
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {documentationFormat = {"markdown", "plaintext"}, snippetSupport = true, preselectSupport = true, insertReplaceSupport = true, labelDetailsSupport = true, deprecatedSupport = true, commitCharactersSupport = true, tagSupport = {valueSet = {1}}, resolveSupport = {properties = {"documentation", "detail", "additionalTextEdits"}}}
local function make_conf(server)
  local conf = {on_attach = setup_lsp, capabilities = capabilities}
  return conf
end
local function _5_()
  for _, s in ipairs(servers) do
    local ls = lspconfig[s]
    local conf = make_conf(s)
    ls.setup(conf)
  end
  return nil
end
return _5_()