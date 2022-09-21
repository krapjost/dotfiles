-- :fennel:1663762096
vim.opt.omnifunc = "rescript#Complete"
local opts = {noremap = true, silent = true}
local function rescript_keymap()
  vim.keymap.set("n", "<leader>rf", ":RescriptFormat<CR>", opts)
  vim.keymap.set("n", "<leader>rt", ":RescriptTypeHint<CR>", opts)
  vim.keymap.set("n", "<leader>rb", ":RescriptBuild<CR>", opts)
  return vim.keymap.set("n", "gd", ":RescriptJumpToDefinition<CR>", opts)
end
local function attach_res_au()
  return vim.api.nvim_create_autocmd("BufEnter", {pattern = "*.res", callback = rescript_keymap})
end
return attach_res_au