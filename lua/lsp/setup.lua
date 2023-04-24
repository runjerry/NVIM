local status, mason = pcall(require, "mason")
if not status then
  vim.notify("mason not found")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("mason-lspconfig not found")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("lspconfig not found")
  return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
  ensure_installed = {
    -- "sumneko_lua",
    "lua_ls",
    "tsserver",
    "tailwindcss",
    "bashls",
    "cssls",
    -- "dockerls",
    -- "emmet_ls",
    "html",
    "jsonls",
    "pyright",
    -- "rust_analyzer",
    "taplo",
    "yamlls",
    -- "gopls",
    "clangd",
    "cmake",
  },
})

-- installation list
-- { key: server address， value: config file }
-- key has to be server name listed below
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  -- sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  bashls = require("lsp.config.bash"),
  pyright = require("lsp.config.pyright"),
  -- html = require("lsp.config.html"),
  cssls = require("lsp.config.css"),
  -- emmet_ls = require("lsp.config.emmet"),
  jsonls = require("lsp.config.json"),
  -- tsserver = require("lsp.config.typescript"),
  -- yamlls = require("lsp.config.yamlls"),
  -- dockerls = require("lsp.config.docker"),
  -- tailwindcss = require("lsp.config.tailwindcss"),
  -- rust_analyzer = require("lsp.config.rust"),
  -- taplo = require("lsp.config.taplo"), -- toml
  -- gopls = require("lsp.config.gopls"),
  -- remark_ls = require("lsp.config.markdown"),
  -- clangd = require("lsp.config.clangd"),
  -- cmake = require("lsp.config.cmake"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end

require("lsp.ui")
