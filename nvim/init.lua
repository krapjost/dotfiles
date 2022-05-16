local g = vim.g
local opt = vim.opt
local api = vim.api
local au = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup
local cmd = vim.cmd

g.mapleader = " "
-- Set barbar's options
g.bufferline = {
    animation = false,
    auto_hide = false,
    tabpages = true,
    closable = false,
    clickable = false,
    -- if set to 'numbers', will show buffer index in the tabline
    -- if set to 'both', will show buffer index and icons in the tabline
    icons = "both",
    icon_custom_colors = false,
    -- Configure icons on the bufferline.
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
    insert_at_end = false,
    insert_at_start = false,
    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,
    -- Sets the maximum buffer name length.
    maximum_length = 30,
    semantic_letters = true,
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    no_name_title = nil,
}
g.coq_settings = {
    auto_start = "shut-up",
    clients = {
        tabnine = {
            enabled = true,
        }
    },
    keymap = {
        eval_snips = "<leader>j",
        jump_to_mark = "<A-space>",
        recommended = false,
    },
}


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
opt.termguicolors = true
opt.list = true
opt.mouse = "a"
opt.listchars:append("eol:↴")
opt.listchars:append("space: ")
opt.updatetime = 100

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

require "paq" {
    "savq/paq-nvim";
    "neovim/nvim-lspconfig";
    "ms-jpq/coq_nvim";
    'ms-jpq/coq.artifacts';
    "nvim-treesitter/nvim-treesitter";
    'kyazdani42/nvim-web-devicons';
    'themercorp/themer.lua';
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
}

require 'nvim-tree'.setup {}

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "lua", "dart", "elixir", "kotlin",
        "go", "dockerfile", "rust", "markdown",
        "javascript", "typescript", "tsx" },
    sync_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
require('lualine').setup {}
require('gitsigns').setup {}

require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent",
    },
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require 'themer'.setup {
    colorscheme = 'gruvbox-material-dark-hard',
    plugins = {
        treesitter = true,
        indentline = true,
        barbar = true,
        bufferline = true,
        gitsigns = true,
        lsp = true,
        telescope = true,
    },
}
require('Comment').setup {}

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
    buf_map(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

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
    "sumneko_lua",
    "ltex"
}

npairs.setup({ map_bs = false, map_cr = false })
for _, server in ipairs(servers) do
    lspconfig[server].setup(coq.lsp_ensure_capabilities({
        on_attach = on_attach,
    }))
end

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

require('leap').set_default_keymaps()

local coq_map_opts = { expr = true, noremap = true }
map('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], coq_map_opts)
map('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], coq_map_opts)
map('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], coq_map_opts)
map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], coq_map_opts)

map('i', '<cr>', 'v:lua.U.CR()', coq_map_opts)
map('i', '<bs>', 'v:lua.U.BS()', coq_map_opts)

map('i', 'jk', '<esc>')
map("n", "<C-n>", ":NvimTreeToggle<CR>")
map("n", "<leader>e", ":NvimTreeFocus<CR>")

map('n', '<A-p>', ':BufferPick<CR>')
map('n', '<A-w>', ':BufferClose<CR>')
map('n', '<Tab>', ':BufferNext<CR>')
map('n', '<A-Tab>', ':BufferPrevious<CR>')

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-s><C-s>", ":wqa<CR>")
map("n", "<C-s>", ":w<CR>")
map("n", "<C-q><C-q>", ":qa!<CR>")
map("n", "<S-f>", ":FZF<CR>")

map('n', '\\', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '[\\', '<cmd>lua vim.diagnostic.goto_prev()<CR>zz')
map('n', ']\\', '<cmd>lua vim.diagnostic.goto_next()<CR>zz')
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
local patterns = { dart = 2, ts = 2, py = 4 }
local ag_tabwidth = augroup("tabwidth", { clear = true })
for k, v in pairs(patterns) do
    au("BufRead", {
        group = ag_tabwidth,
        pattern = "*." .. k,
        command = stringf("setlocal expandtab tabstop=%s shiftwidth=%s softtabstop=%s", v, v, v),
    })
end
