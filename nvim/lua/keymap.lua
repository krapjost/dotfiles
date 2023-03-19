local map = require('utils')['map']
local which_key = require('which-key')
local register = which_key['register']
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

map('?', ':WhichKey<CR>', 'Show keymaps', '<leader>')
map('<C-h>', '<C-w>h', 'Move left')
map('<C-j>', '<C-w>j', 'Move down')
map('<C-k>', '<C-w>k', 'Move up')
map('<C-l>', '<C-w>l', 'Move right')
map('<esc>', '<C-\\><C-n>:Ttoggle<CR>', 'Exit term-mode', nil, 't')
map('<C-h>', '<C-\\><C-n>:wincmd h<CR>', 'Move left', nil, 't')
map('<C-j>', '<C-\\><C-n>:wincmd j<CR>', 'Move down', nil, 't')
map('<C-k>', '<C-\\><C-n>:wincmd k<CR>', 'Move up', nil, 't')
map('<C-l>', '<C-\\><C-n>:wincmd l<CR>', 'Move right', nil, 't')
map('<C-y>', ':<C-r><C-w>', 'yank word under cursor into cmd')
map('<C-c>', ':Tclear<CR>', 'Clear Term')
map('<C-s>', ':TREPLSendLine<CR>', 'Line REPL')
map('<C-f>', ':TREPLSendFile<CR>', 'File REPL')
local function map_jump(leader)
  local gs = require('gitsigns')
  local todo = require('todo-comments')
  if leader == '[' then
    return register({
      g = { gs.prev_hunk, 'Gitsign prev' },
      o = { todo.jump_prev, 'Todo prev' },
      ['\\'] = { vim.diagnostic.goto_prev, 'Diagnostic Prev' },
    }, { prefix = leader })
  else
    return register({
      g = { gs.next_hunk, 'Gitsign next' },
      o = { todo.jump_next, 'Todo next' },
      ['\\'] = { vim.diagnostic.goto_next, 'Diagnostic Next' },
    }, { prefix = leader })
  end
end

local function map_tab()
  register({
    ['<CR>'] = { ':lua require("harpoon.mark").add_file()<CR>', 'Add Mark' },
    ['<tab>'] = {
      ':Telescope harpoon marks theme=get_dropdown<CR>',
      'All Marks',
    },
    ['n'] = { ':lua require("harpoon.ui").nav_next()<CR>', 'Next Mark' },
    ['p'] = { ':lua require("harpoon.ui").nav_prev()<CR>', 'Prev Mark' },
    ['1'] = { ':lua require("harpoon.ui").nav_file(1)<CR>', 'File 1' },
    ['2'] = { ':lua require("harpoon.ui").nav_file(2)<CR>', 'File 2' },
    ['3'] = { ':lua require("harpoon.ui").nav_file(3)<CR>', 'File 3' },
  }, { prefix = '<tab>' })
end
map_tab()

local function map_space(leader)
  return register({
    o = { ':SidebarNvimToggle<CR>', 'Sidebar' },
    [','] = { ':Telescope harpoon marks theme=get_ivy<CR>', 'Harpoon' },
    f = {
      ':Telescope frecency workspace=CWD theme=get_dropdown<CR>',
      'Frecency',
    },
    ['`'] = { ':b#<CR>', 'Prev buffer' },
    t = { ':TodoTelescope<CR>', 'Todos' },
    [' '] = { ':Telescope find_files<CR>', 'Files' },
    l = { ':Telescope live_grep<CR>', 'Live grep' },
    r = { ':Telescope repo list<CR>', 'Repo' },
    b = { ':Telescope buffers<CR>', 'Buffers' },
    ['"'] = { ':Telescope registers<CR>', 'Registers' },
    ['\''] = { ':Telescope marks theme=get_ivy<CR>', 'Marks' },
    e = { ':Telescope symbols<CR>', 'Emojis' },
    s = {
      ':Telescope lsp_document_symbols theme=get_ivy<CR>',
      'Document Symbols',
    },
    c = { ':Telescope colorscheme<CR>', 'Colorscheme' },
    k = { ':Telescope keymaps<CR>', 'Keymaps' },
  }, { prefix = leader })
end

local function map_spectre()
  return register({
    ['?'] = {
      ':lua require(\'spectre\').open_visual({select_word=true})<CR>',
      'Search Current',
    },
  })
end

local function map_repl()
  return register(
    { ['<C-s>'] = { ':TREPLSendSelection<CR>', 'Send selection' } },
    { mode = 'v' }
  )
end

local neogit = require('neogit')
local function open_neogit_commit()
  neogit.open({ 'commit' })
end

local function open_neogit()
  neogit.open({ kind = 'split' })
end

local function map_neogit(leader)
  return register({
    [leader] = { open_neogit, 'Open Neogit' },
    c = { open_neogit_commit, 'Open Commit' },
  }, { prefix = leader })
end

local function map_defaults()
  map_space(' ')
  map_repl()
  map_jump(']')
  map_jump('[')
  map_spectre()
  map_neogit('\\')
end
map_defaults()

local function map_for_git(leader, bufnr)
  local gs = require('gitsigns')
  register({
    h = {
      name = 'GitSigns',
      h = { ':Gitsigns stage_hunk<CR>', 'Stage-hunk' },
      r = { ':Gitsigns reset_hunk<CR>', 'Reset-hunk' },
    },
  }, { prefix = leader, buffer = bufnr, mode = 'v' })
  local function _6_()
    return gs.blame_line({ full = true })
  end
  local function _7_()
    return gs.diffthis('~')
  end
  return register({
    h = {
      name = '+GitSigns',
      h = { ':Gitsigns select_hunk<CR>', 'Select-hunk' },
      S = { gs.stage_buffer, 'Stage-buffer' },
      u = { gs.undo_stage_hunk, 'Undo' },
      R = { gs.reset_buffer, 'Reset' },
      p = { gs.preview_hunk, 'Preview' },
      B = { _6_, 'Blame' },
      b = { gs.toggle_current_line_blame, 'Toggle-blame' },
      d = { gs.diffthis, 'Diffthis' },
      D = { _7_, 'Diffthis-what' },
      t = { gs.toggle_deleted, 'Toggle-deleted' },
    },
  }, { prefix = leader, buffer = bufnr })
end

local function map_when_lsp(capa, leader, bufnr)
  local mappings = { [leader] = {} }
  local opts = { buffer = bufnr }
  local b = vim.lsp.buf
  if capa.declarationProvider then
    mappings[leader]['D'] = { b.declaration, 'Declaration' }
  else
  end
  if capa.definitionProvider then
    mappings[leader]['d'] = { b.definition, 'Definition' }
  else
  end
  if capa.implementationProvider then
    mappings[leader]['i'] = { b.implementation, 'Implementation' }
  else
  end
  if capa.referencesProvider then
    mappings[leader]['r'] = { b.references, 'References' }
  else
  end
  if capa.typeDefinitionProvider then
    mappings[leader]['t'] = { b.type_definition, 'Type' }
  else
  end
  if capa.renameProvider then
    mappings[leader]['n'] = { b.rename, 'Rename' }
  else
  end
  if capa.documentFormattingProvider then
    mappings[leader]['f'] = { b.format, 'Format' }
  else
  end
  if capa.codeActionProvider then
    mappings[leader]['a'] = { b.code_action, 'Code action' }
  else
  end
  if capa.signatureHelpProvider then
    mappings[leader]['k'] = { b.signature_help, 'Signature help' }
  else
  end
  if capa.hoverProvider then
    mappings[leader][';'] = { b.hover, 'Hover' }
  else
  end
  if capa.documentSymbolProvider then
    mappings[leader]['o'] = { b.document_symbol, 'Doc symbols' }
  else
  end
  return register(mappings, opts)
end
return { ['map-when-lsp'] = map_when_lsp, ['map-for-git'] = map_for_git }
