(local u (require :utils))
(let [wk (u.preq :which-key)]
  (wk.register {:<leader> {}} {:prefix :<leader> :nowait true}))
