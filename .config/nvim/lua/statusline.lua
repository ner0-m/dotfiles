function LspStatus()
   if #vim.lsp.buf_get_clients() < 1 then return "" end
   return require("lsp-status").status()
end

require('lualine').setup{
    options = {
        theme = 'tokyonight',
        section_separators = {'', ''},
        component_separators = {'', ''},
        icons_enabled = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{'branch', icon = ''}},
        lualine_c = {{'filename', file_status = true}, 'LspStatus()'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = { 'fzf' },
}
