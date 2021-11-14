local M = {}

local builtin = require "telescope.builtin"
local themes = require "telescope.themes"

local minimal_dropdown_opts = themes.get_dropdown {
    previewer = false,
    shorten_path = false,

    layout_config = {
        width = 0.5,
    },
}

M.find_files = builtin.find_files

M.quick_find_files = function()
    builtin.find_files(minimal_dropdown_opts)
end

M.find_test_files = function()
    require("telescope.builtin").find_files {
        find_command = { "fd", "-t", "f", "-E=.git", "-E=build/", "--no-ignore", "test_" },
    }
end

M.find_cmake_files = function()
    require("telescope.builtin").find_files {
        find_command = { "fd", ".cmake$|CMakeLists.txt", "-E=build/", "--no-ignore" },
    }
end

M.fuzzy_search_cur_buf = function()
    local opts = themes.get_dropdown {
        previewer = false,
        layout_config = {
            height = 0.9,
            width = 0.8,
        },
    }
    builtin.current_buffer_fuzzy_find(opts)
end

function M.grep_prompt()
    builtin.grep_string {
        search = vim.fn.input "Grep String > ",
    }
end

-- LSP stuff

M.code_actions = function()
    local opts = themes.get_cursor{} 
    builtin.lsp_code_actions(opts)
end

return M
