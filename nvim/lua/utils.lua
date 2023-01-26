-- :fennel:1674640385
local function safe_setup(plugin, _3fconfig)
  _G.assert((nil ~= plugin), "Missing argument plugin on utils.fnl:1")
  if (plugin == nil) then
    return vim.pretty_print(("Missing plugin is :: " .. plugin))
  else
    return plugin.setup((_3fconfig or {}))
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
local function preq_conf(name)
  return preq(("plugins." .. name))
end
local function setup_plugins(...)
  for _, name in ipairs({...}) do
    vim.pretty_print(("init :: " .. name))
    local plugin = preq(name)
    local config = preq_conf(name)
    safe_setup(plugin, config)
  end
  return nil
end
local function init_plugins(...)
  for _, name in ipairs({...}) do
    preq_conf(name)
  end
  return nil
end
local function make_opts(desc, _3fbufnr, _3fsilent)
  return {desc = desc, buffer = (_3fbufnr or false), silent = (_3fsilent or true)}
end
local function map(lhs, rhs, desc, _3fleader, _3fmode, _3fbufnr)
  _G.assert((nil ~= desc), "Missing argument desc on utils.fnl:33")
  _G.assert((nil ~= rhs), "Missing argument rhs on utils.fnl:33")
  _G.assert((nil ~= lhs), "Missing argument lhs on utils.fnl:33")
  local m = (_3fmode or "n")
  local l = (_3fleader or "")
  local o = make_opts(desc, _3fbufnr)
  return vim.keymap.set(m, (l .. lhs), rhs, o)
end
return {preq = preq, ["setup-plugins"] = setup_plugins, ["init-plugins"] = init_plugins, map = map}