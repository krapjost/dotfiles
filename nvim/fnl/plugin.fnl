(local {: setup-plugins : init-plugins} (require :utils))

((require :paq) [:savq/paq-nvim.git
                 :udayvir-singh/tangerine.nvim 
                 :savq/melange-nvim
                 :hachy/eva01.vim
                 :olivercederborg/poimandres.nvim
                 :frenzyexists/aquarium-vim
                 :nvim-lua/plenary.nvim
                 :kyazdani42/nvim-web-devicons
                 :nvim-lua/popup.nvim
                 :j-hui/fidget.nvim
                 :feline-nvim/feline.nvim
                 :tamago324/lir.nvim
                 :neovim/nvim-lspconfig
                 :nvim-telescope/telescope.nvim
                 :nvim-telescope/telescope-project.nvim
                 :SmiteshP/nvim-navic
                 :folke/zen-mode.nvim
                 :folke/twilight.nvim
                 :folke/which-key.nvim
                 :folke/trouble.nvim
                 :folke/todo-comments.nvim 
                 :nvim-tree/nvim-tree.lua
                 :guns/vim-sexp
                 :tpope/vim-repeat
                 :tpope/vim-surround
                 :numToStr/Comment.nvim
                 :ggandor/leap.nvim
                 :windwp/nvim-autopairs
                 :nvim-treesitter/nvim-treesitter
                 :nvim-treesitter/nvim-treesitter-textobjects
                 :p00f/nvim-ts-rainbow
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
                 :kassio/neoterm])

(setup-plugins :which-key :nvim-tree :nvim-autopairs 
               :nvim-treesitter.configs :zen-mode :colorizer :Comment :leap
               :trouble :telescope :fidget :todo-comments :gitsigns :neogit :cmp)

(init-plugins :leap :lspconfig :sexp :luasnip)
