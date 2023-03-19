return {
  {
    {
      'olivercederborg/poimandres.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme poimandres]])
      end,
    },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-lua/plenary.nvim' },
    { 'windwp/nvim-spectre' },
    {
      'ThePrimeagen/harpoon',
      dependencies = 'nvim-lua/plenary.nvim',
      config = require('plugins.config.harpoon'),
    },
    {
      'levouh/tint.nvim',
      config = require('plugins.config.tint'),
    },
    {
      'theblob42/drex.nvim',
      dependencies = 'kyazdani42/nvim-web-devicons',
    },
    { 'phaazon/mind.nvim' }, -- task manager
    -- ui
    {
      'sidebar-nvim/sidebar.nvim',
      config = require('plugins.config.sidebar'),
    },
    {
      -- animated progress indicator
      'j-hui/fidget.nvim',
      config = require('plugins.config.fidget'),
    },

    -- lsp --
    {
      'neovim/nvim-lspconfig',
    },
    {
      'williamboman/mason.nvim',
      config = require('plugins.config.mason'),
    },
    {
      'williamboman/mason-lspconfig.nvim',
      config = require('plugins.config.mason-lspconfig'),
      dependencies = { 'neovim/nvim-lspconfig', 'SmiteshP/nvim-navic' },
    },
    {
      'SmiteshP/nvim-navic',
      dependencies = 'neovim/nvim-lspconfig',
    },
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = require('plugins.config.null-ls'),
    },
    {
      'nvim-telescope/telescope.nvim',
      config = require('plugins.config.telescope'),
    },
    {
      'nvim-telescope/telescope-symbols.nvim',
      dependencies = {
        'nvim-telescope/telescope.nvim',
      },
    },
    { 'kkharji/sqlite.lua' },
    {
      'nvim-telescope/telescope-frecency.nvim',
      dependencies = {
        'nvim-telescope/telescope.nvim',
        'kkharji/sqlite.lua',
      },
    },
    { 'folke/zen-mode.nvim', lazy = true },
    {
      'folke/which-key.nvim',
      config = require('plugins.config.whichkey'),
      lazy = true,
    },
    { 'folke/trouble.nvim' },
    {
      'folke/todo-comments.nvim',
      config = function()
        require('todo-comments').setup()
      end,
    },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-surround' },
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    },
    { 'ggandor/leap.nvim', config = require('plugins.config.leap') },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      config = require('plugins.config.treesitter'),
    },
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      dependencies = 'nvim-treesitter/nvim-treesitter',
    },
    { 'p00f/nvim-ts-rainbow' },
    {
      'lewis6991/gitsigns.nvim',
      config = require('plugins.config.gitsigns'),
    },
    {
      'sindrets/diffview.nvim',
    },
    {
      'timuntersberger/neogit',
      config = require('plugins.config.neogit'),
      dependencies = {

        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
      },
    },
    {
      'L3MON4D3/LuaSnip',
      version = '<CurrentMajor>.*',
      build = 'make install_jsregexp',
      config = require('plugins.config.luasnip'),
    },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    {
      'hrsh7th/nvim-cmp',
      config = require('plugins.config.cmp'),
    },
  },
}
