local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

local opts = {noremap = true}
local function map(...) vim.api.nvim_set_keymap(...) end

-- File pickers
map("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
map("n", "<leader>s/", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map("n", "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)

-- Vim pickers
map("n", "<leader>sb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map("n", "<leader>so", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
map("n", "<leader>sc", "<cmd>lua require('telescope.builtin').commands()<cr>", opts)
map("n", "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
map("n", "<leader>sk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", opts)
map("n", "<leader><leader>sc", "<cmd>lua require('telescope.builtin').command_history()<cr>", opts)
map("n", "<leader><leader>ss", "<cmd>lua require('telescope.builtin').search_history()<cr>", opts)

-- LSP pickers
map("n", "<leader>lgr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
map("n", "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_docment_symbols()<cr>", opts)
map("n", "<leader>lS", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", opts)
map("n", "<leader>la", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", opts)
map("n", "<leader>lgi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
map("n", "<leader>lgd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)

map("n", "<leader>ldw", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", opts)
map("n", "<leader>ldd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", opts)

-- Git pickers
map('n', '<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
map('n', '<leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)
map('n', '<leader>gcb', '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', opts)
map('n', '<leader>gst', '<cmd>lua require("telescope.builtin").git_status()<cr>', opts)

-- List pickers
map('n', '<leader>sb', '<cmd>lua require("telescope.builtin").builtin()<cr>', opts)
