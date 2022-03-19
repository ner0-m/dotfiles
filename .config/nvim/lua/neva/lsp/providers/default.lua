local config = require "neva.config"

local M = {}

function M.on_attach(client, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Setup lsp_signature
    require("lsp_signature").on_attach({
        toggle_key = "<C-f>",
    }, bufnr)

    local can_format = config.lsp.can_client_format(client.name)
    client.resolved_capabilities.document_formatting = can_format
    client.resolved_capabilities.document_range_formatting = can_format

    require("neva.lsp.mappings").init(client, bufnr)
end

M.flags = {
    debounce_text_changes = 150,
}

M.capabilities = {}

M.autostart = true

M.single_file_mode = true

return M
