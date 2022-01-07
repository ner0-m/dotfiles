require "neva.lsp.on_attach"
require "neva.lsp.diagnostics"
require "neva.lsp.config"

local config = require "neva.config"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = config.border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = config.border,
})
