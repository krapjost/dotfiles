M = {}
local au = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

local ag_lsp = augroup("lsp", { clear = true })
M.format_on_save = function()
    au("BufWritePre", {
        group = ag_lsp,
        pattern = "*",
        command = "lua vim.lsp.buf.formatting_sync()",
    })
end
M.highlight_on_hover = function()
    au("CursorHold", {
        group = ag_lsp,
        buffer = bufnr,
        command = "lua vim.lsp.buf.document_highlight()"
    })
    au("CursorMoved", {
        group = ag_lsp,
        buffer = bufnr,
        command = "lua vim.lsp.buf.clear_references()"
    })
end
M.organize_imports = function()
    au("BufWritePre", {
        group = ag_lsp,
        pattern = "*.dart",
        command = "lua U.organize_imports()"
    })
end

M.rescript_lsp = function()
    local rescript_map = require('configs._lsp').rescript_keymap
    au("BufEnter", {
        pattern = { "*.res", "*.resi" },
        callback = rescript_map,
    })
    au({ "WinEnter", "FocusGained", "BufEnter" }, {
        pattern = "*",
        command = "checktime"
    })
end

M.default = function()
    local patterns = { dart = 2, ts = 2, py = 4, js = 2 }
    local ag_tabwidth = augroup("tabwidth", { clear = true })
    for k, v in pairs(patterns) do
        au("BufRead", {
            group = ag_tabwidth,
            pattern = "*." .. k,
            command = string.format("setlocal expandtab tabstop=%s shiftwidth=%s softtabstop=%s", v, v, v),
        })
    end
    au("InsertEnter", {
        group = ag_number,
        pattern = "*",
        command = "set norelativenumber",
    })
    au("InsertLeave", {
        group = ag_number,
        pattern = "*",
        command = "set relativenumber",
    })
end

return M
