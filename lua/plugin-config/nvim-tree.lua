-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("nvim-tree not found")
  return
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings not inserted as:
  --  remove_keymaps = true
  --  OR
  --  view.mappings.custom_only = true


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'i', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'I', api.node.show_info_popup, opts('Info'))
  vim.keymap.set('n', 'n', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', 'cd', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))

  -- default mappings
  -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
end

-- shortcuts list
local list_keys = require("keybindings").nvimTreeList

nvim_tree.setup({
  -- on_attach
  on_attach = on_attach,
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
