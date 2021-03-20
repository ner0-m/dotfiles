-- taken from https://gitlab.com/SanchayanMaity/dotfiles/-/blob/master/nvim/.config/nvim/lua/lsp.lua
function preview_location(location, context, before_context)
    -- location may be LocationLink or Location (more useful for the former)
    context = context or 10
    before_context = before_context or 5
    local uri = location.targetUri or location.uri
    if uri == nil then return end
    local bufnr = vim.uri_to_bufnr(uri)
    if not vim.api.nvim_buf_is_loaded(bufnr) then vim.fn.bufload(bufnr) end
    local range = location.targetRange or location.range
    local contents = vim.api.nvim_buf_get_lines(bufnr, range.start.line -
                                                    before_context,
                                                range["end"].line + 1 + context,
                                                false)
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
        return vim.lsp.buf_request(0, "textDocument/definition", params,
                                   preview_location_callback)
    end
end

local function echo(hlgroup, msg)
    vim.cmd(string.format('echohl %s', hlgroup))
    vim.cmd(string.format('echo "[lspfuzzy] %s"', msg))
    vim.cmd('echohl None')
end


vim.lsp.handlers['textDocument/hover'] = function(_, method, result)
  vim.lsp.util.focusable_float(method, function()
    if not (result and result.contents) then
      -- return { 'No information available' }
      return
    end
    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      -- return { 'No information available' }
      return
    end
    local bufnr, winnr = vim.lsp.util.fancy_floating_markdown(markdown_lines, {
      pad_left = 1; pad_right = 1;
    })
    vim.lsp.util.close_preview_autocmd({"CursorMoved", "BufHidden"}, winnr)
    return bufnr, winnr
  end)
end

local M = {}

-- on_attack for completion
M.on_attach_vim = function(client, bufnr)
    print("Attaching client with personal on_attach")
    require'lsp_signature'.on_attach()

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- taken from https://gitlab.com/SanchayanMaity/dotfiles/-/blob/master/nvim/.config/nvim/lua/lsp.lua
    local opts = {noremap = true, silent = true}

    ---[[ With fzf-lsp, this is possible
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', ':Definitions<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgD', ':Declarations<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgi', ':Implementations<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgt', ':TypeDefinitions<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', ':References<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', ':DocumentSymbols<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lS', ':WorkspaceSymbols<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', ':CodeActions<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lA', ':RangeCodeActions<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldd', ':Diagnostics<CR>', opts)
    --]]

    --[[ Else we can use this again
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lS', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    --]]

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lh',
                                '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lH',
                                '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                                opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lp',
                                '<cmd>lua peek_definition()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lR',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldl',
                                '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldn',
                                '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldN',
                                '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldp',
                                '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldP',
                                '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>',
                                opts)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
            hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
            hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

-- Maybe replace the default handler below with this
lsp_workspace_symbols = function()
    local input = vim.fn.input('Query: ')
    vim.api.nvim_command('normal :esc<CR>')
    if not input or #input == 0 then return end
    require'fzf_lsp'.workspace_symbol_call { query = input }
end

vim.lsp.handlers["textDocument/codeAction"] = require'fzf_lsp'.code_action_handler
vim.lsp.handlers["textDocument/definition"] = require'fzf_lsp'.definition_handler
vim.lsp.handlers["textDocument/declaration"] = require'fzf_lsp'.declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require'fzf_lsp'.type_definition_handler
vim.lsp.handlers["textDocument/implementation"] = require'fzf_lsp'.implementation_handler
vim.lsp.handlers["textDocument/references"] = require'fzf_lsp'.references_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require'fzf_lsp'.document_symbol_handler
vim.lsp.handlers["workspace/symbol"] = require'fzf_lsp'.workspace_symbol_handler
vim.lsp.handlers["callHierarchy/incomingCalls"] = require'fzf_lsp'.incoming_calls_handler
vim.lsp.handlers["callHierarchy/outgoingCalls"] = require'fzf_lsp'.outgoing_calls_handler

return M

