local snap = require'snap'

local fzf = snap.get'consumer.fzf'
local vimgrep = snap.get'producer.ripgrep.vimgrep'

snap.maps {
    {"<C-p>", snap.config.file { producer = "ripgrep.file" } },
    {"<leader>sg", snap.config.file { producer = "git.file" } },
    {"<leader>sb", snap.config.file { producer = "vim.buffer" } },
    {"<leader>so", snap.config.file { producer = "vim.oldfile" } },
    {"<leader>s/", snap.config.vimgrep {}},
}

snap.register.map({'n'}, {'<leader>sh'}, function()
    snap.run {
        prompt = "Help>",
        producer = fzf(snap.get'producer.vim.help'),
        select = snap.get'select.help'.select,
        views = {snap.get'preview.help'},
    }
end)
