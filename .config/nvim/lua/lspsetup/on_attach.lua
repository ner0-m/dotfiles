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


--[[ vim.lsp.handlers['textDocument/hover'] = function(_, method, result)
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
end ]]

local M = {}

-- on_attack for completion
M.on_attach_vim = function(client, bufnr)
    -- print("Attaching client with personal on_attach")

    -- Setup nice function signature
    require'lsp_signature'.on_attach({
        bind = true,
        doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                       -- set to 0 if you DO NOT want any API comments be shown
                       -- This setting only take effect in insert mode, it does not affect signature help in normal
                       -- mode, 10 by default

        floating_window = true,  -- show hint in a floating window, set to false for virtual text only mode
        hint_enable = true,      -- virtual hint enable
        hint_prefix = "🐼 ",     -- Panda for parameter
        hint_scheme = "String",
        use_lspsaga = false,     -- set to true if you want to use lspsaga popup
        hi_parameter = "Search", -- how your parameter will be highlight
        max_height = 12,         -- max height of signature floating_window, if content is more than max_height, you can scroll down
                                 -- to view the hiding contents
        max_width = 120,         -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
            border = "shadow"    -- double, single, shadow, none
        },
        extra_trigger_chars = {"(", "," } -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        --[[ handler_opts = {
            border = "single"
        }, ]]

    })

    -- short cuts
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Attach cursor under word highlight
    require 'illuminate'.on_attach(client)

    -- reset colors as they are overritten somewher
    vim.api.nvim_command [[ hi LspReferenceText cterm=standout gui=standout ]]
    vim.api.nvim_command [[ hi LspReferenceRead cterm=standout gui=standout ]]
    vim.api.nvim_command [[ hi LspReferenceWrite cterm=standout gui=standout ]]

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- taken from https://gitlab.com/SanchayanMaity/dotfiles/-/blob/master/nvim/.config/nvim/lua/lsp.lua
    local opts = {noremap = true, silent = true}

    -- LSP keybindings
    buf_set_keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    buf_set_keymap('n', '<leader>lS', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

    buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>lH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>lp', '<cmd>lua peek_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    buf_set_keymap('n', '<leader>ldl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<leader>ldn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>ldN', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>', opts)
    buf_set_keymap('n', '<leader>ldp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>ldP', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>', opts)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
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

