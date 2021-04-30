-- require("statusline.spaceline")
-- require("statusline.myline")
require('lualine').setup{
    options = {
    theme = 'tokyonight',
    extensions = { 'fzf' }
  }
}
