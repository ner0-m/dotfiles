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
                "stylua",
            },
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$",
        },
    },
    lua = {
        {
            cmd = {
                "stylua",
            },
        },
    },
    python = { { cmd = { "yapf -i" } } },
    cpp = { { cmd = { clangformat } } },
    cuda = { { cmd = { clangformat } } },
}

local opts = { noremap = true }

local function map(keybind, command)
    require("neva.utils").nmap(keybind, command, opts)
end

-- save file and format
map("<leader>xf", "<cmd>up<cr><cmd>FormatWrite<cr>")
map("<leader>xF", "<cmd>up<cr><cmd>Format<cr>")
