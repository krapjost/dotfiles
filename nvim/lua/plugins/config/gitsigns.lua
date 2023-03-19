local function on_attach(bufnr)
  return require('keymap')['map-for-git'](' ', bufnr)
end

return {
  on_attach = on_attach,
  preview_config = { border = 'none' },
  numhl = true,
  current_line_blame = true,
  current_line_blame_opts = { delay = 100 },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> -<summary>',
}
