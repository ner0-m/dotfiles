local M = {}

local builtin = require "telescope.builtin"
local themes = require "telescope.themes"

local open_dir = function(config)
    local opt = require("telescope.themes").get_ivy(config)

    vim.tbl_deep_extend("force", opt, config)

    -- ONLY when it's specifically set to false (nil doesn't count)
    if config.previewer == false then
        print "Table has previewer"
        opt.previewer = false
    end

    builtin.find_files(opt)
end

M.find_files = function()
    open_dir { title = "Find files", path_display = { "shorten" } }
end

M.quick_find_files = function()
    open_dir { title = "Qucik file finder", previewer = false }
end

M.find_test_files = function()
    open_dir {
        title = "Find test files",
        find_command = { "fd", "-t", "f", "-E=.git", "-E=build/", "--no-ignore", "test_" },
    }
end

M.find_cmake_files = function()
    open_dir {
        title = "Find CMake files",
        find_command = { "fd", ".cmake$|CMakeLists.txt", "-E=build/", "--no-ignore" },
    }
end

M.fuzzy_search_cur_buf = function()
    local opts = themes.get_ivy {
        previewer = false,
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
    local opts = themes.get_cursor {}
    builtin.lsp_code_actions(opts)
end

return M
