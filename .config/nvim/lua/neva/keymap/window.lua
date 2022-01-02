local bind = require "keymap.bind"
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

local window_plug_map = {
    -- ["n|<leader>cd"] = map_cr('TroubleToggle lsp_document_diagnostics'):with_noremap():with_silent(),
     
}

return window_plug_map
