(local u (require :utils))
(local telescope-layout (u.preq :telescope.actions.layout))
(local telescope (u.preq :telescope))
(local actions (require :telescope.actions))
(local trouble (require :trouble.providers.telescope))

(telescope.load_extension :project)

:return

{:defaults {:extensions {:project {:base_dirs ["~/dotfiles" "~/project"]
                                   :hidden_files true
                                   :order_by :asc}}
            "dynamic_preview_title:" true
            :winblend 0
            :borderchars [" " " " " " " " " " " " " " " "]
            :layout_strategy :flex
            :layout_config {:horizontal {:prompt_position :top
                                         :preview_width 0.55}
                            :vertical {:mirror false}
                            :width 0.9
                            :height 0.8
                            :preview_cutoff 120}
            :preview {}
            :mappings {:i {:<c-t> trouble.open_with_trouble}
                       :n {:<c-t> trouble.open_with_trouble}
                       :i {:<c-p> telescope-layout.toggle_preview}
                       :n {:<c-p> telescope-layout.toggle_preview}}}}
