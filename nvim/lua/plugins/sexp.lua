-- :fennel:1664282774
vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet"
vim.g.sexp_mappings = {sexp_square_head_wrap_element = "<localleader>s", sexp_square_tail_wrap_element = "<localleader>S", sexp_round_head_wrap_element = "<localleader>r", sexp_round_tail_wrap_element = "<localleader>R", sexp_curly_head_wrap_element = "<localleader>c", sexp_curly_tail_wrap_element = "<localleader>C", sexp_splice_list = "<localleader>,"}
local function _1_()
  local _let_2_ = require("which-key")
  local register = _let_2_["register"]
  return register({i = "(I list)", I = "(list I)", ["["] = "[I list]", ["]"] = "[list I]", ["{"] = "{I list}", ["}"] = "{list I}", r = "(I word)", R = "(word I)", s = "[I word]", S = "[word I]", c = "{I word}", C = "{word I}", h = "I at Head", l = "I at tail", [","] = "Splice", ["?"] = "Convolute", o = "Raise list", O = "Raise word"}, {prefix = "<localleader>"})
end
return _1_()