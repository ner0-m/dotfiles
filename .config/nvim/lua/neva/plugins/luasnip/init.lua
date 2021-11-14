local function prequire(...)
    local status, lib = pcall(require, ...)
    if status then
        return lib
    end
    return nil
end

local luasnip = prequire "luasnip"

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}

luasnip.snippets = require "neva.plugins.luasnip.snippets"
