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
local package_path_str = "/home/krap/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/krap/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/krap/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/krap/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/krap/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    after_files = { "/home/krap/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
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
    config = { "\27LJ\2\nÓ\14\0\0\25\0N\4ö\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0009\b\t\0006\t\0\0'\v\n\0B\t\2\0029\t\v\t6\n\0\0'\f\n\0B\n\2\0029\n\f\n6\v\0\0'\r\n\0B\v\2\0029\v\r\v6\f\0\0'\14\14\0B\f\2\0029\r\15\0009\r\16\r5\15\17\0004\16\0\b9\17\18\f5\18\22\0005\19\20\0004\20\3\0005\21\19\0>\21\1\20=\20\21\19=\19\23\18<\18\17\0169\17\24\f5\18\27\0005\19\26\0004\20\3\0005\21\25\0>\21\1\20=\20\21\19=\19\23\18<\18\17\16=\16\28\15B\r\2\0015\r+\0004\14\4\0\18\15\1\0'\17\30\0004\18\4\0\18\19\4\0)\21\1\0'\22\31\0B\19\3\2>\19\1\18\18\19\3\0005\21 \0B\19\2\2>\19\2\18\18\19\v\0)\21\1\0B\19\2\0?\19\0\0B\15\3\2>\15\1\14\18\15\1\0'\17!\0\18\18\t\0006\20\"\0009\20#\20'\21$\0B\18\3\0A\15\1\2>\15\2\14\18\15\1\0'\17%\0004\18\4\0\18\19\4\0)\21\1\0005\22&\0B\19\3\2>\19\1\18\18\19\3\0'\21'\0B\19\2\2>\19\2\18\18\19\n\0)\21\1\0'\22(\0'\23)\0'\24*\0B\19\5\0?\19\0\0B\15\3\0?\15\0\0=\14,\r4\14\4\0\18\15\1\0'\17-\0004\18\a\0\18\19\3\0'\21.\0B\19\2\2>\19\1\18\18\19\4\0)\21\1\0005\22/\0B\19\3\2>\19\2\18\18\19\3\0005\0210\0B\19\2\2>\19\3\18\18\19\4\0)\21\2\0005\0221\0B\19\3\2>\19\4\18\18\19\3\0005\0212\0B\19\2\2>\19\5\18\18\19\3\0'\0213\0B\19\2\0?\19\1\0B\15\3\2>\15\1\14\18\15\1\0'\0174\0004\18\n\0\18\19\3\0'\0215\0B\19\2\2>\19\1\18\18\19\4\0)\21\1\0005\0226\0B\19\3\2>\19\2\18\18\19\3\0'\0217\0B\19\2\2>\19\3\18\18\19\4\0)\21\2\0005\0228\0B\19\3\2>\19\4\18\18\19\3\0'\0219\0B\19\2\2>\19\5\18\18\19\3\0005\21:\0B\19\2\2>\19\6\18\18\19\3\0'\21;\0B\19\2\2>\19\a\18\18\19\4\0)\21\3\0B\19\2\2>\19\b\18\18\19\3\0005\21<\0B\19\2\0?\19\2\0B\15\3\2>\15\2\14\18\15\1\0'\17=\0004\18\r\0\18\19\3\0'\0215\0B\19\2\2>\19\1\18\18\19\4\0)\21\1\0005\22>\0B\19\3\2>\19\2\18\18\19\3\0'\21?\0B\19\2\2>\19\3\18\18\19\4\0)\21\2\0005\22@\0B\19\3\2>\19\4\18\18\19\3\0'\21A\0B\19\2\2>\19\5\18\18\19\4\0)\21\3\0005\22B\0B\19\3\2>\19\6\18\18\19\3\0'\21C\0B\19\2\2>\19\a\18\18\19\4\0)\21\4\0005\22D\0B\19\3\2>\19\b\18\18\19\3\0005\21E\0B\19\2\2>\19\t\18\18\19\3\0'\21F\0B\19\2\2>\19\n\18\18\19\4\0)\21\5\0005\22G\0B\19\3\2>\19\v\18\18\19\3\0005\21H\0B\19\2\0?\19\3\0B\15\3\0?\15\0\0=\14I\r=\r\29\0009\rJ\0'\15I\0005\16K\0B\r\3\0016\r\0\0'\15L\0B\r\2\0029\rM\rB\r\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\1\2\0\0\fflutter\20filetype_extend\tdart\1\4\0\0\6;\5\b});\1\2\0\0\bval\r\treturn \1\3\0\0\15) async* {\5\1\2\0\0\nparam\r>((ref, \1\2\0\0\aT2\a, \1\2\0\0\aT1&Provider = StreamProvider.family<\1\2\0\0\tname\rstreamPF\1\4\0\0\6;\5\b});\freturn \1\3\0\0\5\6\t\21>((ref) async* {\1\2\0\0\6T\31Provider = StreamProvider<\1\2\0\0\tname\vfinal \fstreamP\6}\1\3\0\0\5\5\1\2\0\0\fcontent\1\3\0\0&Nofitier extends ChangeNotifier {\6\t\1\2\0\0\tname\vclass \fchangeN\ball\1\0\0\17no number :(\22contains a number\a%d\a: \1\2\0\0\16sample_text\bmat\a%Y\tdate\aos\tpart\1\3\0\0\5\5\ttext\vrepeat\rsnippets\rext_opts\1\0\0\1\0\0\1\2\0\0\6I\15insertNode\vactive\1\0\0\14virt_text\1\0\0\1\3\0\0\6C\bRed\15choiceNode\1\0\5\24enable_autosnippets\2\17updateevents\29TextChanged,TextChangedI\22ext_prio_increase\3\1\fhistory\2\18ext_base_prio\3¬\2\15set_config\vconfig\23luasnip.util.types\brep\nmatch\fpartial\19luasnip.extras\17restore_node\17dynamic_node\16choice_node\18function_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\a€€À™\4\r€€À™\4\19€€À™\4\25€€À™\4\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["TrueZen.nvim"] = {
    commands = { "TZAtaraxis" },
    config = { "\27LJ\2\nŠ\4\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\17\0005\4\n\0005\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\4=\4\18\3=\3\19\2B\0\2\1K\0\1\0\nmodes\rataraxis\1\0\0\22affected_higroups\1\0\a\14VertSplit\2\16ColorColumn\2\15FoldColumn\2\17StatusLineNC\2\15StatusLine\2\15SignColumn\2\fNonText\2\14custom_bg\1\3\0\0\tnone\5\29ideal_writing_area_width\1\2\0\0\3\0\1\0\t\18right_padding\3 \17left_padding\3 \tquit\runtoggle\16top_padding\3\1\19bottom_padding\3\1\17auto_padding\2 keep_default_fold_fillchars\2\21bg_configuration\2\28ignore_floating_windows\2\aui\1\0\0\tleft\1\0\2\vnumber\2\19relativenumber\2\btop\1\0\0\1\0\1\16showtabline\3\0\nsetup\rtrue-zen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["apprentice.nvim"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/apprentice.nvim",
    url = "https://github.com/adisen99/apprentice.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "require('plugins.configs.others').better_escape(false)" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
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
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["flutter-tools.nvim"] = {
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
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('plugins.configs.others').autopairs(false)" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "LuaSnip", "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('plugins.configs.others').colorizer(false)" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/krap/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim" },
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
    needs_bufread = false,
    only_cond = false,
    path = "/home/krap/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
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

-- Setup for: nvim-lspconfig
time([[Setup for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006if &ft == \"packer\" | echo \"\" | else | silent! e %\bcmd\bvimx\1\0\4\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0003\2\6\0)\3\0\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\19nvim-lspconfig\21packer_lazy_load\15core.utils\frequire\0", "setup", "nvim-lspconfig")
time([[Setup for nvim-lspconfig]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16vim-matchup\21packer_lazy_load\15core.utils\frequire\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: gitsigns.nvim
time([[Setup for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18gitsigns.nvim\21packer_lazy_load\15core.utils\frequire\0", "setup", "gitsigns.nvim")
time([[Setup for gitsigns.nvim]], false)
-- Setup for: Comment.nvim
time([[Setup for Comment.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcomment\18core.mappings\frequire\0", "setup", "Comment.nvim")
time([[Setup for Comment.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rnvimtree\18core.mappings\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14telescope\18core.mappings\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandÉ\1\0\2\b\0\n\0\0176\2\0\0'\4\1\0B\2\2\0026\3\3\0009\3\4\3'\5\5\0009\6\2\0018\6\6\0029\a\2\1B\3\4\2=\3\2\0015\3\a\0009\4\b\0009\4\t\0048\3\4\3=\3\6\1L\1\2\0\tname\vsource\1\0\3\vbuffer\n[BUF]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\tmenu\n%s %s\vformat\vstring\tkind\"plugins.configs.lspkind_icons\frequire[\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\19expand_or_jump\23expand_or_jumpableŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÖ\a\1\0\v\0:\0k6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\n\0004\5\a\0005\6\4\0>\6\1\0055\6\5\0>\6\2\0055\6\6\0>\6\3\0055\6\a\0>\6\4\0055\6\b\0>\6\5\0055\6\t\0>\6\6\5=\5\v\0045\5\f\0=\5\r\0045\5\15\0003\6\14\0=\6\16\5=\5\17\0045\5\19\0003\6\18\0=\6\20\0055\6\21\0=\6\22\5=\5\23\0045\5\26\0009\6\24\0009\6\25\6B\6\1\2=\6\27\0059\6\24\0009\6\28\6B\6\1\2=\6\29\0059\6\24\0009\6\30\6)\büÿB\6\2\2=\6\31\0059\6\24\0009\6\30\6)\b\4\0B\6\2\2=\6 \0059\6\24\0009\6!\6B\6\1\2=\6\"\0059\6\24\0009\6#\6B\6\1\2=\6$\0059\6\24\0009\6%\0065\b(\0009\t&\0009\t'\t=\t)\bB\6\2\2=\6*\0059\6\24\0003\b+\0005\t,\0B\6\3\2=\6-\0059\6\24\0003\b.\0005\t/\0B\6\3\2=\0060\5=\5\24\4B\2\2\0019\2\3\0009\0021\2'\0042\0005\0054\0004\6\3\0005\a3\0>\a\1\6=\6\v\5B\2\3\0019\2\3\0009\0021\2'\0045\0005\0059\0009\0066\0009\6\v\0064\b\3\0005\t7\0>\t\1\b4\t\3\0005\n8\0>\n\1\tB\6\3\2=\6\v\5B\2\3\0012\0\0€K\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\f<S-Tab>\1\3\0\0\6i\6c\0\n<Tab>\1\3\0\0\6i\6c\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-e>\nabort\n<C-f>\n<C-d>\16scroll_docs\n<C-k>\21select_prev_item\n<C-j>\1\0\0\21select_next_item\fmapping\15formatting\vfields\1\4\0\0\tkind\tabbr\tmenu\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\17experimental\1\0\1\15ghost_text\2\fsources\1\0\0\1\0\1\tname\tpath\1\0\1\tname\fcmdline\1\0\2\tname\vbuffer\19keyword_length\3\5\1\0\1\tname\rnvim_lua\1\0\2\19max_item_count\3\5\tname\fluasnip\1\0\2\19max_item_count\3\n\tname\rnvim_lsp\nsetup\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
require('plugins.configs.others').autopairs(false)

vim.cmd [[ packadd LuaSnip ]]

-- Config for: LuaSnip
try_loadstring("\27LJ\2\nÓ\14\0\0\25\0N\4ö\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0009\b\t\0006\t\0\0'\v\n\0B\t\2\0029\t\v\t6\n\0\0'\f\n\0B\n\2\0029\n\f\n6\v\0\0'\r\n\0B\v\2\0029\v\r\v6\f\0\0'\14\14\0B\f\2\0029\r\15\0009\r\16\r5\15\17\0004\16\0\b9\17\18\f5\18\22\0005\19\20\0004\20\3\0005\21\19\0>\21\1\20=\20\21\19=\19\23\18<\18\17\0169\17\24\f5\18\27\0005\19\26\0004\20\3\0005\21\25\0>\21\1\20=\20\21\19=\19\23\18<\18\17\16=\16\28\15B\r\2\0015\r+\0004\14\4\0\18\15\1\0'\17\30\0004\18\4\0\18\19\4\0)\21\1\0'\22\31\0B\19\3\2>\19\1\18\18\19\3\0005\21 \0B\19\2\2>\19\2\18\18\19\v\0)\21\1\0B\19\2\0?\19\0\0B\15\3\2>\15\1\14\18\15\1\0'\17!\0\18\18\t\0006\20\"\0009\20#\20'\21$\0B\18\3\0A\15\1\2>\15\2\14\18\15\1\0'\17%\0004\18\4\0\18\19\4\0)\21\1\0005\22&\0B\19\3\2>\19\1\18\18\19\3\0'\21'\0B\19\2\2>\19\2\18\18\19\n\0)\21\1\0'\22(\0'\23)\0'\24*\0B\19\5\0?\19\0\0B\15\3\0?\15\0\0=\14,\r4\14\4\0\18\15\1\0'\17-\0004\18\a\0\18\19\3\0'\21.\0B\19\2\2>\19\1\18\18\19\4\0)\21\1\0005\22/\0B\19\3\2>\19\2\18\18\19\3\0005\0210\0B\19\2\2>\19\3\18\18\19\4\0)\21\2\0005\0221\0B\19\3\2>\19\4\18\18\19\3\0005\0212\0B\19\2\2>\19\5\18\18\19\3\0'\0213\0B\19\2\0?\19\1\0B\15\3\2>\15\1\14\18\15\1\0'\0174\0004\18\n\0\18\19\3\0'\0215\0B\19\2\2>\19\1\18\18\19\4\0)\21\1\0005\0226\0B\19\3\2>\19\2\18\18\19\3\0'\0217\0B\19\2\2>\19\3\18\18\19\4\0)\21\2\0005\0228\0B\19\3\2>\19\4\18\18\19\3\0'\0219\0B\19\2\2>\19\5\18\18\19\3\0005\21:\0B\19\2\2>\19\6\18\18\19\3\0'\21;\0B\19\2\2>\19\a\18\18\19\4\0)\21\3\0B\19\2\2>\19\b\18\18\19\3\0005\21<\0B\19\2\0?\19\2\0B\15\3\2>\15\2\14\18\15\1\0'\17=\0004\18\r\0\18\19\3\0'\0215\0B\19\2\2>\19\1\18\18\19\4\0)\21\1\0005\22>\0B\19\3\2>\19\2\18\18\19\3\0'\21?\0B\19\2\2>\19\3\18\18\19\4\0)\21\2\0005\22@\0B\19\3\2>\19\4\18\18\19\3\0'\21A\0B\19\2\2>\19\5\18\18\19\4\0)\21\3\0005\22B\0B\19\3\2>\19\6\18\18\19\3\0'\21C\0B\19\2\2>\19\a\18\18\19\4\0)\21\4\0005\22D\0B\19\3\2>\19\b\18\18\19\3\0005\21E\0B\19\2\2>\19\t\18\18\19\3\0'\21F\0B\19\2\2>\19\n\18\18\19\4\0)\21\5\0005\22G\0B\19\3\2>\19\v\18\18\19\3\0005\21H\0B\19\2\0?\19\3\0B\15\3\0?\15\0\0=\14I\r=\r\29\0009\rJ\0'\15I\0005\16K\0B\r\3\0016\r\0\0'\15L\0B\r\2\0029\rM\rB\r\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\1\2\0\0\fflutter\20filetype_extend\tdart\1\4\0\0\6;\5\b});\1\2\0\0\bval\r\treturn \1\3\0\0\15) async* {\5\1\2\0\0\nparam\r>((ref, \1\2\0\0\aT2\a, \1\2\0\0\aT1&Provider = StreamProvider.family<\1\2\0\0\tname\rstreamPF\1\4\0\0\6;\5\b});\freturn \1\3\0\0\5\6\t\21>((ref) async* {\1\2\0\0\6T\31Provider = StreamProvider<\1\2\0\0\tname\vfinal \fstreamP\6}\1\3\0\0\5\5\1\2\0\0\fcontent\1\3\0\0&Nofitier extends ChangeNotifier {\6\t\1\2\0\0\tname\vclass \fchangeN\ball\1\0\0\17no number :(\22contains a number\a%d\a: \1\2\0\0\16sample_text\bmat\a%Y\tdate\aos\tpart\1\3\0\0\5\5\ttext\vrepeat\rsnippets\rext_opts\1\0\0\1\0\0\1\2\0\0\6I\15insertNode\vactive\1\0\0\14virt_text\1\0\0\1\3\0\0\6C\bRed\15choiceNode\1\0\5\24enable_autosnippets\2\17updateevents\29TextChanged,TextChangedI\22ext_prio_increase\3\1\fhistory\2\18ext_base_prio\3¬\2\15set_config\vconfig\23luasnip.util.types\brep\nmatch\fpartial\19luasnip.extras\17restore_node\17dynamic_node\16choice_node\18function_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\a€€À™\4\r€€À™\4\19€€À™\4\25€€À™\4\0", "config", "LuaSnip")

vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-path ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
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
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim', 'nvim-treesitter', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
