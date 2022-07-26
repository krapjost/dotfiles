Paq = {
    path =
    fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
};

local PKGS = {
    "savq/paq-nvim";
    "neovim/nvim-lspconfig";
    'nvim-lua/plenary.nvim'; -- lua function library
    "ms-jpq/coq_nvim";
    'ms-jpq/coq.artifacts';
    "nvim-treesitter/nvim-treesitter";
    "p00f/nvim-ts-rainbow";
    'kyazdani42/nvim-web-devicons';
    "kyazdani42/nvim-tree.lua";
    'nvim-lualine/lualine.nvim';
    'lukas-reineke/indent-blankline.nvim';
    'romgrk/barbar.nvim';
    "windwp/nvim-autopairs";
    'ggandor/leap.nvim';
    'numToStr/Comment.nvim';
    'lewis6991/gitsigns.nvim';
    { 'rrethy/vim-hexokinase', run = "make hexokinase" };
    'junegunn/fzf';
    'guns/vim-sexp';
    'mg979/vim-visual-multi';
    'liquidz/vim-iced';
    'akinsho/toggleterm.nvim';
    "rescript-lang/vim-rescript";
    "phha/zenburn.nvim";
    'jbyuki/instant.nvim'; -- colaborative coding
    "timuntersberger/neogit"; -- magit for neovim
    "mg979/vim-visual-multi"; -- multi cursor support
    "bennypowers/nvim-regexplainer"; -- describe regexp
    "nvim-neotest/neotest"; -- testing framework
    "kevinhwang91/nvim-bqf"; -- better quickfix window
    "beauwilliams/focus.nvim"; -- auto-resizing on focus
    "ellisonleao/glow.nvim"; -- markdown preview
    "michaelb/sniprun"; -- repl
}

function Paq.init(pkgs)
    notify('paq init')
    return require('paq')(pkgs)
end

function Paq:install()
    notify('install start')
    fn.system({
        'git',
        'clone',
        '--depth=1',
        'https://github.com/savq/paq-nvim.git',
        self.path,
    })
    cmd 'packadd paq-nvim'
    self.init(PKGS):install()
end

function Paq:sync()
    notify('paq sync')
    -- :h empty => true ? 1 : 0
    local installed = fn.empty(vim.fn.glob(self.path)) == 0
    if installed then
        self.init(PKGS):sync()
    else
        self:install()
    end
    return self
end

function Paq.load()
    notify('paq load')
    local function _r(s) return require('configs.' .. s) end

    require "zenburn".setup()
    require 'nvim-tree'.setup()
    require 'nvim-treesitter.configs'.setup(_r '_treesitter')
    require 'lualine'.setup(_r '_lualine')
    require 'gitsigns'.setup()
    require "indent_blankline".setup(_r('_indent_blankline'))
    require 'Comment'.setup()
    require "toggleterm".setup(_r '_toggleterm')
    require 'nvim-autopairs'.setup(_r '_nvim_autopairs')
    require 'leap'.set_default_keymaps()
    _r('_lsp'):init()
end

return Paq
