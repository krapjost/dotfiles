:return

{:Lua {:runtime {:version :LuaJIT}
       :diagnostics {:globals [:vim]}
       :workspace {:library (vim.api.nvim_get_runtime_file "" true)
                   :maxPreload 100000
                   :preloadFileSize 10000}
       :telemetry {:enable false}}}