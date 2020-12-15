require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {                    -- Highlight module
        enable = true,               -- false will disable the whole extension
        use_languagetree = true,     -- Use this to enable language injection (this is very unstable)
        disable = { },               -- list of language that will be disabled
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-m>",
            node_decremental = "<C-r>",
        },

    },
}

