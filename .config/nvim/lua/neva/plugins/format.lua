clangformat = function(file)
    return string.format("clang-format-10 -i -style=file %s", file)
end

require("format").setup {
    ["*"] = {
        { cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
    },
    cmake = { { cmd = { "cmake-format -i" } } },
    vim = {
        {
            cmd = {
                -- "stylua --indent-type Spaces --column-width 100 --line-endings Unix --indent-width 4",
                "stylua",
            },
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$",
        },
    },
    lua = {
        {
            cmd = {
                -- "stylua --indent-type Spaces --column-width 100 --line-endings Unix --indent-width 4",
                "stylua",
            },
        },
    },
    python = { { cmd = { "yapf -i" } } },
    cpp = { { cmd = { clangformat } } },
    cuda = { { cmd = { clangformat } } },
}
