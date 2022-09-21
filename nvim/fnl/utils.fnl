(lambda safe-setup [plugin ?config]
  (if (not= plugin nil)
      (plugin.setup (or ?config {}))
      (vim.pretty_print (.. "missing plugin :: " plugin))))

(fn preq [name]
  (let [(ok? value) (pcall require name)]
    (if ok?
        value
        nil)))

(fn setup-plugin-config [...]
  (each [_ name (ipairs [...])]
    (let [plugin (preq name)
          config (preq (.. :plugin. name))]
      (safe-setup plugin config))))

(lambda set-keymap [lhs rhs ?opts ?mode]
  (vim.keymap.set (or ?mode :n) lhs rhs (or ?opts {:noremap true :silent true})))

:return

{: preq : setup-plugin-config : set-keymap}
