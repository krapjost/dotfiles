return function()
   local ls = require "luasnip"
   local s = ls.snippet
   local sn = ls.snippet_node
   local t = ls.text_node
   local i = ls.insert_node
   local f = ls.function_node
   local c = ls.choice_node
   local d = ls.dynamic_node
   local r = ls.restore_node
   local p = require("luasnip.extras").partial
   local m = require("luasnip.extras").match
   local rep = require("luasnip.extras").rep
   local types = require "luasnip.util.types"

   ls.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      ext_base_prio = 300,
      ext_prio_increase = 1,
      ext_opts = {
         [types.choiceNode] = {
            active = {
               virt_text = { { "C", "Red" } },
            },
         },
         [types.insertNode] = {
            active = {
               virt_text = { { "I" } },
            },
         },
      },
   }

   ls.snippets = {
      all = {
         -- Shorthand for repeating the text in a given node.
         s("repeat", { i(1, "text"), t { "", "" }, rep(1) }),
         -- Directly insert the ouput from a function evaluated at runtime.
         s("part", p(os.date, "%Y")),
         -- use matchNodes to insert text based on a pattern/function/lambda-evaluation.
         s("mat", {
            i(1, { "sample_text" }),
            t ": ",
            m(1, "%d", "contains a number", "no number :("),
         }),
      },

      dart = {
         s("changeN", {
            t "class ",
            i(1, { "name" }),
            t { "Nofitier extends ChangeNotifier {", "\t" },
            i(2, { "content" }),
            t { "", "" },
            t "}",
         }),
         s("streamP", {
            t "final ",
            i(1, { "name" }),
            t "Provider = StreamProvider<",
            i(2, { "T" }),
            t ">((ref) async* {",
            t { "", "\t" },
            t "return ",
            i(3),
            t { ";", "", "});" },
         }),
         s("streamPF", {
            t "final ",
            i(1, { "name" }),
            t "Provider = StreamProvider.family<",
            i(2, { "T1" }),
            t ", ",
            i(3, { "T2" }),
            t ">((ref, ",
            i(4, { "param" }),
            t { ") async* {", "" },
            t "\treturn ",
            i(5, { "val" }),
            t { ";", "", "});" },
         }),
      },
   }

   ls.filetype_extend("dart", { "flutter" })
   require("luasnip.loaders.from_vscode").lazy_load()
end
