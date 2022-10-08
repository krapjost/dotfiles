-- :fennel:1664600327
local lspconfig = require("lspconfig")
local function _1_(dir)
  return lspconfig.util.find_git_ancestor(dir)
end
return {default_config = {cmd = {"/home/krap/project/fennel/fennel-ls/fennel-ls"}, filetypes = {"fennel"}, root_dir = _1_, settings = {}}}