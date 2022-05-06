local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end

local core_modules = {
   "core.options",
   "core.autocmds",
   "core.mappings",
}

for _, module in ipairs(core_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end

require("core.mappings").misc()

vim.o.background = "dark" -- or "light" for light mode
vim.g.apprentice_contrast_dark = "hard"
vim.g.apprentice_hls_lspreference = "bright_yellow"
vim.g.apprentice_hls_cursor = "bright_yellow"
vim.g.apprentice_hls_highlight = "bright_yellow"
vim.g.apprentice_italicize_booleans = true
vim.g.apprentice_tabline_sel = "fg0"

require "lush"(require("apprentice").setup {
   plugins = {
      -- "buftabline",
      "cmp", -- nvim-cmp
      -- "gitgutter",
      -- "gitsigns",
      "lsp",
      "nvimtree",
      -- "neogit",
      "packer",
      "telescope",
      "treesitter",
   },
   langs = {
      "c",
      "lua",
      "elixir",
      "golang",
      "rust",
      "html",
      "css",
      "js",
      "jsx",
      "typescript",
      "json",
      "xml",
      "markdown",
   },
})
