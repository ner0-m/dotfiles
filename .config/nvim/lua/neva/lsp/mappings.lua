local M = {}

function M.init(client, bufnr)
    local buf_map = require("neva.utils").buf_map
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
    buf_map(bufnr, "n", "gd", require("telescope.builtin").lsp_definitions)
    buf_map(bufnr, "n", "gD", vim.lsp.buf.declaration)
    buf_map(bufnr, "n", "gi", require("telescope.builtin").lsp_implementations)
    buf_map(bufnr, "n", "gt", require("telescope.builtin").lsp_type_definitions)
    buf_map(bufnr, "n", "gr", require("telescope.builtin").lsp_references)
    buf_map(bufnr, "n", "gR", vim.lsp.buf.rename)

    -- diagnostics
    buf_map(bufnr, "n", "<leader>ldp", vim.diagnostic.goto_prev)
    buf_map(bufnr, "n", "<leader>ldn", vim.diagnostic.goto_next)
    buf_map(bufnr, "n", "ge", function()
        vim.diagnostic.open_float(nil, { scope = "line" })
    end)
    buf_map(bufnr, "n", "<leader>ge", function()
        require("telescope.builtin").diagnostics { bufnr = 0 }
    end)

    -- hover
    buf_map(bufnr, "n", "K", vim.lsp.buf.hover)

    -- code actions
    buf_map(bufnr, "n", "<leader>la", require("telescope.builtin").lsp_code_actions)

    -- signature help
    buf_map(bufnr, "n", "<C-f>", require("lsp_signature").signature)

    -- lsp workspace
    buf_map(bufnr, "n", "<leader>wd", require("telescope.builtin").diagnostics)
    buf_map(bufnr, "n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
    buf_map(bufnr, "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)

    if client.name == "clangd" then
        buf_map(bufnr, "n", "<leader>lw", ":ClangdSwitchSourceHeader<cr>")
    end

    buf_map(bufnr, "n", "<leader>xf", vim.lsp.buf.formatting)
    buf_map(bufnr, "v", "<leader>xf", vim.lsp.buf.range_formatting)
end

return M
