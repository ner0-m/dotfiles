local actions = require "telescope.actions"

require("telescope").setup {
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
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

        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
}

require("telescope").load_extension "fzy_native"
-- require("telescope").load_extension("git_worktree")
-- require("telescope").load_extension("packer")

local opts = { noremap = true }
local function map(...)
    vim.api.nvim_set_keymap(...)
end

-- File pickers
map("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)

-- File picker with only test files
map(
    "n",
    "<leader>ft",
    '<cmd>lua require("telescope.builtin").find_files({find_command = {"fd", "-t", "f", "-E=.git", "-E=build/", "--no-ignore", "test_"}})<cr>',
    opts
)

-- Pick only CMake files
map(
    "n",
    "<leader>fm",
    '<cmd>lua require(\'telescope.builtin\').find_files({find_command = {"fd", ".cmake$|CMakeLists.txt", "-E=build/", "--no-ignore"}})<cr>',
    opts
)

-- Search cwd with rg
map("n", "<leader>f/", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- Search word under cursor in cwd
map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
-- Search in file with rb
map("n", "<leader>fi", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>", opts)
-- Search quickfixlist
map("n", "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", opts)

-- Vim pickers
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map("n", "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
map("n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>", opts)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
map("n", "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", opts)
map("n", "<leader><leader>fc", "<cmd>lua require('telescope.builtin').command_history()<cr>", opts)
map("n", "<leader><leader>fs", "<cmd>lua require('telescope.builtin').search_history()<cr>", opts)

-- LSP pickers
map("n", "<leader>lgr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
map("n", "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
map("n", "<leader>lS", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", opts)
map("n", "<leader>la", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", opts)
map("n", "<leader>lgi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
map("n", "<leader>lgd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
map("n", "<leader>ldw", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", opts)
map("n", "<leader>ldd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", opts)

-- Git pickers
map("n", "<leader>gc", '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
map("n", "<leader>gb", '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)
map("n", "<leader>gcb", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', opts)
map("n", "<leader>gst", '<cmd>lua require("telescope.builtin").git_status()<cr>', opts)

-- List pickers
map("n", "<leader>fbi", '<cmd>lua require("telescope.builtin").builtin()<cr>', opts)

-- Find files in Neovim config
map(
    "n",
    "<leader>fn",
    '<cmd>lua require("telescope.builtin").find_files({cwd="~/.config/nvim", file_ignore_patterns={"bundle"}})<cr>',
    opts
)

-- git-worktree mappings for telescope
map("n", "<leader>gw", '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>', opts)

map("n", "<leader>gwc", '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>', opts)
