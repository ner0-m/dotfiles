require("neva.plugins")
require("neva.build")

P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

prequire = function(module, verbose)
    local present, value = pcall(require, module)
    if present then
        return value
    else
        print("Could not load " .. module)
        if verbose then
            print("Error: " .. value)
        end
    end
end

dbg = function(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
    return ...
end

float_file = function(filepath)
    local lines_cat = vim.api.nvim_exec("!cat " .. filepath, true)
    local lines_lua = {}
    for line in string.gmatch(lines_cat, "[^\n]+") do
        table.insert(lines_lua, line)
    end
    table.remove(lines_lua, 1)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines_lua)
    local width = vim.api.nvim_win_get_width(0)
    local height = vim.api.nvim_win_get_height(0)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "win",
        win = 0,
        width = math.floor(width * 0.8),
        height = math.floor(height * 0.8),
        col = math.floor(width * 0.1),
        row = math.floor(height * 0.1),
        border = "single",
        style = "minimal",
    })
    vim.api.nvim_win_set_option(win, "winblend", 20)
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
end
