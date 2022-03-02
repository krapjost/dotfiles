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
      local on_attach = function(client, bufnr)
         vim.api.nvim_command [[autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()]]
      end

      local opts = {
         on_attach = on_attach(),
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
