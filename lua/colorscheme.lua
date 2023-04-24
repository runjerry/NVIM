vim.o.background = "dark"
-- vim.g.tokyonight_style = "night" -- day / night
vim.g.moonflyCursorColor = true
vim.g.moonflyNormalFloat = true
-- vim.g.neon_style = "dark"
-- vim.g.moonflyItalics = true
-- transparent
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
-- local colorscheme = "tokyonight"
-- local colorscheme = "nightfox"
local colorscheme = "moonfly"
-- local colorscheme = "neon"
-- local colorscheme = "ayu-dark"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " not found! ")
  return
end
