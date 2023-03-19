local au = vim.api.nvim_create_autocmd

au('BufWritePost', {
  pattern = '**/dotfiles/nvim/*.lua',
  callback = function()
    local filepath = vim.fn.expand('%')

    dofile(filepath)
    vim.notify('Configuration reloaded \n' .. filepath, nil)
  end,
  desc = 'Reload config on save',
})

local function au_callback(langs)
  local function _1_()
    for _, v in ipairs(langs) do
      local f = require(('lang.' .. v))
      f()
    end
    return nil
  end
  return _1_
end
local function au_pattern(langs)
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, v in ipairs(langs) do
    local val_19_auto = ('*.' .. v)
    if nil ~= val_19_auto then
      i_18_auto = (i_18_auto + 1)
      do
      end
      (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
local function set_lang_au(langs, _3fcallback)
  _G.assert((nil ~= langs), 'Missing argument langs on autocmd.fnl:13')
  return au({ 'BufRead', 'BufNewFile' }, {
    pattern = au_pattern(langs),
    callback = (_3fcallback or au_callback(langs)),
    once = true,
  })
end
local function _3_()
  vim.opt.omnifunc = 'rescript#Complete'
  return nil
end
set_lang_au({ 'res' }, _3_)
local function _4_()
  return vim.cmd('setfiletype clojure')
end
set_lang_au({ 'cljd' }, _4_)

local function au_when_lsp(capa, bufnr)
  au('BufWritePost', {
    pattern = { '*.js', '*.ts', '*.jsx', '*.tsx' },
    desc = 'fix-linting-problems',
    command = 'EslintFixAll',
  })
  if capa.documentFormattingProvider then
    return au('BufWritePre', {
      buffer = bufnr,
      desc = 'format-on-save',
      command = 'lua vim.lsp.buf.format()',
    })
  else
    return nil
  end
end

return { ['au-when-lsp'] = au_when_lsp }
