local M = {}

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

    params.context = { only = { "source.organizeImports" }, diagnostics = diagnostics }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 200)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit ~= nil then
                vim.lsp.util.apply_workspace_edit(r.edit, 'utf-8')
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end


return M
