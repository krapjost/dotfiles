-- :fennel:1664290550
local function _1_()
  vim.api.nvim_create_autocmd("BufWritePost", {pattern = "*.fnl", command = "silent! !fnlfmt --fix %:p"})
  return vim.cmd("ia lam \206\187")
end
return _1_