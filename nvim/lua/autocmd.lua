-- :fennel:1663761962
local au = vim.api.nvim_create_autocmd
local function create_lang_au(lang, _3fcallback)
  _G.assert((nil ~= lang), "Missing argument lang on autocmd.fnl:3")
  return au({"BufRead", "BufNewFile"}, {pattern = ("*." .. lang), callback = (_3fcallback or require(("lang." .. lang))), once = true})
end
create_lang_au("res")
create_lang_au("fnl")
local function _1_()
  return vim.cmd("setfiletype clojure")
end
return create_lang_au("cljd", _1_)