require "neva.lsp.on_attach"
require "neva.lsp.diagnostics"
require "neva.lsp.config"

vim.api.nvim_set_keymap("n", "<leader>ss", ":ClangdSwitchSourceHeader<cr>", { noremap = true })

-- I really hope that I can get something working when
-- https://reviews.llvm.org/D102148 is merged in to trunk of LLVM
-- Also keep an eye on https://github.com/clangd/clangd/issues/313
-- That would be super awesome
-- These specific inlay hints, are not can't be implemented the way
-- I want it, until https://github.com/neovim/neovim/pull/9496
-- is merged and it doesn't look like people are working on it rn

---[[
local M = {}
local inlay_hints = require "neva.lsp.inlayHints"

M.inlay_hints = function(opts)
    vim.lsp.buf_request(0, "clangd/inlayHints", inlay_hints.get_params(), inlay_hints.get_callback(opts))
end

return M
--]]
