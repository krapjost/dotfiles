local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
         },
      },
   }

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = function(client, bufnr)
            if client.resolved_capabilities.document_formatting then
               vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync() ]]
            end

            if client.resolved_capabilities.document_highlight then
               vim.cmd [[ autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight() ]]

               vim.cmd [[ autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references() ]]
            end

            if client.resolved_capabilities.code_action then
               vim.cmd [[ au BufWritePre <buffer> lua require("core.autocmds").organizeImports() ]]
            end

            -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.]]
         end,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {
            format = {
               enable = true,
            },
         },
      }

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
