set completeopt=menu,menuone,noselect

lua << EOF
require'compe'.setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    allow_prefix_unmatch = false,
    source = {
        buffer = { priority = 10 },
        vsnip = { priority = 100 } ,
        nvim_lsp = { priority = 1000},
        spell = { priority = 5 },
        treesitter = true,
        path = true,
        calc = true,
        nvim_lua = false,
        tags = false
    }
})
EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

