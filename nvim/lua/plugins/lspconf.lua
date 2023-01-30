-- :fennel:1678810300
local lspconfig = require("lspconfig")
local lconfigs = require("lspconfig.configs")
local cmp_lsp = require("cmp_nvim_lsp")
local servers = {"lua_ls", "ltex", "cssls", "tsserver", "eslint", "unocss"}
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "solid"})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "solid"})

local function attach_navic(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)
    vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    return nil
  else
    return nil
  end
end

local function setup_lsp(client, bufnr)
  attach_navic(client, bufnr)
  local _let_2_ = client
  local capa = _let_2_["server_capabilities"]
  local name = _let_2_["name"]
  local _let_3_ = require("keymap")
  local map_for_language = _let_3_["map-for-language"]
  local map_when_lsp = _let_3_["map-when-lsp"]
  local _let_4_ = require("autocmd")
  local au_when_lsp = _let_4_["au-when-lsp"]
  au_when_lsp(capa, bufnr)
  map_for_language(name, " ", bufnr)
  return map_when_lsp(capa, ";", bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {documentationFormat = {"markdown", "plaintext"}, snippetSupport = true, preselectSupport = true, insertReplaceSupport = true, labelDetailsSupport = true, deprecatedSupport = true, commitCharactersSupport = true, tagSupport = {valueSet = {1}}, resolveSupport = {properties = {"documentation", "detail", "additionalTextEdits"}}}
local function make_conf(server)
  local conf = {on_attach = setup_lsp, capabilities = capabilities}
  if (server == "ltex") then
    conf["settings"] = require("lang.ltex")
  end
  if (server == "eslint") then
    conf["root_dir"] = lspconfig.util.root_pattern("package.json")
  end
  if (server == "unocss") then
    conf["root_dir"] = lspconfig.util.root_pattern("unocss.config.ts", "uno.config.ts", "unocss.config.js", "uno.config.js")
  end
  return conf
end

local function setup_servers()
  for _, s in ipairs(servers) do
    local ls = lspconfig[s]
    local conf = make_conf(s)
    ls.setup(conf)
  end
  return nil
end

return setup_servers()
