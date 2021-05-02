require('lspsetup.on_attach')
require('lspsetup.diagnostics')
require('lspsetup.config')

require('lspkind').init({})

local util = require 'lspconfig/util'
function _G.ClangdSymboldInfo(bufnr)
    bufnr = util.validate_bufnr(bufnr)
    local params = { vim.lsp.util.make_position_params() }
    map = vim.lsp.buf_request_sync(bufnr, 'textDocument/symbolInfo', vim.lsp.util.make_position_params())
    print(vim.inspect(map)) 
    print(map["result"]) 
    print(map.containerName) 
end
