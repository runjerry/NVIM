local status, bufferline = pcall(require, "bufferline")
if not status then
  vim.notify("bufferline not found")
  return
end
-- bfferline config
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
  options = {
    -- close Tab
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- sidebar config
    -- leave space for nvim-tree and display "File Explorer"
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- use nvim embedded LSP
    diagnostics = "nvim_lsp",
    diagnostics = false,
    -- configurable, LSP error label
    -- @diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and "" or (e == "warning" and "" or "")
        -- local sym = e == "error" or (e == "warning")
        s = s .. n .. sym
      end
      return s
    end,
  },
  highlights = {
    buffer_selected = {
      -- fg = "#ffbf00",
      -- fg = "#cce6ff",
      fg = "#e6f2ff",
      bg = "#5a5a5a",
      -- bg = "#595959",
      bold = true,
      italic = true,
    },
    -- buffer_visible = {
    --   fg = "#ebdbb2",
    --   bg = normal_bg, 
    -- },
    -- buffer_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    -- },
  }
})
