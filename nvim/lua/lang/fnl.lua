-- :fennel:1663762092
local function attach_fnlfmt()
  return vim.api.nvim_create_autocmd("BufWritePost", {pattern = "*.fnl", command = "silent! !fnlfmt --fix %:p"})
end
return attach_fnlfmt