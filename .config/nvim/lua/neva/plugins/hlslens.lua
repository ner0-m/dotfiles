if vim.g["g:loaded_nvim_hlslens"] then
    return
end

vim.g["loaded_nvim_hlslens"] = 1

require("hlslens").setup()

local map = require("utils").keymap

local opts = { noremap = true, silent = true }

map("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", opts)

map("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", opts)

map("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", opts)
map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", opts)
map("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", opts)
map("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", opts)

vim.cmd [[nnoremap <silent> <leader>h :noh<CR>]]
