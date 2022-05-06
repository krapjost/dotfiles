-- uncomment this if you want to open nvim with a dir
vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
vim.cmd[[ au InsertEnter * set norelativenumber ]]
vim.cmd[[ au InsertLeave * set relativenumber ]]

-- Don't show any numbers inside terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]
vim.cmd [[ autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require("core.utils").hide_statusline() ]]
-- Open a file from its last left off position
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
-- File extension specific tabbing
vim.cmd [[ autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]
vim.cmd [[ autocmd Filetype dart setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 ]]

local M = {}
M.test = function()
   print "hello?"
end

M.organizeImports = function()
   local params = vim.lsp.util.make_range_params()
   local diagnostics = vim.diagnostic.get(0)
   if #diagnostics > 0 then
       for _, x in pairs(diagnostics or {}) do
           x.range = {
               ["end"] = {
                   ["character"] = x.end_col,
                   ["line"] = x.end_lnum
               },
               ["start"] = {
                   ["character"] = x.col,
                   ["line"] = x.lnum
               }
           }
       end
   end
   
   params.context = { only = { "source.organizeImports", "source.fixAll" }, diagnostics=diagnostics }
   local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 200)
   for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
         if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit)
         else
            vim.lsp.buf.execute_command(r.command)
         end
      end
   end
end
return M
