-- :fennel:1663765167
local u = require("utils")
local servers = {"sumneko_lua", "dartls", "pyright", "clangd", "clojure_lsp"}
local function setup_lspconfig(client, bufnr)
  local capa = client.server_capabilities
  local navic = require("nvim-navic")
  local saga = require("lspsaga")
  local opts = {noremap = true, silent = true, buffer = bufnr}
  navic.attach(client, bufnr)
  saga.init_lsp_saga({saga_winblend = 1, symbol_in_winbar = {in_custom = true, enable = true, separator = "\239\145\138 ", show_file = true, click_support = false}})
  if capa.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {buffer = bufnr, desc = "format-on-save", command = "lua vim.lsp.buf.format()"})
  else
  end
  u["set-keymap"]("gD", vim.lsp.buf.declaration, opts)
  u["set-keymap"]("gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  u["set-keymap"]("gi", vim.lsp.buf.implementation, opts)
  u["set-keymap"]("gr", vim.lsp.buf.references, opts)
  u["set-keymap"]("fm", vim.lsp.buf.format, opts)
  u["set-keymap"]("K", "<cmd>Lspsaga hover_doc<CR>", opts)
  u["set-keymap"]("gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
  u["set-keymap"]("<C-k>", vim.lsp.buf.signature_help, opts)
  u["set-keymap"]("<leader>'", ":LSoutlineToggle<CR>", opts)
  u["set-keymap"]("<leader>D", vim.lsp.buf.type_definition, opts)
  u["set-keymap"]("<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  u["set-keymap"]("<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  u["set-keymap"]("<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts, "v")
  u["set-keymap"]("<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  u["set-keymap"]("<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  local function _2_()
    return print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  return u["set-keymap"]("<leader>wl", _2_, opts)
end
local function _3_()
  local lspconfig = u.preq("lspconfig")
  local coq = u.preq("coq")
  for _, server in ipairs(servers) do
    local settings = {on_attach = setup_lspconfig}
    local lsp_server = lspconfig[server]
    lsp_server.setup(coq.lsp_ensure_capabilities(settings))
  end
  return nil
end
return _3_()