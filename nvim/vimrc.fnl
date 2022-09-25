(vim.diagnostic.config {:signs true
                        :virtual_text false
                        :virtual_lines {:only_current_line true}})

(require :option)
(require :plugin)
(require :keymap)
(require :autocmd)
(vim.cmd "colorscheme seoulbones")
