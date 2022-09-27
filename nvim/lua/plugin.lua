-- :fennel:1664271089
local _local_1_ = require("utils")
local setup_plugins = _local_1_["setup-plugins"]
local init_plugins = _local_1_["init-plugins"]
require("paq")({"savq/paq-nvim.git", "udayvir-singh/tangerine.nvim", "neovim/nvim-lspconfig", "j-hui/fidget.nvim", "glepnir/lspsaga.nvim", "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "nvim-telescope/telescope.nvim", "kyazdani42/nvim-web-devicons", "lewis6991/gitsigns.nvim", "romgrk/barbar.nvim", "folke/zen-mode.nvim", "folke/which-key.nvim", "folke/trouble.nvim", "folke/todo-comments.nvim", "junegunn/fzf", "guns/vim-sexp", "tpope/vim-sexp-mappings-for-regular-people", "tpope/vim-repeat", "tpope/vim-surround", "liquidz/vim-iced", "windwp/nvim-autopairs", "nvim-treesitter/nvim-treesitter", "nvim-treesitter/nvim-treesitter-textobjects", "p00f/nvim-ts-rainbow", "SmiteshP/nvim-navic", "timuntersberger/neogit", "numToStr/Comment.nvim", {url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"}, {url = "https://git.sr.ht/~technomancy/fnlfmt"}, "kyazdani42/nvim-tree.lua", "norcalli/nvim-colorizer.lua", "ms-jpq/coq_nvim", "ms-jpq/coq.artifacts", "rescript-lang/vim-rescript", "nkrkv/nvim-treesitter-rescript", "akinsho/toggleterm.nvim", "tamton-aquib/staline.nvim", "rktjmp/lush.nvim", "mcchrish/zenbones.nvim", "ggandor/leap.nvim"})
setup_plugins("nvim-tree", "nvim-autopairs", "staline", "nvim-treesitter.configs", "zen-mode", "colorizer", "Comment", "lsp_lines", "leap", "trouble", "telescope", "fidget", "toggleterm", "todo-comments", "which-key")
return init_plugins("coq", "leap", "lspconfig", "sexp")