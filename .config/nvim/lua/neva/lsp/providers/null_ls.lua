local null_ls = require "null-ls"

require("null-ls").setup {
    sources = {
        -- Formatters
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.codespell,

        -- Diagnostics
        null_ls.builtins.diagnostics.misspell,
        null_ls.builtins.diagnostics.codespell,

        -- Code actions
        null_ls.builtins.code_actions.gitsigns,
    },
}
