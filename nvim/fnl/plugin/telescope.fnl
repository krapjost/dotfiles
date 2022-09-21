(local u (require :utils))
(local telescope-layout (u.preq :telescope.actions.layout))
(local telescope (u.preq :telescope))
(telescope.load_extension :refactoring)

:return

{:defaults {"dynamic_preview_title:" true
            :winblend 10
            :borderchars [" " " " " " " " " " " " " " " "]
            :layout_strategy :flex
            :layout_config {:horizontal {:prompt_position :top
                                         :preview_width 0.55}
                            :vertical {:mirror false}
                            :width 0.9
                            :height 0.8
                            :preview_cutoff 120}
            :preview {}
            :mappings {:n {:<C-p> telescope-layout.toggle_preview}
                       :i {:<C-p> telescope-layout.toggle_preview}}}}
