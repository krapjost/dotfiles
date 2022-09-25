(λ safe-setup [plugin ?config]
  "setup with config table located in plugins dir; if file is not exists, setup with empty table."
  (if (not= plugin nil)
      (plugin.setup (or ?config {}))
      (vim.pretty_print (.. "Missing plugin is :: " plugin))))

(fn preq [name]
  "safe require using pcall."
  (let [(ok? value) (pcall require name)]
    (if ok?
        value
        nil)))

(fn preq-conf [name]
  (preq (.. :plugins. name)))

(fn setup-plugins [...]
  "init plugins which needs to setup."
  (each [_ name (ipairs [...])]
    (let [plugin (preq name)
          config (preq-conf name)]
      (safe-setup plugin config))))

(fn init-plugins [...]
  "init plugins which doesn't needs to setup."
  (each [_ name (ipairs [...])]
    (preq-conf name)))

(fn make-opts [desc ?bufnr ?silent]
  {: desc :buffer (or ?bufnr false) :silent (or ?silent true)})

(λ map [lhs rhs desc ?leader ?mode ?bufnr]
  "key mapping."
  (let [m (or ?mode :n)
        l (or ?leader "")
        o (make-opts desc ?bufnr)]
    (vim.keymap.set m (.. l lhs) rhs o)))

:return

{: preq : setup-plugins : init-plugins : map}
