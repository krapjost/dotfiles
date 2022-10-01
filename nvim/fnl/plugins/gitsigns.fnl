(local {: map-for-git} (require :keymap))

:return

{:on_attach (fn [bufnr]
              (map-for-git " " bufnr))
 :preview_config {:border :none}
 :numhl true
 :current_line_blame true
 :current_line_blame_opts {:delay 100}
 :current_line_blame_formatter "<author>, <author_time:%Y-%m-%d> -<summary>"}
