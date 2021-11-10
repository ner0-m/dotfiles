if vim.g["g:loaded_nvim_hlslens"] then
    return
end

vim.g["loaded_nvim_hlslens"] = 1

require("hlslens").setup()

local map = require("neva.utils").nmap

local opts = { noremap = true, silent = true }

-- remap search commands 
map("n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", opts)
map("N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", opts)
map("*", "*<Cmd>lua require('hlslens').start()<CR>", opts)
map("#", "#<Cmd>lua require('hlslens').start()<CR>", opts)
map("g*", "g*<Cmd>lua require('hlslens').start()<CR>", opts)
map("g#", "g#<Cmd>lua require('hlslens').start()<CR>", opts)

vim.cmd [[nnoremap <silent> <leader>h :noh<CR>]]
