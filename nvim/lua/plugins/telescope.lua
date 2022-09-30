-- :fennel:1664376982
local u = require("utils")
local telescope_layout = u.preq("telescope.actions.layout")
local telescope = u.preq("telescope")
telescope.load_extension("project")
return {defaults = {extensions = {project = {base_dirs = {"~/dotfiles", "~/project"}, hidden_files = true, order_by = "asc"}}, ["dynamic_preview_title:"] = true, winblend = 0, borderchars = {" ", " ", " ", " ", " ", " ", " ", " "}, layout_strategy = "flex", layout_config = {horizontal = {prompt_position = "top", preview_width = 0.55}, vertical = {mirror = false}, width = 0.9, height = 0.8, preview_cutoff = 120}, preview = {}, mappings = {n = {["<C-p>"] = telescope_layout.toggle_preview}, i = {["<C-p>"] = telescope_layout.toggle_preview}}}}