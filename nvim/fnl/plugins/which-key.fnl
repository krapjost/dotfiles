(local wk (require :which-key))
(wk.register {:<leader> {:g {:name :+Git}
                         :j {:name :+Jump}
                         :t {:name :+Toggle}
                         :i {:name :+Iced}
                         :f {:name :+Find}
                         :l {:name :+Lsp}
                         :b {:name :+Buffer :o {:name :+Order}}}})
