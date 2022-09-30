(local {: map-for-git} (require :keymap))

:return

{:on_attach (fn [bufnr]
              (map-for-git " " bufnr))}
