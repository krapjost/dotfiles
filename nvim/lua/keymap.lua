-- :fennel:1664278499
local _local_1_ = require("utils")
local map = _local_1_["map"]
local todo = require("todo-comments")
local _local_2_ = require("which-key")
local register = _local_2_["register"]
vim.g.mapleader = " "
vim.g.maplocalleader = ","
map("?", ":WhichKey<CR>", "Show keymaps", "<leader>")
map("<C-h>", "<C-w>h", "Move left")
map("<C-j>", "<C-w>j", "Move down")
map("<C-k>", "<C-w>k", "Move up")
map("<C-l>", "<C-w>l", "Move right")
map("<esc>", "<C-\\><C-n>", "Exit term-mode", nil, "t")
map("<C-h>", "<C-\\><C-n>:wincmd h<CR>", "Move left", nil, "t")
map("<C-j>", "<C-\\><C-n>:wincmd j<CR>", "Move down", nil, "t")
map("<C-k>", "<C-\\><C-n>:wincmd k<CR>", "Move up", nil, "t")
map("<C-l>", "<C-\\><C-n>:wincmd l<CR>", "Move right", nil, "t")
map("<C-f>f", ":<C-r><C-w>", "yank word under cursor into cmd")
local function map_jump(leader)
  return register({j = {name = "+Jump", ["="] = {todo.jump_next, "Todo next"}, ["-"] = {todo.jump_prev, "Todo prev"}, ["]"] = {vim.diagnostic.goto_next, "Diagnostic Next"}, ["["] = {vim.diagnostic.goto_prev, "Diagnostic Prev"}}}, {prefix = leader})
end
local function map_toggle(leader)
  return register({t = {name = "+Toggle", t = {":ToggleTerm<CR>", "Terminal"}, n = {":NvimTreeToggle<CR>", "Nerdtree"}}}, {prefix = leader})
end
local function map_find(leader)
  return register({f = {name = "+Find", t = {":TodoTelescope<CR>", "Todos"}, f = {":Telescope find_files<CR>", "Files"}, g = {":Telescope live_grep<CR>", "Live grep"}, b = {":Telescope buffers<CR>", "Buffers"}, m = {":Telescope man_pages<CR>", "Man"}, c = {":Telescope colorscheme<CR>", "Colorscheme"}, k = {":Telescope keymaps<CR>", "Keymaps"}}}, {prefix = leader})
end
local function map_buffer(leader)
  return register({b = {name = "+Buffer", c = {":BufferClose<CR>", "Close current"}, w = {":BufferCloseAllButCurrentOrPinned<CR>", "Close all but"}, p = {":BufferPrevious<CR>", "Goto prev"}, n = {":BufferNext<CR>", "Goto next"}, ["1"] = {":BufferGoto 1<CR>", "Goto 1st"}, ["2"] = {":BufferGoto 2<CR>", "Goto 2nd"}, ["3"] = {":BufferGoto 3<CR>", "Goto 3rd"}, P = {":BufferPin<CR>", "Pin"}, b = {":BufferPick<CR>", "Pick"}, o = {name = "+Order", n = {":BufferOrderByBufferNumber<CR>", "By number"}, d = {":BufferOrderByDirectory<CR>", "By directory"}}}}, {prefix = leader})
end
local function map_defaults()
  map_toggle(" ")
  map_buffer(" ")
  map_find(" ")
  return map_jump(" ")
end
map_defaults()
local function map_for_language(name, leader, bufnr)
  if (name == "rescriptls") then
    return register({r = {name = "+Rescript", b = {":RescriptBuild<CR>", "Build"}, c = {":RescriptClean<CR>", "Clean"}}}, {prefix = leader, buffer = bufnr})
  else
    return nil
  end
end
local function map_when_lsp(capa, leader, bufnr)
  local mappings = {[leader] = {}}
  local opts = {buffer = bufnr}
  local b = vim.lsp.buf
  if capa.declarationProvider then
    mappings[leader]["D"] = {b.declaration, "Declaration"}
  else
  end
  if capa.definitionProvider then
    mappings[leader]["h"] = {":Lspsaga lsp_finder<CR>", "Finder"}
    mappings[leader]["d"] = {":Lspsaga peek_definition<CR>", "Definition"}
  else
  end
  if capa.implementationProvider then
    mappings[leader]["i"] = {b.implementation, "Implementation"}
  else
  end
  if capa.referencesProvider then
    mappings[leader]["r"] = {b.references, "References"}
  else
  end
  if capa.typeDefinitionProvider then
    mappings[leader]["t"] = {b.type_definition, "Type"}
  else
  end
  if capa.renameProvider then
    mappings[leader]["n"] = {":Lspsaga rename<CR>", "Rename"}
  else
  end
  if capa.documentFormattingProvider then
    mappings[leader]["f"] = {b.format, "Format"}
  else
  end
  if capa.codeActionProvider then
    mappings[leader]["c"] = {":Lspsaga code_action<CR>", "Code action"}
  else
  end
  if capa.signatureHelpProvider then
    mappings[leader]["k"] = {b.signature_help, "Signature help"}
  else
  end
  if capa.hoverProvider then
    mappings[leader]["K"] = {":Lspsaga hover_doc<CR>", "Hover"}
  else
  end
  if capa.documentSymbolProvider then
    mappings[leader]["o"] = {":LSoutlineToggle<CR>", "Toggle outline"}
  else
  end
  return register(mappings, opts)
end
return {["map-when-lsp"] = map_when_lsp, ["map-for-language"] = map_for_language}