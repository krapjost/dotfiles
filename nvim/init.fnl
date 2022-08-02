(local opt vim.opt)
(local g vim.g)
(local map vim.keymap.set)
(set g.mapleader " ")
(set opt.termguicolors true)
(set opt.ignorecase true)
(set opt.smartcase true)
(set opt.number true)
(set opt.numberwidth 2)
(set opt.relativenumber true)
(set opt.shiftwidth 4)
(set opt.tabstop 4)
(set opt.smartindent true)
(set opt.expandtab true)
(set opt.clipboard :unnamedplus)
(set opt.list true)
(set opt.mouse :a)
(set opt.updatetime 100)
(set opt.autoread true)
(var conjure-fennel (. vim.g "conjure#filetype#fennel"))
(set conjure-fennel :conjure.client.fennel.stdio)

(fn fnlfmt []
  "The fennel formatter"
  (local file (vim.api.nvim_buf_get_name 0))
  (.. ":!fnlfmt --fix " file :<CR> ":e!<CR><CR>"))

(map :n :<leader>f fnlfmt {:expr true})

(local settings {:nvim-tree {:update_focused_file {:enable true
                                                   :update_root true}
                             :respect_buf_cwd true}
                 :nvim-treesitter.configs {:sync_install true
                                           :auto_install true
                                           :highlight {:enable true}
                                           :rainbow {:enable true
                                                     :extended_mode true}}
                 :nvim-autopairs {}
                 :matchparen {}
                 :coloizer {:RGB true
                            :RRGGBB true
                            :names true
                            :RRGGBBAA true
                            :rgb_fn true
                            :hsl_fn true
                            :css true
                            :css_fn true
                            :mode :background}
                 :zenburn {}
                 :catppuccin {}
                 :Comment {}
                 :lsp_lines {}
                 :leap {:max_aot_targets nil
                        :highlight_unlabeled false
                        :case_sensitive false
                        :character_classes [" \t\r\n"]}})

(fn setup [plugin]
  (local p (require plugin))
  (p.setup (. settings plugin)))

(local servers [:sumneko_lua
                :ltex
                :dartls
                :jsonls
                :pyright
                :tsserver
                :eslint
                :elixirls
                :rescriptls
                :clojure_lsp
                :rust_analyzer])

(fn lsp []
  (local lspconf (require :lspconfig))
  (local coq (require :coq))
  (each [_ v (ipairs servers)]
    (local settings
           {:on_attach (fn [c b]
                         (vim.notify "lsp attached")
                         (local capa c.server_capabilities))})
    (local a (. lspconf v))
    (-> (coq.lsp_ensure_capabilities settings) (a.setup))))

(fn set_leap_keymap []
  (local l (require :leap))
  (l.set_default_keymaps))

(local pkgs
       [[:savq/paq-nvim]
        ;; [:phha/zenburn.nvim {:run (setup :zenburn)}]
        [:catppuccin/nvim {:run (setup :catppuccin)}]
        [:udayvir-singh/tangerine.nvim]
        [:neovim/nvim-lspconfig]
        [:nvim-lua/plenary.nvim]
        [:kyazdani42/nvim-web-devicons]
        [:lewis6991/gitsigns.nvim]
        {:url "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
         :run (setup :lsp_lines)}
        [:romgrk/barbar.nvim]
        [:Olical/conjure]
        [:numToStr/Comment.nvim {:run (setup :Comment)}]
        [:ms-jpq/coq_nvim {:run (lsp)}]
        [:folke/trouble.nvim]
        [:nvim-treesitter/nvim-treesitter
         {:run (setup :nvim-treesitter.configs)}]
        [:nvim-treesitter/nvim-treesitter-refactor]
        [:nvim-treesitter/nvim-treesitter-textobjects]
        [:p00f/nvim-ts-rainbow]
        [:timuntersberger/neogit]
        [:nvim-neorg/neorg]
        [:beauwilliams/focus.nvim]
        [:ggandor/leap.nvim {:run (set_leap_keymap)}]
        [:kyazdani42/nvim-tree.lua {:run (setup :nvim-tree)}]
        [:windwp/nvim-autopairs {:run (setup :nvim-autopairs)}]
        [:monkoose/matchparen.nvim {:run (setup :matchparen)}]
        [:norcalli/nvim-colorizer.lua {:run (setup :colorizer)}]])

((require :paq) pkgs)

(set g.catppuccin_flavor :mocha)
(vim.cmd "colorscheme catppuccin")
;; (vim.api.nvim_set_hl 0 :LineNr {:bg :None})
