-- require("pluins.load")

-- require("plugins.mykommentary")
-- require("plugins.scroll")
-- require("plugins.neorg")
-- require("plugins.surround")
-- require("plugins.lightspeed")
require("plugins.luasnip")
require("plugins.treesitter-config")
require("plugins.format-nvim")
require("plugins.git")
require("plugins.todo")
require("plugins.telescope-setup")
require("plugins.nvim-cmp")
require("plugins.hlslens")
require("plugins.barbar")

--[[ require("indent_blankline").setup {
    char = "¦",
    buftype_exclude = {"terminal"}
} ]]
--[[ require("indent_blankline").setup({
	buftype_exclude = { "terminal" },
}) ]]

-- require("symbols-outline").setup()

vim.g.symbols_outline = {
	auto_preview = false,
}
