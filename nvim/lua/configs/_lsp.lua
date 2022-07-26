Lsp = {}
Lsp.servers = {
    "sumneko_lua",
    "ltex",
    "dartls",
    "jsonls",
    "pyright",
    "tsserver",
    'elixirls',
    'rescriptls',
    "clojure_lsp",
    "rust_analyzer",
}

Lsp.on_attach = function(client, bufnr)
    notify('LSP attached!')
    local au = require('autocmds')
    local r = client.resolved_capabilities
    if r.document_formatting then
        au.format_on_save()
    end
    if r.document_highlight then
        au.highlight_on_hover()
    end
    if r.code_action then
        au.organize_imports()
    end

    local map = require('keymaps').lsp
    map.lsp_buf_keymap(bufnr)
    map.vim_diagnostic_keymap()
    if (client.name == "rescriptls") then
        map.rescript_keymap()
    end
end

function Lsp:init()
    local conf = require('lspconfig')
    local coq = require('coq')
    for _, server in ipairs(self.servers) do
        local settings = { on_attach = self.on_attach }
        if server == 'rescriptls' then
            settings.cmd = { 'rescript-ls', '--stdio' }
        end
        conf[server].setup(
            coq.lsp_ensure_capabilities(settings)
        )
    end
end

return Lsp
