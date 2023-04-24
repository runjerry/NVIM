local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("telescope not found")
  return
end

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- initial mode default as insert mode, could change to normal
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "horizontal",
    -- keybinding shortcuts within the window
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- optinal: dropdown, cursor, ivy
      -- mappings = {
      --   n = {
      --     ["cd"] = function(prompt_bufnr)
      --       local selection = require("telescope.actions.state").get_selected_entry()
      --       local dir = vim.fn.fnamemodify(selection.path, ":p:h")
      --       require("telescope.actions").close(prompt_bufnr)
      --       -- depending on what you want put 'cd', 'lcd', 'tcd'
      --       vim.cmd(string.format("silent lcd %s", dir))
      --     end
      --   } 
      -- }
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
      }),
    },
    ["cder"] = {
      dir_command = { 'fd', '--hidden', '--type=d', '.', '/' },
      -- dir_command = { 'fd', '--hidden', '--type=d', '.', os.getenv('HOME') },
    }
  },
})

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
-- for quickly changing working directory
pcall(telescope.load_extension, "cder")

