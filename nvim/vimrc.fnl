;; (var conjure-fennel (. g "conjure#filetype#fennel"))
;; (set conjure-fennel :conjure.client.fennel.stdio)
;; (set g.iced_enable_default_key_mappings "v:true")

(vim.diagnostic.config {:signs false
                        :virtual_text false
                        :virtual_lines {:only_current_line true}})

(require :option)
(require :plugin)
(require :keymap)
(require :autocmd)
(vim.cmd "colorscheme github_dark_default")
