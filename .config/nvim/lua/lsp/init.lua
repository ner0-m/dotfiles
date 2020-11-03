local lsp_status = require('lsp-status')
local diagnostic = require('diagnostic')
local completion = require('completion')
local nvim_lsp = require('nvim_lsp')
local configs = require('nvim_lsp/configs')
local util = require('nvim_lsp/util')

-- Symbols that are shown in statusline 
lsp_status.config({
    status_symbol = '',
    indicator_errors = '✖',
    indicator_warnings = '⚠',
    indicator_info = '🛈',
    indicator_hint = '➤',
    indicator_ok = '✔️',
    spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})
 
lsp_status.register_progress()
 
local on_attach = function(client, bufnr)
     
    lsp_status.on_attach(client, bufnr)
    diagnostic.on_attach(client, bufnr)
     
    completion.on_attach(client, bufnr, {
        sorter = 'alphabet',
        matcher = {'exact', 'fuzzy'}
    })

    -- Keybindings for LSPs
    -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
    -- vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    -- vim.fn.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    -- vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
    -- vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
    -- vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    -- vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    -- vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
    -- vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
end

local servers = {
    {
        name = 'clangd',
        root_dir = nvim_lsp.util.root_pattern('compile_commands.json', 'build/compile_commands.json', '.git'),
        init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = true
        },
        callbacks = lsp_status.extensions.clangd.setup()
    },
    {
        name = 'cmake'
    }
}
 
for _, lsp in ipairs(servers) do
  if lsp.config then
    lsp.config.on_attach = on_attach
  else
    lsp.config = {
      on_attach = on_attach
    }
  end

  nvim_lsp[lsp.name].setup(lsp.config)
end
