-- setup lsp diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = {
        spacing = 8,
    },
})

vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "" })
vim.fn.sign_define("DiagnosticSignWarning", { texthl = "DiagnosticSignWarning", text = "" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "" })
vim.fn.sign_define("DiagnosticSignInformation", { texthl = "DiagnosticSignInformation", text = "" })
