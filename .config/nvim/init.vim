" Plugins
call plug#begin('~/.config/nvim/bundle')
" Navigation plugins{{{
" Search
Plug 'kevinhwang91/nvim-hlslens'

" Dependency for gitsigns
Plug 'nvim-lua/plenary.nvim'

" Git plugin
Plug 'lewis6991/gitsigns.nvim'

"}}}

" Misc {{{
" Plug 'liuchengxu/vim-which-key'

" Autocorrection plugin
Plug 'sedm0784/vim-you-autocorrect'

" Note taking plugin
Plug 'vhyrro/neorg'
" }}}

" Editing  related plugins {{{

" Highlight word under cursor
Plug 'RRethy/vim-illuminate'

" nerd commenter
Plug 'b3nj5m1n/kommentary'

" Todo plugin
Plug 'folke/todo-comments.nvim'

" " Surround words with parenthesis
Plug 'machakann/vim-sandwich'

" Give new text objects to work with
Plug 'wellle/targets.vim'

" TODO: Trying this new motion plugin
Plug 'ggandor/lightspeed.nvim'

" Tree sitter!
Plug 'nvim-treesitter/nvim-treesitter'
"}}}


" Viewing and apperance {{{
" Color plugins {{{
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'folke/tokyonight.nvim'
"}}}

" Smooth scrolling
Plug 'karb94/neoscroll.nvim'

" Show thin lines indicating indentation
Plug 'Yggdroot/indentLine'

" Devicons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Statusline plugin
Plug 'hoob3rt/lualine.nvim'

" Tabline plugin
Plug 'romgrk/barbar.nvim'

" Code outline window TODO: start using it actually, else remove it or use telescope
Plug 'simrat39/symbols-outline.nvim'

" Game to practice
Plug 'ThePrimeagen/vim-be-good'
" }}}


Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim' " Depends on popup.nvim and plenary.nvim
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" }}}

" Coding plugins {{{
" CMake pluging
Plug 'jansenm/vim-cmake'

" Snippet stuff
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Formatting for most languages
Plug 'lukas-reineke/format.nvim'
" }}}

" Neovim LSP {{{
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'

" Plugin for vscode like pcitrograms
Plug 'onsails/lspkind-nvim'

" Autocompletion framework for built-in LSP
Plug 'hrsh7th/nvim-compe'

" Show signature while typing
Plug 'ray-x/lsp_signature.nvim'
"}}}

call plug#end()


" Keybindings {{{
source ~/.config/nvim/config/keybindings.vim
" }}} Keybindings

" Settings {{{
source ~/.config/nvim/config/general.vim
" }}}

" Colors {{{
source ~/.config/nvim/config/colors.vim
" }}}

" }}}

" TODO Move to config folder
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

set conceallevel=1
set concealcursor=nv
let g:indentLine_concealcursor = 'nv'
let g:indentLine_conceallevel = 1

" Pluging configuration and key bindings {{{

" source ~/.config/nvim/config/plugins/vim-which-key.vim
source ~/.config/nvim/config/plugins/vim-vsnip.vim
source ~/.config/nvim/config/plugins/vim-sandwich.vim
source ~/.config/nvim/config/plugins/lightspeed.vim
source ~/.config/nvim/config/plugins/nvim-hlslens.vim
source ~/.config/nvim/config/plugins/indentLine.vim
source ~/.config/nvim/config/plugins/lsp-diagnostics.vim
source ~/.config/nvim/config/plugins/barbar.vim
source ~/.config/nvim/config/plugins/nvim-compe.vim
source ~/.config/nvim/config/plugins/vim-you-autocorrect.vim
source ~/.config/nvim/config/plugins/symbols-outline.vim
source ~/.config/nvim/config/plugins/illuminate.vim

lua require("statusline")
lua require("plugins")
lua require("lspsetup")

" shortcuts for autoformatting the entire file: Ctrl+f
autocmd FileType * nnoremap <buffer><leader>xf <Esc>:Format<CR>
autocmd FileType * nnoremap <buffer><leader>xF <Esc>:FormatWrite<CR>
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

autocmd CursorHold,CursorHoldI *.cpp :lua require'lspsetup'.inlay_hints{ only_current_line = true }
autocmd CursorHold,CursorHoldI *.h :lua require'lspsetup'.inlay_hints{ only_current_line = true }
