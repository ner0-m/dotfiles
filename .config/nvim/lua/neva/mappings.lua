 
local function map(...)
    vim.api.nvim_set_keymap(...)
end
 
local function map(keybind, command, opts)
    vim.api.nvim_set_keymap("n", keybind, command, opts)
end
