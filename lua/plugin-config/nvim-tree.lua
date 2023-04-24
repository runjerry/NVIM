-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("nvim-tree not found")
  return
end

-- shortcuts list
local list_keys = require("keybindings").nvimTreeList

nvim_tree.setup({
  -- disable netrw
  disable_netrw = true,
  -- do not display git status
  git = {
    enable = false,
  },
  -- project plugin settings
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    -- hide .file
    dotfiles = true,
    -- hide node_modules folders
    -- custom = { "node_modules" },
  },
  view = {
    -- width
    width = 34,
    -- can be set to 'right'
    side = "left",
    -- hide root folder
    hide_root_folder = false,
    -- customizable list of shortcut mappings
    mappings = {
      -- use default shortcuts
      custom_only = true,
      list = list_keys,
    },
    -- do not display row number
    number = false,
    relativenumber = false,
    -- display signs
    signcolumn = "yes",
  },
  actions = {
    open_file = {
      -- adapt window size when openning
      resize_window = true,
      -- clase tree when openning file
      quit_on_open = false,
    },
  },
  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    -- mac
    cmd = "open",
    -- windows
    -- cmd = "wsl-open",
  },
})
