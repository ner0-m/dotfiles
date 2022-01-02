vim.wo.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 10

local function bind_option(options)
    for k, v in pairs(options) do
        if v == true then
            vim.cmd("set " .. k)
        elseif v == false then
            vim.cmd("set no" .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end

local options = {
    expandtab = true,
    autoindent = true,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = -1,
}

bind_option(options)
