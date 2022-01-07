return {
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
        capabilities = {
            offsetEncoding = { "utf-16" },
        },
}
