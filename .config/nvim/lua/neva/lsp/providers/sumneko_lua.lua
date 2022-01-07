local root_pattern_fallback = function(...)
    local util = require "lspconfig.util"
    local root_pattern = util.root_pattern(...)
    return function(fname)
        local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
        return root_pattern(filename) or util.path.dirname(filename)
    end
end

root_pattern = require("lspconfig").util.root_pattern

-- Setup runtime path
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
table.insert(runtime_path, "/home/david/src/awesome/lib/?.lua")

local library = {
    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
    [vim.fn.expand "~/src/awesome/lib"] = true,
}

return {
    cmd = { "lua-language-server", "/usr/lib/lua-language-server/bin/Linux/main.lua", '--logpath="/home/david/log"' },
    root_dir = function(fname)
        local root_pattern = root_pattern_fallback("rc.lua", "stylua.toml", ".git")
        local root_dir = root_pattern(fname)

        if root_dir:match "awesome" then
            print "AWEESOME"
        end

        return root_dir
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" },
                disable = { "lowercase-global" },
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            -- According to https://github.com/sumneko/lua-language-server/issues/259#issuecomment-730141987
            -- This: "workspace.library determines which directories go back to collect extra Lua files,
            -- which are used to intelligently sense and share global variables."
            workspace = {
                library = library,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
