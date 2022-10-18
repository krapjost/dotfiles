-- :fennel:1665536438
local au = vim.api.nvim_create_autocmd
local function au_callback(langs)
  local function _1_()
    for _, v in ipairs(langs) do
      local f = require(("lang." .. v))
      f()
    end
    return nil
  end
  return _1_
end
local function au_pattern(langs)
  local tbl_15_auto = {}
  local i_16_auto = #tbl_15_auto
  for _, v in ipairs(langs) do
    local val_17_auto = ("*." .. v)
    if (nil ~= val_17_auto) then
      i_16_auto = (i_16_auto + 1)
      do end (tbl_15_auto)[i_16_auto] = val_17_auto
    else
    end
  end
  return tbl_15_auto
end
local function set_lang_au(langs, _3fcallback)
  _G.assert((nil ~= langs), "Missing argument langs on autocmd.fnl:13")
  return au({"BufRead", "BufNewFile"}, {pattern = au_pattern(langs), callback = (_3fcallback or au_callback(langs)), once = true})
end
local function _3_()
  vim.opt.omnifunc = "rescript#Complete"
  return nil
end
set_lang_au({"res"}, _3_)
local function _4_()
  return vim.cmd("setfiletype clojure")
end
set_lang_au({"cljd"}, _4_)
local function au_when_lsp(capa, bufnr)
  if capa.documentFormattingProvider then
    return au("BufWritePre", {buffer = bufnr, desc = "format-on-save", command = "lua vim.lsp.buf.format()"})
  else
    return nil
  end
end
return {["au-when-lsp"] = au_when_lsp}