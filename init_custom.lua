-- ~/.config/nvim/init.lua
-- Draft : Custom conf outside

local fn = vim.fn
local fmt = string.format

-- Get the directory of the current init.lua (i.e., ~/.config/nvim)
local nvim_config_dir = fn.stdpath("config")
local custom_dir = nvim_config_dir .. "/../nvim-custom"
custom_dir = fn.resolve(custom_dir) -- resolve symlink / normalize path

-- Helper: safely require a module, print message if not found
local function try_load_config(path, name)
  local ok, mod = pcall(require, path)
  if ok then
    print(fmt("Loaded %s config: %s", name, path))
  else
    if not string.match(mod, "module not found") then
      -- Only warn on real errors, not missing files
      print(fmt("Error loading %s config %s: %s", name, path, mod))
    end
  end
end

-- 🔽 Load pre-config if it exists
if fn.isdirectory(custom_dir) == 1 then
  print("Custom config directory found: " .. custom_dir)

  -- Add custom directory to Lua's package.path so `require` can find it
  package.path = package.path .. ";" .. custom_dir .. "/?.lua"

  -- Load pre-config
  try_load_config("pre-config", "pre")
end

-- 🧱 Load your main base configuration here
require("config.base.options")
require("config.base.keymaps")
require("config.base.plugins")

-- Optional: your local extras, UI, autocommands, etc.
-- require("config.ui")
-- require("config.autocmds")

-- 🔼 Load post-config if it exists
if fn.isdirectory(custom_dir) == 1 then
  try_load_config("post-config", "post")
end   
