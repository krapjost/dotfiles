-- :fennel:1664608275
local _local_1_ = require("keymap")
local map_for_git = _local_1_["map-for-git"]
local function _2_(bufnr)
  return map_for_git(" ", bufnr)
end
return {on_attach = _2_, preview_config = {border = "none"}, numhl = true, current_line_blame = true, current_line_blame_opts = {delay = 100}, current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> -<summary>"}