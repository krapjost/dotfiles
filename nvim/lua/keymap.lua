-- :fennel:1674700929
local _local_1_ = require("utils")
local map = _local_1_["map"]
local _local_2_ = require("which-key")
local register = _local_2_["register"]
vim.g.mapleader = " "
vim.g.maplocalleader = ","
map("?", ":WhichKey<CR>", "Show keymaps", "<leader>")
map("<C-h>", "<C-w>h", "Move left")
map("<C-j>", "<C-w>j", "Move down")
map("<C-k>", "<C-w>k", "Move up")
map("<C-l>", "<C-w>l", "Move right")
map("<esc>", "<C-\\><C-n>:Ttoggle<CR>", "Exit term-mode", nil, "t")
map("<C-h>", "<C-\\><C-n>:wincmd h<CR>", "Move left", nil, "t")
map("<C-j>", "<C-\\><C-n>:wincmd j<CR>", "Move down", nil, "t")
map("<C-k>", "<C-\\><C-n>:wincmd k<CR>", "Move up", nil, "t")
map("<C-l>", "<C-\\><C-n>:wincmd l<CR>", "Move right", nil, "t")
map("<C-y>", ":<C-r><C-w>", "yank word under cursor into cmd")
map("<C-c>", ":Tclear<CR>", "Clear Term")
map("<C-s>", ":TREPLSendLine<CR>", "Line REPL")
map("<C-f>", ":TREPLSendFile<CR>", "File REPL")
local function print_num(n)
  return vim.cmd(("echo " .. n))
end
map("<F1>", print_num, "Hello")
local function map_jump(leader)
  local gs = require("gitsigns")
  local todo = require("todo-comments")
  if (leader == "[") then
    return register({g = {gs.prev_hunk, "Gitsign prev"}, o = {todo.jump_prev, "Todo prev"}, ["\\"] = {vim.diagnostic.goto_prev, "Diagnostic Prev"}}, {prefix = leader})
  else
    return register({g = {gs.next_hunk, "Gitsign next"}, o = {todo.jump_next, "Todo next"}, ["\\"] = {vim.diagnostic.goto_next, "Diagnostic Next"}}, {prefix = leader})
  end
end
local function cmd_o_num(cmd)
  return tonumber(vim.api.nvim_exec(("echo " .. cmd), true))
end
local function toggle_term(mode, size)
  return vim.cmd((mode .. " Ttoggle resize=" .. size))
end
local function toggle_on_winwidth()
  if (cmd_o_num("winwidth('.')") > 100) then
    return toggle_term("botright vertical", 50)
  else
    return toggle_term("botright", 10)
  end
end
local function map_toggle(leader)
  return register({t = {toggle_on_winwidth, "Terminal"}, d = {":TroubleToggle<CR>", "Trouble"}, o = {":NvimTreeToggle<CR>", "Nerdtree"}}, {prefix = leader})
end
local function map_find(leader)
  local project_cmd = ":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>"
  return register({p = {project_cmd, "Project"}, o = {":TodoTelescope<CR>", "Todos"}, f = {":Telescope find_files<CR>", "Files"}, g = {":Telescope live_grep<CR>", "Live grep"}, b = {":Telescope buffers<CR>", "Buffers"}, m = {":Telescope man_pages<CR>", "Man"}, c = {":Telescope colorscheme<CR>", "Colorscheme"}, k = {":Telescope keymaps<CR>", "Keymaps"}}, {prefix = leader})
end
local function map_buffer(leader)
  return register({[leader] = {name = "+Buffer", c = {":BufferClose<CR>", "Close current"}, [leader] = {":BufferCloseAllButCurrentOrPinned<CR>", "Close all but"}, k = {":BufferPrevious<CR>", "Goto prev"}, j = {":BufferNext<CR>", "Goto next"}, ["1"] = {":BufferGoto 1<CR>", "Goto 1st"}, ["2"] = {":BufferGoto 2<CR>", "Goto 2nd"}, ["3"] = {":BufferGoto 3<CR>", "Goto 3rd"}, p = {":BufferPin<CR>", "Pin"}}, p = {":BufferPick<CR>", "Pick buffer"}}, {prefix = leader})
end
local function map_repl()
  return register({["<C-s>"] = {":TREPLSendSelection<CR>", "Send selection"}}, {mode = "v"})
end
local function map_zenmode(leader)
  return register({z = {":ZenMode<CR>", "Zenmode"}}, {prefix = leader})
end
local function map_neogit(leader)
  return register({[leader] = {":Neogit<CR>", "Open Neogit"}}, {prefix = leader})
end
local function map_defaults()
  map_toggle(" ")
  map_find("t")
  map_repl()
  map_zenmode(" ")
  map_jump("]")
  map_jump("[")
  map_buffer(" ")
  return map_neogit("\\")
end
map_defaults()
local function map_for_language(name, leader, bufnr)
  if (name == "rescriptls") then
    return register({r = {name = "+Rescript", b = {":RescriptBuild<CR>", "Build"}, c = {":RescriptClean<CR>", "Clean"}}}, {prefix = leader, buffer = bufnr})
  else
    return nil
  end
end
local function map_for_git(leader, bufnr)
  local gs = require("gitsigns")
  register({h = {name = "GitSigns", h = {":Gitsigns stage_hunk<CR>", "Stage-hunk"}, r = {":Gitsigns reset_hunk<CR>", "Reset-hunk"}}}, {prefix = leader, buffer = bufnr, mode = "v"})
  local function _6_()
    return gs.blame_line({full = true})
  end
  local function _7_()
    return gs.diffthis("~")
  end
  return register({h = {name = "+GitSigns", h = {":Gitsigns select_hunk<CR>", "Select-hunk"}, S = {gs.stage_buffer, "Stage-buffer"}, u = {gs.undo_stage_hunk, "Undo"}, R = {gs.reset_buffer, "Reset"}, p = {gs.preview_hunk, "Preview"}, B = {_6_, "Blame"}, b = {gs.toggle_current_line_blame, "Toggle-blame"}, d = {gs.diffthis, "Diffthis"}, D = {_7_, "Diffthis-what"}, t = {gs.toggle_deleted, "Toggle-deleted"}}}, {prefix = leader, buffer = bufnr})
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
    mappings[leader]["d"] = {b.definition, "Definition"}
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
    mappings[leader]["n"] = {b.rename, "Rename"}
  else
  end
  if capa.documentFormattingProvider then
    mappings[leader]["f"] = {b.format, "Format"}
  else
  end
  if capa.codeActionProvider then
    mappings[leader]["a"] = {b.code_action, "Code action"}
  else
  end
  if capa.signatureHelpProvider then
    mappings[leader]["k"] = {b.signature_help, "Signature help"}
  else
  end
  if capa.hoverProvider then
    mappings[leader][";"] = {b.hover, "Hover"}
  else
  end
  if capa.documentSymbolProvider then
    mappings[leader]["o"] = {b.document_symbol, "Doc symbols"}
  else
  end
  return register(mappings, opts)
end
return {["map-when-lsp"] = map_when_lsp, ["map-for-language"] = map_for_language, ["map-for-git"] = map_for_git}