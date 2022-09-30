-- :fennel:1664546017
local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup.cmdline("/", {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "path"}, {name = "cmdline"}}})
local icons = {Text = "\239\131\137", Method = "\239\154\166", Function = "\239\158\148", Constructor = "\226\140\152", Field = "\239\176\160", Variable = "\239\156\155", Class = "\239\180\175", Interface = "\239\131\168", Module = "\239\163\146", Unit = "\229\161\158", Property = "\239\176\160", Value = "\239\162\159", Enum = "\239\133\157", Keyword = "\229\187\147", Snippet = "\239\153\176", Color = "\239\163\151", File = "\239\156\152", Reference = "\239\156\134", Folder = "\239\129\187", EnumMember = "\239\133\157", Constant = "\239\163\191", Struct = "\215\164\214\188", Event = "\239\131\167", Operator = "\239\154\148", TypeParameter = ""}
local function _1_(args)
  return luasnip.lsp_expand(args.body)
end
local function _2_(fallback)
  if cmp.visible() then
    return cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    return luasnip.expand_or_jump()
  else
    return fallback()
  end
end
local function _4_(fallback)
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    return luasnip.jump(-1)
  else
    return fallback()
  end
end
local function _6_(_, vim_item)
  vim_item.menu = vim_item.kind
  vim_item.kind = icons[vim_item.kind]
  return vim_item
end
return {experimental = {ghost_text = true}, window = {documentation = {border = "solid"}, completion = {border = "solid"}}, preselect = cmp.PreselectMode.None, snippet = {expand = _1_}, mapping = {["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.close(), ["<up>"] = cmp.config.disable, ["<down>"] = cmp.config.disable, ["<Tab>"] = cmp.mapping(_2_, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(_4_, {"i", "s"}), ["<space>"] = cmp.mapping.confirm({select = false})}, sources = {{name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"}, {name = "path"}}, formatting = {fields = {"kind", "abbr", "menu"}, format = _6_}}