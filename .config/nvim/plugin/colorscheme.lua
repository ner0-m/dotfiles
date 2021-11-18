if vim.fn.has "termguicolors" == 1 then
    vim.opt.termguicolors = true
end

-- Set tokyonight colorscheme
vim.g.tokyonight_style = "night"
vim.cmd [[colorscheme tokyonight]]

-- Unset the spelling as it's read in tokyonight and that just looks aweful
vim.cmd [[hi clear SpellBad]]
vim.cmd [[hi SpellBad gui=underline]]

-- I have to set the color column differently, as else I can't see it
local config = require "tokyonight.config"
local c = require("tokyonight.colors").setup(config)

vim.cmd("hi ColorColumn guibg=" .. tostring(c.bg_highlight))
