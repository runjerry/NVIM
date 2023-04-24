local opts = {
    flags = {
        debounce_text_changes = 150,
    },
	on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        if vim.fn.has("nvim-0.8") == 1 then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        else
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
        -- client.resolved_capabilities.document_formatting = false
        -- client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
		-- local lspComm = require("lsp.common-config")
		-- lspComm.keyAttach(bufnr)
		-- lspComm.shwLinDiaAtom(bufnr)
		-- lspComm.hlSymUdrCursor(client, bufnr)
	end,
	-- handlers = require("lsp.common-config").handlers,
	-- root_dir = nvim_lsp.util.root_pattern("project.md")
	-- root_dir = util.root_pattern("project.md"),
	-- root_dir = nvim_lsp.util.root_pattern("project.md"),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
opts.capabilities = capabilities

return {
	on_setup = function(server)
		server.setup(opts)
	end,
}



-----------------------------------------------------------------------
-- old lsp config

-- return {
--   on_setup = function(server)
--     server.setup({
--       flags = {
--         debounce_text_changes = 150,
--       },
--       on_attach = function(client, bufnr)
--         -- 禁用格式化功能，交给专门插件插件处理
--         client.resolved_capabilities.document_formatting = false
--         client.resolved_capabilities.document_range_formatting = false
--
--         local function buf_set_keymap(...)
--           vim.api.nvim_buf_set_keymap(bufnr, ...)
--         end
--         -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--         -- 绑定快捷键
--         require("keybindings").mapLSP(buf_set_keymap)
--       end,
--     })
--   end,
-- }
