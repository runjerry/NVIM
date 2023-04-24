-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- jkhl scroll offset
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- relative row number
vim.wo.number = true
vim.wo.relativenumber = false
-- highlight cursor line
vim.wo.cursorline = true
--vim.highlight.create('cursorline', {cterm=None, gui=None}, false)
--vim.highlight.create('cursorline', {cterm=underline, gui=underline}, false)
-- show left side column
-- vim.wo.signcolumn = "yes"
vim.wo.signcolumn = "auto:2"
-- right reference line
-- vim.wo.colorcolumn = "80"
-- indent 4 space = Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << moving width
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- space as tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- auto indent of new line
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- case insensitive in search, except when upper case is presented
vim.o.ignorecase = true
vim.o.smartcase = true
-- turn search highlight on
vim.o.hlsearch = true
-- highlight search results as you type
vim.o.incsearch = true
-- cmd line height
vim.o.cmdheight = 1
-- autoload when file updated elsewhere
vim.o.autoread = true
vim.bo.autoread = true
-- no row wrap
vim.wo.wrap = false
-- line switch with <Left><Right> when cursor at the beginning or end of line
vim.o.whichwrap = "<,>,[,]"
-- allow revised buffer being hidden
vim.o.hidden = true
-- mouse support
vim.o.mouse = "a"
-- backup file forbidden
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- set timeoutlen for click time as 500 ms
-- for more details: https://github.c m/nshen/learn-neovim-lua/issues/1
vim.o.timeoutlen = 500
-- split window appearing from right and blow
vim.o.splitbelow = true
vim.o.splitright = true
-- autocomplete without auto selection
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- colors
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- invisible chars
vim.o.list = true
-- show invisible chars: space as a "·", tab as "··"
vim.o.listchars = "space:·,tab:··"
-- enhanced completion
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- at most 10 rows for autocomplete display
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 2
-- no need for vim mode reminder when using enhanced status bar plugins
vim.o.showmode = false
-- setup clipboard
vim.o.clipboard = "unnamedplus"
vim.opt.clipboard = "unnamedplus"

vim.cmd [[
let g:clipboard = {
    \ 'name': 'myClipboard',
    \     'copy': {
    \         '+': 'clipboard-provider copy',
    \         '*': 'clipboard-provider copy',
    \     },
    \     'paste': {
    \         '+': 'clipboard-provider paste',
    \         '*': 'clipboard-provider paste',
    \     },
    \ }
]]
