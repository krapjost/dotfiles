-- :fennel:1664271374
local au = vim.api.nvim_create_autocmd
local function set_lang_autocmd(lang, _3fcallback)
  _G.assert((nil ~= lang), "Missing argument lang on autocmd.fnl:3")
  return au({"BufRead", "BufNewFile"}, {pattern = ("*." .. lang), callback = (_3fcallback or require(("lang." .. lang))), once = true})
end
set_lang_autocmd("fnl")
local function _1_()
  vim.opt.omnifunc = "rescript#Complete"
  return nil
end
set_lang_autocmd("res", _1_)
local function _2_()
  return vim.cmd("setfiletype clojure")
end
set_lang_autocmd("cljd", _2_)
local function au_when_lsp(bufnr, capa)
  if capa.documentFormattingProvider then
    return au("BufWritePre", {buffer = bufnr, desc = "format-on-save", command = "lua vim.lsp.buf.format()"})
  else
    return nil
  end
end
return {["au-when-lsp"] = au_when_lsp}