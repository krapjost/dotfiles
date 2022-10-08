(local {: setup-plugins : init-plugins} (require :utils))

((require :paq) [:savq/paq-nvim.git
                 :udayvir-singh/tangerine.nvim
                 :nvim-lua/plenary.nvim
                 :nvim-lua/popup.nvim
                 :kyazdani42/nvim-web-devicons
                 :j-hui/fidget.nvim
                 :neovim/nvim-lspconfig
                 :nvim-telescope/telescope.nvim
                 :nvim-telescope/telescope-project.nvim
                 :romgrk/barbar.nvim
                 :SmiteshP/nvim-navic
                 :tamton-aquib/staline.nvim
                 :folke/zen-mode.nvim
                 :folke/twilight.nvim
                 :folke/which-key.nvim
                 :folke/trouble.nvim
                 :folke/todo-comments.nvim
                 :kyazdani42/nvim-tree.lua
                 :guns/vim-sexp
                 :tpope/vim-repeat
                 :tpope/vim-surround
                 :numToStr/Comment.nvim
                 :ggandor/leap.nvim
                 :windwp/nvim-autopairs
                 [:eraserhd/parinfer-rust {:run "cargo build --release"}]
                 :nvim-treesitter/nvim-treesitter
                 :nvim-treesitter/nvim-treesitter-textobjects
                 :p00f/nvim-ts-rainbow
                 :nvim-orgmode/orgmode
                 :lewis6991/gitsigns.nvim
                 :timuntersberger/neogit
                 {:url "https://git.sr.ht/~technomancy/fnlfmt"}
                 :norcalli/nvim-colorizer.lua
                 :L3MON4D3/LuaSnip
                 :saadparwaiz1/cmp_luasnip
                 :hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-buffer
                 :hrsh7th/cmp-path
                 :hrsh7th/cmp-cmdline
                 :hrsh7th/nvim-cmp
                 [:rescript-lang/vim-rescript {:opt true}]
                 [:nkrkv/nvim-treesitter-rescript {:opt true}]
                 :rktjmp/lush.nvim
                 :mcchrish/zenbones.nvim
                 :kassio/neoterm])

(setup-plugins :which-key :nvim-tree :nvim-autopairs :staline
               :nvim-treesitter.configs :zen-mode :colorizer :Comment :leap
               :trouble :telescope :fidget :todo-comments :gitsigns :neogit :cmp :orgmode)

(init-plugins :leap :lspconfig :sexp :luasnip)
