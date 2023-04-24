-- https://github.com/sakhnik/nvim-gdb
local status, gdb = pcall(require, "nvim-gdb")
if not status then
  vim.notify("nvim-gdb not found")
  return
end
gdb.setup()
