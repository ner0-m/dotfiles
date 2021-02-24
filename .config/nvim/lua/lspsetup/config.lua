-- setup lsp clangd from https://github.com/neovim/nvim-lspconfig#clangd
local on_attach = require("lspsetup.on_attach").on_attach_vim; 
 
require'lspconfig'.clangd.setup {
on_attach = on_attach,
    config = {
        cmd = {
            "clangd --background-index --clang-tidy --header-insertion=never --header-insertion-decorator --suggest-missing-includes"
        },
        filetypes = {"c", "cpp", "objc", "objcpp", "cu", "cuh", "cuda"}
    }
}
-- setup lsp for CMake
require'lspconfig'.cmake.setup {
    config = {filetypes = {"cmake", "CMakeLists.txt"}}
}
-- setup lsp for lua
require'lspconfig'.sumneko_lua.setup {
    cmd = {
        "/home/david/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server",
        "-E",
        "/home/david/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua"
    }
}

-- setup lsp for python https://jdhao.github.io/2019/11/20/neovim_builtin_lsp_hands_on/
require'lspconfig'.pyls.setup {on_attach = on_attach_vim}

