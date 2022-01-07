vim.api.nvim_set_keymap("n", "<leader>xb", ":TexlabBuild<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xs", ":TexlabForward<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>xt", "lua vim.lsp.buf.formatting()<cr>", { noremap = true })

-- prefer latex over plaintex, so I don't have to do comments everywhere :^)
vim.g.tex_flavor = "latex"
