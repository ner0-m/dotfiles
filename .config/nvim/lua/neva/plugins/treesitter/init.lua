local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main",
    },
}

require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = { -- Highlight module
        enable = true, -- false will disable the whole extension
        use_languagetree = true, -- Use this to enable language injection (this is very unstable)
        disable = {}, -- list of language that will be disabled
    },
    indent = {
        enable = false,
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
    playground = {
        enable = true,
        disable = {},
        keymaps = {
            open = "gtd", -- Opens the playground for current buffer (if applicable)
        },
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    },
}
