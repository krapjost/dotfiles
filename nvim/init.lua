local nvim_dir = vim.fn.stdpath [[config]]
local data_dir = vim.fn.stdpath [[data]]

local function bootstrap(url)
  local name = url:gsub(".*/", "")
  local path = data_dir .. "/site/pack/paqs/start/" .. name

  if vim.fn.isdirectory(path) == 0 then
    print(name .. ": installing in data dir...")

    vim.fn.system { "git", "clone", "--depth", "1", url, path }

    vim.cmd [[redraw]]
    print(name .. ": finished installing")
  end
end

bootstrap "https://github.com/savq/paq-nvim.git"
bootstrap "https://github.com/udayvir-singh/tangerine.nvim"

require "tangerine".setup {
  -- fnl output
  vimrc = nvim_dir .. "/vimrc.fnl",
  source = nvim_dir .. "/fnl",
  target = nvim_dir .. "/lua",
  -- compile before loading init.fnl
  compiler = {
    hooks = { "onsave", "oninit" }
  }
}
