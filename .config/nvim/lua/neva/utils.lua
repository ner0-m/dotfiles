local M = {}

function M.keymap(...)
    vim.api.nvim_set_keymap(...)
end
 
function M.nmap(...)
    vim.api.nvim_set_keymap("n", ...)
end
 
function M.imap(...)
    vim.api.nvim_set_keymap("i", ...)
end
 
return M
