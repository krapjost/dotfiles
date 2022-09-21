:return

{:load {:core.defaults {}
        :core.norg.concealer {}
        :core.norg.qol.toc {}
        :core.norg.journal {}
        :core.presenter {:config {:zen_mode :zen-mode}}
        ;; :core.norg.completion {:config {:engine :nvim-cmp}}
        :core.gtd.base {:config {:workspace :main}}
        :core.norg.dirman {:config {:workspaces {:main "~/neorg"}
                                    :autodetect true
                                    :autochdir true}}}}
