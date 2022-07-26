local M = {
    norm = {},
    lsp = {},
}
require('utils')



local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    api.nvim_set_keymap(mode, lhs, rhs, options)
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end

-- default keymaps
M.norm.default_keymap = function()
    map('i', 'jk', '<esc>')
    map("n", "<C-h>", "<C-w>h")
    map("n", "<C-j>", "<C-w>j")
    map("n", "<C-k>", "<C-w>k")
    map("n", "<C-l>", "<C-w>l")
    map("n", "<C-s><C-s>", ":wqa<CR>")
    map("n", "<C-s>", ":w<CR>")
    map("n", "<C-q><C-q>", ":qa!<CR>")
end

-- toggle terminal keymap
M.norm.toggleterm_keymap = function()
    map("n", "<leader>g", "<cmd>lua U.LazyGitToggle()<CR>")
    map("n", "<leader>h", "<cmd>lua U.TopToggle()<CR>")
    map("n", "<leader>f", "<cmd>lua U.FzfToggle()<CR>")
    map("n", "<leader>t", ":NvimTreeToggle<CR>")
    map("n", "<leader>e", ":NvimTreeFocus<CR>")
    map("n", "<leader><leader>", ":ToggleTerm<CR>")
    map("t", "<leader><leader>", "<C-\\><C-n>:ToggleTerm<CR>")
    buf_map(0, 't', '<esc>', [[<C-\><C-n>]])
    buf_map(0, 't', 'jk', [[<C-\><C-n>]])
    buf_map(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]])
    buf_map(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]])
    buf_map(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]])
    buf_map(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]])
end

-- buffer move keymap
M.norm.barbar_keymap = function()
    map('n', '<leader>1', ':BufferGoto 1<CR>')
    map('n', '<leader>2', ':BufferGoto 2<CR>')
    map('n', '<leader>3', ':BufferGoto 3<CR>')
    map('n', '<leader>4', ':BufferGoto 4<CR>')
    map('n', '<leader>5', ':BufferGoto 5<CR>')
    map('n', '<leader>6', ':BufferGoto 6<CR>')
    map('n', '<leader>7', ':BufferGoto 7<CR>')
    map('n', '<leader>8', ':BufferGoto 8<CR>')
    map('n', '<leader>9', ':BufferGoto 9<CR>')
    map('n', '<leader>0', ':BufferLast<CR>')
    map('n', '<leader>bol', ':BufferOrderByLanguage<CR>')
    map('n', '<leader>bod', ':BufferOrderByDirectory<CR>')
    map('n', '<leader>bc', ':BufferClose<CR>')
    map('n', '<leader>bb', ':BufferCloseAllButPinned<CR>')
    map('n', '<leader>bp', ':BufferPin<CR>')
    map('n', '<Tab>', ':BufferNext<CR>')
    map('n', '<A-Tab>', ':BufferPrevious<CR>')
end
-- TODO use vim.keymap
-- -- lsp complete selection keymap
-- M.lsp.cmp_selection_keymap = function()
--     map('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]])
--     map('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]])
--     map('i', '<tab>', ':lua U.TAB()')
--     map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]])
--     map('i', '<cr>', '<esc>:lua U.CR()')
--     map('i', '<bs>', ':lua U.BS()')
-- end

-- move to diagnostics keymap
M.lsp.vim_diagnostic_keymap = function()
    map('n', '\\', '<cmd>lua vim.diagnostic.open_float()<CR>')
    map('n', '[\\', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    map('n', ']\\', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    map('n', '<leader>\\', '<cmd>lua vim.diagnostic.setloclist()<CR>')
end

-- when lsp attached
M.lsp.lsp_buf_keymap = function(bufnr)
    buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    buf_map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    buf_map(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    buf_map(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_map(bufnr, 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
end

-- rescript lsp specific keymaps
M.lsp.rescript_keymap = function()
    map("n", "<leader>rf", ":RescriptFormat<CR>")
    map("n", "<leader>rt", ":RescriptTypeHint<CR>")
    map("n", "<leader>rb", ":RescriptBuild<CR>")
    map("n", "<leader>rc", ":RescriptClean<CR>")
    map("n", "gd", ":RescriptJumpToDefinition<CR>")
end

function M.set()
    M.norm.default_keymap()
    M.norm.toggleterm_keymap()
    M.norm.barbar_keymap()
end

return M
