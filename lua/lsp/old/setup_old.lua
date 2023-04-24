local status, mason = pcall(require, "mason")
if not status then
    vim.notify("mason.nvim not found")
	return
end

mason.setup({
	ui = {
		border = "rounded",
	},
	install_root_dir = vim.env.VIM .. "/lsp/mason",
})

local mason_lspconfig
status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
	vim.notify("mason-lspconfig not found")
	return
end

mason_lspconfig.setup({
	ensure_installed = {
		"bash-language-server",
		-- "shfmt",
		"shellcheck",
		-- "luacheck",
		"stylua",
		"lua-language-server",
		"black",
		"pyright",
		"pylint",
		"debugpy",
		-- "cpptools",
		"eslint-lsp",
		"eslint_d",
		"node-debug2-adapter",
		"typescript-language-server",
		"quick-lint-js",
		"prettier",
		-- "sqls",
		-- "sql-formatter",
		"json-lsp",
		"html-lsp",
		"fixjson",
		-- "emmet-ls",
		"css-lsp",
		-- "markdownlint",
		-- "gopls",
	},
	automatic_installation = true,
})

local lspconfig
status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("lspconfig not found")
	return
end


-- use neovim native lspconfig for language server config
local servers = {
	sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
	bashls = require("lsp.config.bash"),
	pyright = require("lsp.config.pyright"),
	-- eslint = require("lsp.config.eslint"),
	-- tsserver = require("lsp.config.tsserver"),
	-- sqls = require("lsp.config.sqls"),
	-- emmet_ls = require("lsp.config.emmet-ls"),
	jsonls = require("lsp.config.json"),
	-- html = require("lsp.config.html"),
	cssls = require("lsp.config.css"),
	-- clangd = require("lsp.config.clangd"),
	-- quick_lint_js = require("lsp.config.quick-lint-js"),
	-- gopls = require("lsp.config.gopls"),
}
for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		-- default settings
		lspconfig[name].setup({})
	end
end


------------------------------------------------------------------------------
-- old nvim-lsp-installer config

-- -- local lsp_installer = require("nvim-lsp-installer")
-- require("mason").setup({
--   -- 自动安装 Language Servers
--   -- automatic_installation = true,
-- })
--
-- require("mason-lspconfig").setup {
--     ensure_installed = { "sumneko_lua", "lua-language-server)", "pyright" },
--     automatic_installation = true,
-- }
--
-- require("lspconfig")
--
-- -- local lspconfig = require("lspconfig")
--
-- -- 安装列表
-- -- { key: 服务器名， value: 配置文件 }
-- -- key 必须为下列网址列出的 server name，不可以随便写
-- -- https://github.com/williamboman/nvim-lsp-installer#available-lsps
--
-- -- local servers = {
-- --   sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
-- --  -- bashls = require("lsp.config.bash"),
-- --   pyright = require("lsp.config.pyright"),
-- --  -- html = require("lsp.config.html"),
-- --  -- cssls = require("lsp.config.css"),
-- --  -- emmet_ls = require("lsp.config.emmet"),
-- --  -- jsonls = require("lsp.config.json"),
-- --  -- tsserver = require("lsp.config.ts"),
-- --  -- rust_analyzer = require("lsp.config.rust"),
-- --  -- yamlls = require("lsp.config.yamlls"),
-- --   -- remark_ls = require("lsp.config.markdown"),
-- -- }
--
-- -- for name, config in pairs(servers) do
-- --   if config ~= nil and type(config) == "table" then
-- --     -- 自定义初始化配置文件必须实现on_setup 方法
-- --     config.on_setup(lspconfig[name])
-- --   else
-- --     -- 使用默认参数
-- --     lspconfig[name].setup({})
-- --   end
-- -- end
