local function prequire(...)
    local status, lib = pcall(require, ...)
    if status then
        return lib
    end
    return nil
end

local luasnip = prequire "luasnip"
local types = require "luasnip.util.types"

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    -- ext_opts = {
    --     [types.choiceNode] = {
    --         active = {
    --             virt_text = { { "●", "GruvboxOrange" } },
    --         },
    --     },
    --     [types.insertNode] = {
    --         active = {
    --             virt_text = { { "●", "GruvboxBlue" } },
    --         },
    --     },
    -- },
    -- ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype
}

-- TODO: These mabe should be different, idc yet
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

luasnip.snippets = require "neva.plugins.luasnip.snippets"
