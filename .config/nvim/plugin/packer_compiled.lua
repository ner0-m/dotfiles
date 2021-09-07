-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/david/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/david/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/david/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/david/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/david/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/cmp-spell"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["format.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/format.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nj\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\0\0\1\2\0\0\rterminal\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n–\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2\31single_line_comment_string\a// prefer_single_line_comments\2\bcpp\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27highlight_unique_chars\2\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nv\0\0\3\0\a\0\0156\0\0\0009\0\1\0009\0\2\0B\0\1\2\21\0\0\0)\1\1\0\1\0\1\0X\0\2€'\0\3\0L\0\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0D\0\1\0\vstatus\15lsp-status\frequire\5\20buf_get_clients\blsp\bvimç\4\1\0\6\0!\00013\0\0\0007\0\1\0006\0\2\0'\2\3\0B\0\2\0029\0\4\0005\2\n\0005\3\5\0005\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0034\4\3\0005\5\15\0>\5\1\4=\4\16\0035\4\18\0005\5\17\0>\5\1\4=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3=\3\26\0025\3\27\0004\4\0\0=\4\14\0034\4\0\0=\4\16\0035\4\28\0=\4\19\0035\4\29\0=\4\21\0034\4\0\0=\4\23\0034\4\0\0=\4\25\3=\3\30\0025\3\31\0=\3 \2B\0\2\1K\0\1\0\15extensions\1\2\0\0\bfzf\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\3\0\0\0\16LspStatus()\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\bî‚ \14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\3\0\0\bî‚±\bî‚³\23section_separators\1\3\0\0\bî‚°\bî‚²\1\0\2\ntheme\15tokyonight\18icons_enabled\2\nsetup\flualine\frequire\14LspStatus\0\0" },
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n¡\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\0035\4\r\0005\5\f\0=\5\n\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\tload\1\0\0\18core.keybinds\1\0\0\1\0\2\22default_keybindgs\2\16norg_leader\r<leader>\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nÀ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\4\22respect_scrolloff\1\rstop_eof\2\16hide_cursor\2\25cursor_scrolls_alone\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vprefix\6c\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-you-autocorrect"] = {
    loaded = true,
    path = "/home/david/.local/share/nvim/site/pack/packer/start/vim-you-autocorrect"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nj\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\0\0\1\2\0\0\rterminal\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n¡\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\0035\4\r\0005\5\f\0=\5\n\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\tload\1\0\0\18core.keybinds\1\0\0\1\0\2\22default_keybindgs\2\16norg_leader\r<leader>\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vprefix\6c\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n–\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2\31single_line_comment_string\a// prefer_single_line_comments\2\bcpp\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nv\0\0\3\0\a\0\0156\0\0\0009\0\1\0009\0\2\0B\0\1\2\21\0\0\0)\1\1\0\1\0\1\0X\0\2€'\0\3\0L\0\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0D\0\1\0\vstatus\15lsp-status\frequire\5\20buf_get_clients\blsp\bvimç\4\1\0\6\0!\00013\0\0\0007\0\1\0006\0\2\0'\2\3\0B\0\2\0029\0\4\0005\2\n\0005\3\5\0005\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0034\4\3\0005\5\15\0>\5\1\4=\4\16\0035\4\18\0005\5\17\0>\5\1\4=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3=\3\26\0025\3\27\0004\4\0\0=\4\14\0034\4\0\0=\4\16\0035\4\28\0=\4\19\0035\4\29\0=\4\21\0034\4\0\0=\4\23\0034\4\0\0=\4\25\3=\3\30\0025\3\31\0=\3 \2B\0\2\1K\0\1\0\15extensions\1\2\0\0\bfzf\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\3\0\0\0\16LspStatus()\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\bî‚ \14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\3\0\0\bî‚±\bî‚³\23section_separators\1\3\0\0\bî‚°\bî‚²\1\0\2\ntheme\15tokyonight\18icons_enabled\2\nsetup\flualine\frequire\14LspStatus\0\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nÀ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\4\22respect_scrolloff\1\rstop_eof\2\16hide_cursor\2\25cursor_scrolls_alone\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27highlight_unique_chars\2\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
