-- Basic setting
require("basic")
-- Bhortcut key mapping
require("keybindings")
-- Packer plugins manager
require("plugins")
-- Colorscheme
require("colorscheme")
-- Auto cmds
--require("autocmds")
-- Plugin configs
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.gitsigns")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.toggleterm")
require("plugin-config.surround")
require("plugin-config.comment")
require("plugin-config.nvim-autopairs")
require("plugin-config.fidget")
-- require("plugin-config.nvim-gdb")

-- LSP settings
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
--
-- Formatter
-- require("lsp.formatter")
require("lsp.null-ls")

-- DAP
-- require("dap.vimspector")
--require("dap.nvim-dap")

-- utils
-- copy to windows clipboard
--require('utils.fix-yank')
