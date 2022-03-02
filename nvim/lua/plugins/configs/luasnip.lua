return function()
   local ls = require "luasnip"
   ls.config.set_config {
      history = true,
      -- Update more often, :h events for more info.
      -- minimal increase in priority.
      ext_prio_increase = 1,
      enable_autosnippets = true,
   }
   ls.filetype_extend("dart", { "flutter" })
   require("luasnip.loaders.from_vscode").lazy_load()
end
