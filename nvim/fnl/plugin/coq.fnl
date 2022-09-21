(set vim.g.coq_settings
     {:auto_start :shut-up
      :keymap {:jump_to_mark :<C-CR> :pre_select true}
      :completion {:skip_after ["{" "}" "(" ")" ";"]}})
