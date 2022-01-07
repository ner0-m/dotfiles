local M = {}

function M.merge(...)
    return vim.tbl_deep_extend("force", ...)
end

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = M.merge(options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.buf_map(bufnr, mode, lhs, rhs, opts)
    local options = { buffer = bufnr, noremap = true, silent = true }
    if opts then
        options = M.merge(options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.imap(lhs, rhs, opts)
    M.map("i", lhs, rhs, opts)
end

function M.nmap(lhs, rhs, opts)
    M.map("n", lhs, rhs, opts)
end

return M
