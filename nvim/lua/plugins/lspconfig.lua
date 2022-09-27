-- :fennel:1664276609
vim.diagnostic.config({signs = true, virtual_lines = {only_current_line = true}, virtual_text = false})
local function setup_lsp(client, bufnr)
  local _let_1_ = client
  local capa = _let_1_["server_capabilities"]
  local name = _let_1_["name"]
  local navic = require("nvim-navic")
  local saga = require("lspsaga")
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
  saga.init_lsp_saga(require("plugins.lspsaga"))
  vim.pretty_print(capa)
  au_when_lsp(bufnr, capa)
  map_for_language(name, " ", bufnr)
  return map_when_lsp(capa, "\\", bufnr)
end
local function make_conf(server)
  local conf = {on_attach = setup_lsp}
  if (server == "rescriptls") then
    local _let_5_ = require("lang.res")
    local rescript_cmd = _let_5_["rescript-cmd"]
    conf["cmd"] = rescript_cmd
  else
  end
  return conf
end
local function _7_()
  local lspconfig = require("lspconfig")
  local coq = require("coq")
  local servers = {"sumneko_lua", "clojure_lsp", "dartls", "rescriptls"}
  for _, s in ipairs(servers) do
    local ls = lspconfig[s]
    local conf = make_conf(s)
    ls.setup(coq.lsp_ensure_capabilities(conf))
  end
  return nil
end
return _7_()