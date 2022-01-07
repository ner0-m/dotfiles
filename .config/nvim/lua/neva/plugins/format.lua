require("null-ls").setup {
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.code_actions.gitsigns,
    },
}

require("neva.utils").map("n", "<leader>xf", "<cmd>lua vim.lsp.buf.formatting()<cr>", { noremap = true })
require("neva.utils").map("v", "<leader>xf", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", { noremap = true })

-- if vim.tbl_contains(vim.lsp.buf_get_clients(), "sumneko_lua") then
--     print("I've got it")
-- end
