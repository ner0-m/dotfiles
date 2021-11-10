-- setup lsp clangd from https://github.com/neovim/nvim-lspconfig#clangd
local on_attach = require("neva.lsp.on_attach").on_attach_vim

--[[
require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed", -- find out if you prefer this or bundled
    };
    filetypes = {"c", "cpp", "objc", "objcpp", "cu", "cuh", "cuda"},
}
--]]

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Keep this around to experiment with nwer versions of clangd :^)
---[[
require("lspconfig").clangd.setup {
    on_attach = on_attach,
    cmd = {
        "/home/david/src/llvm-project/build/bin/clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--inlay-hints",
        "--cross-file-rename",
        "--log=verbose",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cu", "cuh", "cuda" },
    capabilities = capabilities,
}
--]]

-- setup lsp for CMake
require("lspconfig").cmake.setup {
    on_attach = on_attach,
    filetypes = { "cmake" },
    init_options = {
        buildDirectory = { "_build/release-clang" },
    },
    capabilities = capabilities,
}
-- setup lsp for lua
require("lspconfig").sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {
        "/home/david/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server",
        "-E",
        "/home/david/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua",
    },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" },
                disable = { "lowercase-global" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
            capabilities = capabilities,
        },
    },
}

-- setup lsp for python https://jdhao.github.io/2019/11/20/neovim_builtin_lsp_hands_on/
-- require'lspconfig'.pyls.setup {on_attach = on_attach_vim}

local util = require "lspconfig/util"
local root_pattern = util.root_pattern("main.tex", ".git")

-- setup lsp for latex
require("lspconfig").texlab.setup {
    on_attach = on_attach,
    cmd = { "texlab", "-vvvv" },
    root_dir = function(fname)
        local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
        return root_pattern(filename) or util.path.dirname(filename)
    end,
    settings = {
        bibtex = {
            formatting = {
                lineLength = 120,
            },
        },
        latex = {
            root_dir = ".",
            build = {
                args = {
                    "-pdf",
                    "-quiet",
                    "-interaction=nonstopmode",
                    "-shell-escape",
                    "-outdir=build",
                    "main",
                },
                -- args = {},
                executable = "make",
                onSave = false,
                outputDirectory = { "./build" },
            },
        },
        forwardSearch = {
            executable = "zathura",
            args = { "--synctex-forward", "%l:1:%f", "%p"},
            onSave = true,
        },
        lint = {
            onChange = true,
        },
    },
}
