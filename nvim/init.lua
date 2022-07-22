require "paq" {
    "savq/paq-nvim";
    "neovim/nvim-lspconfig";
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
    "brymer-meneses/grammar-guard.nvim",
    'lewis6991/gitsigns.nvim';
    { 'rrethy/vim-hexokinase', run = "make hexokinase" };
    'junegunn/fzf';
    'guns/vim-sexp';
    'mg979/vim-visual-multi';
    'liquidz/vim-iced';
    'akinsho/toggleterm.nvim';
    "rescript-lang/vim-rescript";
    "phha/zenburn.nvim";
}

local g = vim.g
local opt = vim.opt
local api = vim.api
local au = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup
local cmd = vim.cmd

g.mapleader                        = " "
g.iced_enable_default_key_mappings = true
g.bufferline                       = {
    animation = true,
    auto_hide = true,
    tabpages = true,
    closable = false,
    clickable = false,
    icons = "both",
    icon_custom_colors = false,
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 1,
    maximum_length = 30,
    semantic_letters = true,
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    no_name_title = nil,
}

g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        eval_snips = "<leader>j",
        jump_to_mark = "<A-space>",
        recommended = false,
    },
}

g.python3_host_prog = '~/.local/venv/nvim/bin/python'

opt.ignorecase = true
opt.smartcase = true
opt.number = true
-- opt.numberwidth = 2
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.expandtab = true
opt.clipboard = "unnamedplus"
opt.list = true
opt.mouse = "a"
opt.listchars:append("eol:↴")
opt.listchars:append("space: ")
opt.updatetime = 100
opt.autoread = true
opt.termguicolors = true

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function buf_map(bufnr, mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end

require("zenburn").setup()
require 'nvim-tree'.setup {}
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "lua", "dart", "elixir", "clojure",
        "rust", "markdown", "python"
    },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    }
}
require('lualine').setup {
    options = {
        theme = "zenburn",
    }
}
require('gitsigns').setup {}
require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent",
    },
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require('Comment').setup {}
require("toggleterm").setup {
    float_opts = {
        border = 'double',
        winblend = 3,
    },
    -- open_mapping = [[<C-\>]],
}

local npairs = require('nvim-autopairs')
local lspconfig = require('lspconfig')
local coq = require('coq')

local on_attach = function(client, bufnr)
    cmd [[ echom " LSP attached! " ]]
    cmd [[highlight IndentBlanklineIndent guifg=#444444 gui=nocombine]]
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    buf_map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    buf_map(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    buf_map(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_map(bufnr, 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')

    local ag_lsp = augroup("lsp", { clear = true })
    if client.resolved_capabilities.document_formatting then
        au("BufWritePre", {
            group = ag_lsp,
            pattern = "*",
            command = "lua vim.lsp.buf.formatting_sync()",
        })
    end

    if client.resolved_capabilities.document_highlight then
        au("CursorHold", {
            group = ag_lsp,
            buffer = bufnr,
            command = "lua vim.lsp.buf.document_highlight()"
        })
        au("CursorMoved", {
            group = ag_lsp,
            buffer = bufnr,
            command = "lua vim.lsp.buf.clear_references()"
        })
    end

    if client.resolved_capabilities.code_action then
        au("BufWritePre", {
            group = ag_lsp,
            pattern = "*.dart",
            command = "lua require('utils').organizeImports()"
        })
    end
end

local servers = {
    "rust_analyzer",
    "tsserver",
    "dartls",
    "pylsp",
    "pyright",
    "sumneko_lua",
    "clojure_lsp",
    "jsonls",
    "ltex"
}

npairs.setup({ map_bs = false, map_cr = false })
for _, server in ipairs(servers) do
    lspconfig[server].setup(coq.lsp_ensure_capabilities({
        on_attach = on_attach,
    }))
end

require 'lspconfig'.elixirls.setup {
    cmd = { "/usr/bin/elixir-ls" },
}

require 'lspconfig'.rescriptls.setup {
    cmd = { 'node', '/home/krap/jost/lsp/vim-rescript/server/out/server.js', '--stdio' }
}

require("grammar-guard").init()
require "lspconfig".grammar_guard.setup({
    cmd = { '/usr/bin/ltex-ls' },
    settings = {
        ltex = {
            enabled = { "latex", "tex", "bib", "markdown" },
            language = "en",
            diagnosticSeverity = "information",
            setenceCacheSize = 2000,
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "en",
            },
            trace = { server = "verbose" },
            dictionary = {},
            disabledRules = {},
            hiddenFalsePositives = {},
        },
    },
})

_G.U = {}

U.CR = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return npairs.esc('<c-y>')
        else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
        end
    else
        return npairs.autopairs_cr()
    end
end

U.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
        return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end

local function stringf(...) return string.format(...) end

U.TermKeyMap = function()
    buf_map(0, 't', '<esc>', [[<C-\><C-n>]])
    buf_map(0, 't', 'jk', [[<C-\><C-n>]])
    buf_map(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]])
    buf_map(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]])
    buf_map(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]])
    buf_map(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]])
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
cmd('autocmd! TermOpen term://* lua U.TermKeyMap()')
require('leap').set_default_keymaps()

local Terminal  = require('toggleterm.terminal').Terminal
U.LazyGitToggle = function()
    local lazygit = Terminal:new {
        cmd = "lazygit",
        hidden = true,
        direction = 'float',
        dir = vim.fn.expand('%:p:h')
    }
    lazygit:toggle()
end
U.TopToggle     = function()
    local top = Terminal:new {
        cmd = "btm", hidden = true, close_on_exit = true, direction = 'float',
    }
    top:toggle()
end
U.FzfToggle     = function()
    local fzf = Terminal:new {
        cmd = "fzf",
        hidden = true,
        close_on_exit = true,
        direction = 'float',
        dir = vim.fn.expand('%:p:h')
    }
    fzf:toggle()
end

local coq_map_opts = { expr = true, noremap = true }

map('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], coq_map_opts)
map('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], coq_map_opts)
map('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], coq_map_opts)
map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], coq_map_opts)
map('i', '<cr>', 'v:lua.U.CR()', coq_map_opts)
map('i', '<bs>', 'v:lua.U.BS()', coq_map_opts)
-- exit insert mode
map('i', 'jk', '<esc>')

-- commands using space key
map("n", "<leader>g", "<cmd>lua U.LazyGitToggle()<CR>")
map("n", "<leader>h", "<cmd>lua U.TopToggle()<CR>")
map("n", "<leader>f", "<cmd>lua U.FzfToggle()<CR>")
map("n", "<leader>t", ":NvimTreeToggle<CR>")
map("n", "<leader>e", ":NvimTreeFocus<CR>")
map("n", "<leader><leader>", ":ToggleTerm<CR>")
map("t", "<leader><leader>", "<C-\\><C-n>:ToggleTerm<CR>")
map('n', '<leader>1', ':BufferGoto 1<CR>')
map('n', '<leader>2', ':BufferGoto 2<CR>')
map('n', '<leader>3', ':BufferGoto 3<CR>')
map('n', '<leader>4', ':BufferGoto 4<CR>')
map('n', '<leader>5', ':BufferGoto 5<CR>')
map('n', '<leader>6', ':BufferGoto 6<CR>')
map('n', '<leader>7', ':BufferGoto 7<CR>')
map('n', '<leader>8', ':BufferGoto 8<CR>')
map('n', '<leader>9', ':BufferGoto 9<CR>')
map('n', '<leader>0', ':BufferLast<CR>')
map('n', '<leader>bol', ':BufferOrderByLanguage<CR>')
map('n', '<leader>bod', ':BufferOrderByDirectory<CR>')
map('n', '<leader>bc', ':BufferClose<CR>')
map('n', '<leader>bb', ':BufferCloseAllButPinned<CR>')
map('n', '<leader>bp', ':BufferPin<CR>')
map('n', '<Tab>', ':BufferNext<CR>')
map('n', '<A-Tab>', ':BufferPrevious<CR>')

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-s><C-s>", ":wqa<CR>")
map("n", "<C-s>", ":w<CR>")
map("n", "<C-q><C-q>", ":qa!<CR>")

map('n', '\\', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '[\\', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', ']\\', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<leader>\\', '<cmd>lua vim.diagnostic.setloclist()<CR>')


local ag_number = augroup("number", { clear = true })
au("InsertEnter", {
    group = ag_number,
    pattern = "*",
    command = "set norelativenumber",
})
au("InsertLeave", {
    group = ag_number,
    pattern = "*",
    command = "set relativenumber",
})

local rescriptMap = function()
    map("n", "<leader>rf", ":RescriptFormat<CR>")
    map("n", "<leader>rt", ":RescriptTypeHint<CR>")
    map("n", "<leader>rb", ":RescriptBuild<CR>")
    map("n", "<leader>rc", ":RescriptClean<CR>")
    map("n", "gd", ":RescriptJumpToDefinition<CR>")
end

au("BufEnter", {
    pattern = { "*.res", "*.resi" },
    callback = rescriptMap,
})

au({ "WinEnter", "FocusGained", "BufEnter" }, {
    pattern = "*",
    command = "checktime"
})

local patterns = { dart = 2, ts = 2, py = 4, js = 2 }
local ag_tabwidth = augroup("tabwidth", { clear = true })
for k, v in pairs(patterns) do
    au("BufRead", {
        group = ag_tabwidth,
        pattern = "*." .. k,
        command = stringf("setlocal expandtab tabstop=%s shiftwidth=%s softtabstop=%s", v, v, v),
    })
end
