local defaults = require "neva.lsp.providers.default"
local servers = require("neva.config").lsp.servers
local utils = require "neva.utils"

for server_name, _ in pairs(servers) do
    local server_config = utils.merge(defaults, require("neva.lsp.providers." .. server_name))
    local server = require("lspconfig")[server_name]
    server.setup(server_config)
end
