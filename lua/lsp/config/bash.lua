return {
  on_setup = function(server)
    server.setup({
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        if vim.fn.has("nvim-0.8") == 1 then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        else
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
        local function buf_set_keymap(...)
          ---@diagnostic disable-next-line: missing-parameter
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require("keybindings").mapLSP(buf_set_keymap)
      end,
    })
  end,
}
