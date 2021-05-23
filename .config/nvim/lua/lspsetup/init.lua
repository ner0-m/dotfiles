require('lspsetup.on_attach')
require('lspsetup.diagnostics')
require('lspsetup.config')

require('lspkind').init({})

-- I really hope that I can get something working when
-- https://reviews.llvm.org/D102148 is merged in to trunk of LLVM
-- That would be super awesome
-- These specific inlay hints, are not can't be implemented the way
-- I want it, until https://github.com/neovim/neovim/pull/9496
-- is merged and it doesn't look like people are working on it rn

--[[
local M = {}
local inlay_hints = require('lspsetup.inlayHints')

M.inlay_hints = function(opts)
    print("Setting up inlay_hints")
    vim.lsp.buf_request(0, 'clangd/inlayHints', inlay_hints.get_params(), inlay_hints.get_callback(opts))
end

return M
]]
