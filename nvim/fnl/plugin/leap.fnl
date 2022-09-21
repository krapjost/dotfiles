;; (fn set-leap-keymap []
;;   (local l (require :leap))
;;   (l.set_default_keymaps))
;; (set-leap-keymap)

(#(let [l (require :leap)]
      (l.set_default_keymaps)))

:return {:max_aot_targets nil
                        :highlight_unlabeled false
                        :case_sensitive false
                        :character_classes [" \\t\\r\\n"]}
