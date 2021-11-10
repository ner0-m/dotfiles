-- taken from https://gitlab.com/SanchayanMaity/dotfiles/-/blob/master/nvim/.config/nvim/lua/lsp.lua
function preview_location(location, context, before_context)
     
     
     
     
    -- location may be LocationLink or Location (more useful for the former)
    context = context or 10
    before_context = before_context or 5
    local uri = location.targetUri or location.uri
    if uri == nil then
        return
    end
    local bufnr = vim.uri_to_bufnr(uri)
    if not vim.api.nvim_buf_is_loaded(bufnr) then
        vim.fn.bufload(bufnr)
    end
    local range = location.targetRange or location.range
    local contents = vim.api.nvim_buf_get_lines(
        bufnr,
        range.start.line - before_context,
        range["end"].line + 1 + context,
        false
    )
    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
    return vim.lsp.util.open_floating_preview(contents, filetype)
end

function preview_location_callback(_, method, result)
    local context = 10
    if result == nil or vim.tbl_isempty(result) then
        print("No location found: " .. method)
        return nil
    end
    if vim.tbl_islist(result) then
        floating_buf, floating_win = preview_location(result[1], context)
    else
        floating_buf, floating_win = preview_location(result, context)
    end
end

function peek_definition()
    if vim.tbl_contains(vim.api.nvim_list_wins(), floating_win) then
        vim.api.nvim_set_current_win(floating_win)
    else
        local params = vim.lsp.util.make_position_params()
        return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
    end
end

local M = {}

-- on_attack for completion
M.on_attach_vim = function(client, bufnr)
    -- short cuts
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    require("lsp_signature").on_attach()

    -- Attach cursor under word highlight
    require("illuminate").on_attach(client)

    -- reset colors as they are overritten somewher
    vim.api.nvim_command [[ hi LspReferenceText cterm=standout gui=standout ]]
    vim.api.nvim_command [[ hi LspReferenceRead cterm=standout gui=standout ]]
    vim.api.nvim_command [[ hi LspReferenceWrite cterm=standout gui=standout ]]

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- taken from https://gitlab.com/SanchayanMaity/dotfiles/-/blob/master/nvim/.config/nvim/lua/lsp.lua
    local opts = { noremap = true, silent = true }

    -- LSP keybindings
    buf_set_keymap("n", "<leader>lgt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<leader>lgD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

    buf_set_keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "<leader>lH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<leader>lp", "<cmd>lua peek_definition()<CR>", opts)
    buf_set_keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    buf_set_keymap("n", "<leader>ldl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "<leader>ldn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>ldN", "<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>", opts)
    buf_set_keymap("n", "<leader>ldp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<leader>ldP", "<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>", opts)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]],
            false
        )
    end
end

return M
