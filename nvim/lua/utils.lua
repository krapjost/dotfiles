-- :fennel:1663764540
local function safe_setup(plugin, _3fconfig)
  _G.assert((nil ~= plugin), "Missing argument plugin on utils.fnl:1")
  if (plugin ~= nil) then
    return plugin.setup((_3fconfig or {}))
  else
    return vim.pretty_print(("missing plugin :: " .. plugin))
  end
end
local function preq(name)
  local ok_3f, value = pcall(require, name)
  if ok_3f then
    return value
  else
    return nil
  end
end
local function setup_plugin_config(...)
  for _, name in ipairs({...}) do
    local plugin = preq(name)
    local config = preq(("plugin." .. name))
    safe_setup(plugin, config)
  end
  return nil
end
local function set_keymap(lhs, rhs, _3fopts, _3fmode)
  _G.assert((nil ~= rhs), "Missing argument rhs on utils.fnl:18")
  _G.assert((nil ~= lhs), "Missing argument lhs on utils.fnl:18")
  return vim.keymap.set((_3fmode or "n"), lhs, rhs, (_3fopts or {noremap = true, silent = true}))
end
return {preq = preq, ["setup-plugin-config"] = setup_plugin_config, ["set-keymap"] = set_keymap}