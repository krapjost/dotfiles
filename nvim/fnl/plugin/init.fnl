(local u (require :utils))

((require :paq) [:savq/paq-nvim
                 :udayvir-singh/tangerine.nvim
                 :neovim/nvim-lspconfig
                 :j-hui/fidget.nvim
                 :glepnir/lspsaga.nvim
                 :nvim-lua/plenary.nvim
                 :nvim-lua/popup.nvim
                 :nvim-telescope/telescope.nvim
                 :kyazdani42/nvim-web-devicons
                 :lewis6991/gitsigns.nvim
                 :romgrk/barbar.nvim
                 :folke/zen-mode.nvim
                 :folke/which-key.nvim
                 :folke/trouble.nvim
                 ;; for clojure
                 :junegunn/fzf
                 :guns/vim-sexp
                 :liquidz/vim-iced
                 ;; :Olical/conjure
                 ;; :eraserhd/parinfer-rust
                 :gpanders/nvim-parinfer
                 :windwp/nvim-autopairs
                 :nvim-treesitter/nvim-treesitter
                 :nvim-treesitter/nvim-treesitter-textobjects
                 :p00f/nvim-ts-rainbow
                 :SmiteshP/nvim-navic
                 :timuntersberger/neogit
                 :nvim-neorg/neorg
                 :numToStr/Comment.nvim
                 {:url "https://git.sr.ht/~whynothugo/lsp_lines.nvim"}
                 {:url "https://git.sr.ht/~technomancy/fnlfmt"}
                 :kyazdani42/nvim-tree.lua
                 :norcalli/nvim-colorizer.lua
                 :ms-jpq/coq_nvim
                 :ms-jpq/coq.artifacts
                 :rescript-lang/vim-rescript
                 :nkrkv/nvim-treesitter-rescript
                 :ThePrimeagen/refactoring.nvim
                 ;; :akinsho/flutter-tools.nvim
                 :tamton-aquib/staline.nvim
                 :projekt0n/github-nvim-theme
                 :vim-syntastic/syntastic
                 :alexandregv/norminette-vim
                 :ggandor/leap.nvim])

(u.setup-plugin-config :nvim-tree :nvim-treesitter.configs :nvim-autopairs
                       :zen-mode :colorizer :Comment :lsp_lines :leap :trouble
                       :staline :neorg :telescope :refactoring :fidget)

(require :plugin.which-key)
(require :plugin.coq)
(require :plugin.leap)
(require :plugin.lspconfig)