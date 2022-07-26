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
    letters = 'asdfjkl;ghnmxcvbziowerutyqpasdfjklghnmxcvbziowerutyqp',
    no_name_title = nil,
}
g.coq_settings                     = {
    auto_start = "shut-up",
    keymap = {
        eval_snips = "<leader>j",
        jump_to_mark = "<a-space>",
        recommended = false,
    },
}
g.python3_host_prog                = '~/.local/venv/nvim/bin/python'

opt.ignorecase     = true
opt.smartcase      = true
opt.number         = true
opt.numberwidth    = 2
opt.relativenumber = true
opt.shiftwidth     = 4
opt.tabstop        = 4
opt.smartindent    = true
opt.expandtab      = true
opt.clipboard      = "unnamedplus"
opt.list           = true
opt.mouse          = "a"
opt.listchars:append("eol:↴")
opt.listchars:append("space: ")
opt.updatetime = 100
opt.autoread = true
opt.termguicolors = true
