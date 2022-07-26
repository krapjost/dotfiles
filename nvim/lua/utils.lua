_G.U       = {}
local term = require('toggleterm.terminal').Terminal
--[[
local function tprint(tbl, indent)
    if not indent then indent = 0 end
    local toprint = string.rep(" ", indent) .. "{\r\n"
    indent = indent + 2
    for k, v in pairs(tbl) do
        toprint = toprint .. string.rep(" ", indent)
        if (type(k) == "number") then
            toprint = toprint .. "[" .. k .. "] = "
        elseif (type(k) == "string") then
            toprint = toprint .. k .. "= "
        end
        if (type(v) == "number") then
            toprint = toprint .. v .. ",\r\n"
        elseif (type(v) == "string") then
            toprint = toprint .. "\"" .. v .. "\",\r\n"
        elseif (type(v) == "table") then
            toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
        else
            toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
        end
    end
    toprint = toprint .. string.rep(" ", indent - 2) .. "}"
    return toprint
end ]]
-- v:lua.U.CR()v:lua.U.CR()v:lua.U.CR()v:lua.U.BS()v:lua.U.BS()
-- v:lua.U.CR()pumvisible() ? "pumvisible() ? "pumvisible() ? "CR" : "  "

U.TAB  = function()
    if vim.fn.pumvisible() ~= 0 then
        return "<c-n>"
    else
        return "<tab>"
    end
end
U.STAB = function()
    if vim.fn.pumvisible() ~= 0 then
        return "<c-p>"
    else
        return "<bs>"
    end
end

U.CR = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return npairs.esc('<c-y>')
        else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
        end
    else
        return npairs.autopairs_cr()
    end
end

U.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
        return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end

U.LazyGitToggle = function()
    local lazygit = term:new {
        cmd = "lazygit",
        hidden = true,
        direction = 'float',
        dir = vim.fn.expand('%:p:h')
    }
    lazygit:toggle()
end

U.TopToggle = function()
    local top = term:new {
        cmd = "btm",
        hidden = true,
        close_on_exit = true,
        direction = 'float'
    }
    top:toggle()
end

U.FzfToggle = function()
    local fzf = term:new {
        cmd = "fzf",
        hidden = true,
        close_on_exit = true,
        direction = 'float',
        dir = vim.fn.expand('%:p:h')
    }
    fzf:toggle()
end

U.organize_imports = function()
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
