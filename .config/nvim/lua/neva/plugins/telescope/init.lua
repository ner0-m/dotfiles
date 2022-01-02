local actions = require "telescope.actions"

require("telescope").setup {
    defaults = {
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        -- Move prompt to the top and best fitting entry is at the top
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
            },
        },

        scroll_strategy = "cycle",
        selection_strategy = "reset",

        path_display = { "shorten" },

        -- These just look nicer then >
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-y>"] = actions.select_default,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
}

require("telescope").load_extension "fzy_native"
require("telescope").load_extension("git_worktree")

local opts = { noremap = true }

local function map(keybind, command)
    vim.api.nvim_set_keymap("n", keybind, command, opts)
end

-- File pickers
map("<C-p>", "<cmd>lua require('neva.plugins.telescope.fns').quick_find_files()<cr>")
map("<leader>p", "<cmd>lua require('neva.plugins.telescope.fns').find_files()<cr>")

-- File picker with only test files
map("<leader>ft", "<cmd>lua require('neva.plugins.telescope.fns').find_test_files()<cr>")

-- Pick only CMake files
map("<leader>fm", "<cmd>lua require('neva.plugins.telescope.fns').find_cmake_files()<cr>")

-- Search cwd with rg
map("<leader>f/", "<cmd>lua require('telescope.builtin').live_grep()<cr>")

-- Search word under cursor in cwd
map("<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>")

-- Fuzzy find in current buffer
map("<leader>/", "<cmd>lua require('neva.plugins.telescope.fns').fuzzy_search_cur_buf()<cr>")

-- Search in file with rg
map("<leader>fi", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>")

-- Search quickfixlist
map("<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>")

map("<leader>fp", "<cmd>lua require('neva.plugins.telescope.fns').grep_prompt()<cr>")

-- Vim pickers
map("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
map("<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>")
map("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
map("<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
map("<leader><leader>fc", "<cmd>lua require('telescope.builtin').command_history()<cr>")
map("<leader><leader>fs", "<cmd>lua require('telescope.builtin').search_history()<cr>")

-- LSP pickers
map("<leader>lgr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
map("<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
map("<leader>lS", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>")
map("<leader>la", "<cmd>lua require('neva.plugins.telescope.fns').code_actions()<cr>")
map("<leader>lgi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
map("<leader>lgd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
map("<leader>ldw", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>")
map("<leader>ldd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>")

-- Git pickers
map("<leader>gc", '<cmd>lua require("telescope.builtin").git_commits()<cr>')
map("<leader>gb", '<cmd>lua require("telescope.builtin").git_branches()<cr>')
map("<leader>gcb", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>')
map("<leader>gst", '<cmd>lua require("telescope.builtin").git_status()<cr>')

-- List pickers
map("<leader>fbi", '<cmd>lua require("telescope.builtin").builtin()<cr>')

-- Find files in Neovim config
map(

    "<leader>fn",
    '<cmd>lua require("telescope.builtin").find_files({cwd="~/.config/nvim", file_ignore_patterns={"bundle"}})<cr>'
)

-- git-worktree mappings for telescope
map("<leader>gw", '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>')

map("<leader>gwc", '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>')
