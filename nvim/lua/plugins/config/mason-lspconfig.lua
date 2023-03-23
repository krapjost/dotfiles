local function attach_navic(client, bufnr)
  local navic = require('nvim-navic')
  if navic then
    navic.attach(client, bufnr)
    vim.opt.winbar = '%{%v:lua.require\'nvim-navic\'.get_location()%}'
  end
end

return function()
  require('mason-lspconfig').setup()
  require('mason-lspconfig').setup_handlers({
    function(server_name)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local config = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local capa = client.server_capabilities
          if capa.documentSymbolProvider then
            attach_navic(client, bufnr)
          end
          require('keymap')['map-when-lsp'](capa, ';', bufnr)
        end,
      }
      if server_name == 'lua_ls' then
        config.settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file('lua', true),
              checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
            completion = {
              callSnippet = 'Replace',
            },
          },
        }
      end
      require('lspconfig')[server_name].setup(config)
    end,
  })
end
