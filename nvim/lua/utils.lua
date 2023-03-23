local function safe_setup(plugin, config)
  _G.assert((nil ~= plugin), 'Missing argument plugin on utils.fnl:1')
  if plugin == nil then
    return vim.pretty_print(('Missing plugin is :: ' .. plugin))
  else
    return plugin.setup((config or {}))
  end
end

local function preq(name)
  local ok, value = pcall(require, name)
  if ok then
    return value
  else
    return nil
  end
end

local function preq_conf(name)
  return preq(('plugins.' .. name))
end

local function setup_plugins(...)
  for _, name in ipairs({ ... }) do
    local plugin = preq(name)
    local config = preq_conf(name)
    safe_setup(plugin, config)
  end
  return nil
end

local function init_plugins(...)
  for _, name in ipairs({ ... }) do
    preq_conf(name)
  end
  return nil
end

local function make_opts(desc, bufnr, silent)
  return { desc = desc, buffer = (bufnr or false), silent = (silent or true) }
end

local function map(lhs, rhs, desc, leader, mode, bufnr)
  _G.assert((nil ~= desc), 'Missing argument desc on utils.fnl:32')
  _G.assert((nil ~= rhs), 'Missing argument rhs on utils.fnl:32')
  _G.assert((nil ~= lhs), 'Missing argument lhs on utils.fnl:32')
  local m = (mode or 'n')
  local l = (leader or '')
  local o = make_opts(desc, bufnr)
  return vim.keymap.set(m, (l .. lhs), rhs, o)
end

return {
  preq = preq,
  ['setup-plugins'] = setup_plugins,
  ['init-plugins'] = init_plugins,
  map = map,
}
