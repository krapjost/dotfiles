-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/krap/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/krap/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/krap/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/krap/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/krap/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "require('plugins.configs.others').comment(false)" },
    keys = { { "", "gcc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "cmp_luasnip" },
    config = { "\27LJ\1\2é\1\0\0\4\0\n\0\0174\0\0\0%\1\1\0>\0\2\0027\1\2\0007\1\3\0013\2\4\0>\1\2\0017\1\5\0%\2\6\0003\3\a\0>\1\3\0014\1\0\0%\2\b\0>\1\2\0027\1\t\1>\1\1\1G\0\1\0\14lazy_load luasnip.loaders.from_vscode\1\2\0\0\fflutter\tdart\20filetype_extend\1\0\3\24enable_autosnippets\2\fhistory\2\22ext_prio_increase\3\1\15set_config\vconfig\fluasnip\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["TrueZen.nvim"] = {
    commands = { "TZAtaraxis" },
    config = { "\27LJ\1\2Š\4\0\0\5\0\20\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\2:\2\t\0013\2\17\0003\3\n\0003\4\v\0:\4\f\0033\4\r\0:\4\14\0033\4\15\0:\4\16\3:\3\18\2:\2\19\1>\0\2\1G\0\1\0\nmodes\rataraxis\1\0\0\22affected_higroups\1\0\a\17StatusLineNC\2\14VertSplit\2\fNonText\2\15StatusLine\2\16ColorColumn\2\15SignColumn\2\15FoldColumn\2\14custom_bg\1\3\0\0\tnone\5\29ideal_writing_area_width\1\2\0\0\3\0\1\0\t\18right_padding\3 \16top_padding\3\1\17left_padding\3 \19bottom_padding\3\1\17auto_padding\2\tquit\runtoggle\21bg_configuration\2 keep_default_fold_fillchars\2\28ignore_floating_windows\2\aui\1\0\0\tleft\1\0\2\19relativenumber\2\vnumber\2\btop\1\0\0\1\0\1\16showtabline\3\0\nsetup\rtrue-zen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "require('plugins.configs.others').better_escape(false)" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require('plugins.configs.bufferline').setup(false)" },
    load_after = {
      ["nvim-web-devicons"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-path" },
    after_files = { "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after = { "cmp-buffer" },
    after_files = { "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-cmdline" },
    after_files = { "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after = { "cmp-nvim-lua" },
    after_files = { "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  extensions = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/extensions",
    url = "https://github.com/NvChad/extensions"
  },
  ["feline.nvim"] = {
    config = { "require('plugins.configs.statusline').setup(false)" },
    load_after = {
      ["nvim-web-devicons"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\1\2Š\2\0\0\5\0\14\0\0174\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\4\0003\3\3\0:\3\5\0023\3\a\0003\4\6\0:\4\b\3:\3\t\0023\3\v\0003\4\n\0:\4\f\3:\3\r\2>\1\2\1G\0\1\0\16decorations\15statusline\1\0\0\1\0\2\16app_version\2\vdevice\2\blsp\ncolor\1\0\0\1\0\5\21virtual_text_str\bâ– \17virtual_text\2\fenabled\2\15background\1\15foreground\1\18widget_guides\1\0\0\1\0\1\fenabled\2\nsetup\18flutter-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.configs.others').gitsigns(false)" },
    loaded = false,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('plugins.configs.others').blankline(false)" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-fastaction.nvim"] = {
    config = { "\27LJ\1\2>\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0#plugins.configs.lsp-fastaction\frequire\0" },
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/lsp-fastaction.nvim",
    url = "https://github.com/windwp/lsp-fastaction.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "require('plugins.configs.others').signature(false)" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["null-ls.nvim"] = {
    config = { '\27LJ\1\2K\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup"plugins.configs.null-ls-setup\frequire\0' },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('plugins.configs.others').autopairs(false)" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    after = { "nvim-web-devicons" },
    config = { "\27LJ\1\0023\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\tinit\vcolors\frequire\0" },
    load_after = {
      ["packer.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-base16.lua",
    url = "https://github.com/NvChad/nvim-base16.lua"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "LuaSnip" },
    config = { "\27LJ\1\2-\0\1\3\1\2\0\5+\1\0\0007\1\0\0017\2\1\0>\1\2\1G\0\1\0\2À\tbody\15lsp_expand\"\0\2\4\1\1\0\5+\2\0\0007\3\0\0016\2\3\2:\2\0\1H\1\2\0\0À\tkindü\1\0\1\a\2\n\0\31+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\21€+\1\1\0007\1\2\1>\1\1\2\15\0\1\0T\2\14€4\1\3\0007\1\4\0017\1\5\0014\2\3\0007\2\6\0027\2\a\2%\3\b\0)\4\2\0)\5\2\0)\6\2\0>\2\5\2%\3\t\0>\1\3\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\1À\2À\5!<Plug>luasnip-expand-or-jump\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\23expand_or_jumpable\21select_next_item\fvisibleñ\1\0\1\a\2\n\0 +\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\22€+\1\1\0007\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\14€4\1\3\0007\1\4\0017\1\5\0014\2\3\0007\2\6\0027\2\a\2%\3\b\0)\4\2\0)\5\2\0)\6\2\0>\2\5\2%\3\t\0>\1\3\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\1À\2À\5\28<Plug>luasnip-jump-prev\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\rjumpable\21select_prev_item\fvisible×\b\1\0\n\0004\0^3\0\0\0004\1\1\0%\2\2\0>\1\2\0024\2\1\0%\3\3\0>\2\2\0027\3\4\0013\4\n\0002\5\6\0003\6\5\0;\6\1\0053\6\6\0;\6\2\0053\6\a\0;\6\3\0053\6\b\0;\6\4\0053\6\t\0;\6\5\5:\5\v\0043\5\f\0:\5\r\0043\5\15\0001\6\14\0:\6\16\5:\5\17\0043\5\19\0001\6\18\0:\6\20\0053\6\21\0:\6\22\5:\5\23\0043\5\26\0007\6\24\0017\6\25\6'\aüÿ>\6\2\2:\6\27\0057\6\24\0017\6\25\6'\a\4\0>\6\2\2:\6\28\0057\6\24\0017\6\29\6>\6\1\2:\6\30\0057\6\24\0017\6\31\0063\a\"\0007\b \0017\b!\b:\b#\a>\6\2\2:\6$\0057\6\24\0011\a%\0003\b&\0>\6\3\2:\6'\0057\6\24\0011\a(\0003\b)\0>\6\3\2:\6*\5:\5\24\4>\3\2\0017\3\4\0017\3+\3%\4,\0003\5.\0002\6\3\0003\a-\0;\a\1\6:\6\v\5>\3\3\0017\3\4\0017\3+\3%\4/\0003\0053\0007\0060\0017\6\v\0062\a\3\0003\b1\0;\b\1\a2\b\3\0003\t2\0;\t\1\b>\6\3\2:\6\v\5>\3\3\0010\0\0€G\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\f<S-Tab>\1\3\0\0\6i\6c\0\n<Tab>\1\3\0\0\6i\6c\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nabort\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\15formatting\vfields\1\4\0\0\tkind\tabbr\tmenu\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\17experimental\1\0\1\15ghost_text\2\fsources\1\0\0\1\0\1\tname\tpath\1\0\2\19keyword_length\3\5\tname\vbuffer\1\0\1\tname\rnvim_lua\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\nsetup\fluasnip\bcmp\frequire\1\0\25\tText\bï¾\rFunction\bïž”\rOperator\bïš”\nColor\bï£—\vMethod\bïš¦\vModule\bï’‡\rConstant\bï£¾\14Interface\bïƒ¨\nEvent\bïƒ§\15EnumMember\bï…\nField\bï° \18TypeParameter\5\vStruct\bï­„\rVariable\bï”ª\fSnippet\bï‘\vFolder\bïŠ\nValue\bï¢Ÿ\16Constructor\bï£\fKeyword\bï Š\tFile\bïœ˜\nClass\bï´¯\rProperty\bï° \tEnum\bï…\tUnit\bï¥¬\14Reference\bïœ†\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim", "null-ls.nvim" },
    config = { "require('plugins.configs.lspconfig')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFocus" },
    config = { "require('plugins.configs.nvimtree').setup(false)" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('plugins.configs.treesitter').setup(false)" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    after = { "bufferline.nvim", "feline.nvim" },
    config = { "require('plugins.configs.icons').setup(false)" },
    load_after = {
      ["nvim-base16.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    after = { "nvim-base16.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('plugins.configs.telescope').setup(false)" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-matchup"] = {
    after_files = { "/home/krap/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^Comment"] = "Comment.nvim",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14telescope\18core.mappings\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: gitsigns.nvim
time([[Setup for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\18gitsigns.nvim\21packer_lazy_load\15core.utils\frequire\0", "setup", "gitsigns.nvim")
time([[Setup for gitsigns.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2>\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\rnvimtree\18core.mappings\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: bufferline.nvim
time([[Setup for bufferline.nvim]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\15bufferline\18core.mappings\frequire\0", "setup", "bufferline.nvim")
time([[Setup for bufferline.nvim]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\1\2S\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\16vim-matchup\21packer_lazy_load\15core.utils\frequire\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: Comment.nvim
time([[Setup for Comment.nvim]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\fcomment\18core.mappings\frequire\0", "setup", "Comment.nvim")
time([[Setup for Comment.nvim]], false)
-- Setup for: nvim-lspconfig
time([[Setup for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2U\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0006if &ft == \"packer\" | echo \"\" | else | silent! e %\bcmd\bvimx\1\0\3\0\a\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\4\0007\0\5\0001\1\6\0'\2\0\0>\0\3\1G\0\1\0\0\rdefer_fn\bvim\19nvim-lspconfig\21packer_lazy_load\15core.utils\frequire\0", "setup", "nvim-lspconfig")
time([[Setup for nvim-lspconfig]], false)
-- Config for: lsp-fastaction.nvim
time([[Config for lsp-fastaction.nvim]], true)
try_loadstring("\27LJ\1\2>\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0#plugins.configs.lsp-fastaction\frequire\0", "config", "lsp-fastaction.nvim")
time([[Config for lsp-fastaction.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd friendly-snippets ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\1\2-\0\1\3\1\2\0\5+\1\0\0007\1\0\0017\2\1\0>\1\2\1G\0\1\0\2À\tbody\15lsp_expand\"\0\2\4\1\1\0\5+\2\0\0007\3\0\0016\2\3\2:\2\0\1H\1\2\0\0À\tkindü\1\0\1\a\2\n\0\31+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\21€+\1\1\0007\1\2\1>\1\1\2\15\0\1\0T\2\14€4\1\3\0007\1\4\0017\1\5\0014\2\3\0007\2\6\0027\2\a\2%\3\b\0)\4\2\0)\5\2\0)\6\2\0>\2\5\2%\3\t\0>\1\3\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\1À\2À\5!<Plug>luasnip-expand-or-jump\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\23expand_or_jumpable\21select_next_item\fvisibleñ\1\0\1\a\2\n\0 +\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\22€+\1\1\0007\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\14€4\1\3\0007\1\4\0017\1\5\0014\2\3\0007\2\6\0027\2\a\2%\3\b\0)\4\2\0)\5\2\0)\6\2\0>\2\5\2%\3\t\0>\1\3\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\1À\2À\5\28<Plug>luasnip-jump-prev\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\rjumpable\21select_prev_item\fvisible×\b\1\0\n\0004\0^3\0\0\0004\1\1\0%\2\2\0>\1\2\0024\2\1\0%\3\3\0>\2\2\0027\3\4\0013\4\n\0002\5\6\0003\6\5\0;\6\1\0053\6\6\0;\6\2\0053\6\a\0;\6\3\0053\6\b\0;\6\4\0053\6\t\0;\6\5\5:\5\v\0043\5\f\0:\5\r\0043\5\15\0001\6\14\0:\6\16\5:\5\17\0043\5\19\0001\6\18\0:\6\20\0053\6\21\0:\6\22\5:\5\23\0043\5\26\0007\6\24\0017\6\25\6'\aüÿ>\6\2\2:\6\27\0057\6\24\0017\6\25\6'\a\4\0>\6\2\2:\6\28\0057\6\24\0017\6\29\6>\6\1\2:\6\30\0057\6\24\0017\6\31\0063\a\"\0007\b \0017\b!\b:\b#\a>\6\2\2:\6$\0057\6\24\0011\a%\0003\b&\0>\6\3\2:\6'\0057\6\24\0011\a(\0003\b)\0>\6\3\2:\6*\5:\5\24\4>\3\2\0017\3\4\0017\3+\3%\4,\0003\5.\0002\6\3\0003\a-\0;\a\1\6:\6\v\5>\3\3\0017\3\4\0017\3+\3%\4/\0003\0053\0007\0060\0017\6\v\0062\a\3\0003\b1\0;\b\1\a2\b\3\0003\t2\0;\t\1\b>\6\3\2:\6\v\5>\3\3\0010\0\0€G\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\f<S-Tab>\1\3\0\0\6i\6c\0\n<Tab>\1\3\0\0\6i\6c\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nabort\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\15formatting\vfields\1\4\0\0\tkind\tabbr\tmenu\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\17experimental\1\0\1\15ghost_text\2\fsources\1\0\0\1\0\1\tname\tpath\1\0\2\19keyword_length\3\5\tname\vbuffer\1\0\1\tname\rnvim_lua\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\nsetup\fluasnip\bcmp\frequire\1\0\25\tText\bï¾\rFunction\bïž”\rOperator\bïš”\nColor\bï£—\vMethod\bïš¦\vModule\bï’‡\rConstant\bï£¾\14Interface\bïƒ¨\nEvent\bïƒ§\15EnumMember\bï…\nField\bï° \18TypeParameter\5\vStruct\bï­„\rVariable\bï”ª\fSnippet\bï‘\vFolder\bïŠ\nValue\bï¢Ÿ\16Constructor\bï£\fKeyword\bï Š\tFile\bïœ˜\nClass\bï´¯\rProperty\bï° \tEnum\bï…\tUnit\bï¥¬\14Reference\bïœ†\0", "config", "nvim-cmp")

vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
require('plugins.configs.others').autopairs(false)

vim.cmd [[ packadd LuaSnip ]]

-- Config for: LuaSnip
try_loadstring("\27LJ\1\2é\1\0\0\4\0\n\0\0174\0\0\0%\1\1\0>\0\2\0027\1\2\0007\1\3\0013\2\4\0>\1\2\0017\1\5\0%\2\6\0003\3\a\0>\1\3\0014\1\0\0%\2\b\0>\1\2\0027\1\t\1>\1\1\1G\0\1\0\14lazy_load luasnip.loaders.from_vscode\1\2\0\0\fflutter\tdart\20filetype_extend\1\0\3\24enable_autosnippets\2\fhistory\2\22ext_prio_increase\3\1\15set_config\vconfig\fluasnip\frequire\0", "config", "LuaSnip")

vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-path ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gcc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType dart ++once lua require("packer.load")({'flutter-tools.nvim'}, { ft = "dart" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'better-escape.nvim'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
