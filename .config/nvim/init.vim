" Plugins 
call plug#begin('~/.config/nvim/bundle')

" Navigation plugins{{{
" Search
Plug 'kevinhwang91/nvim-hlslens'

" Move forward and backward in line
Plug 'unblevable/quick-scope'

" Dependency for gitsigns 
Plug 'nvim-lua/plenary.nvim' 
 
" Git plugin
Plug 'lewis6991/gitsigns.nvim' 

"}}}

" Misc {{{
Plug 'liuchengxu/vim-which-key'

" Autocorrection plugin
Plug 'sedm0784/vim-you-autocorrect' 
" }}}

" Editing  related plugins {{{

" Highlight word under cursor
Plug 'RRethy/vim-illuminate'

" nerd commenter
Plug 'b3nj5m1n/kommentary'

" Move lines up and down
Plug 't9md/vim-textmanip'

" Surround words with parenthesis
Plug 'machakann/vim-sandwich'

" Give new text objects to work with
Plug 'wellle/targets.vim'

" Generate doxygen documentation
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
"}}}

" Color plugins {{{
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'christianchiarulli/nvcode-color-schemes.vim'

Plug 'folke/tokyonight.nvim'
"}}}

" Viewing and apperance {{{
Plug 'mhinz/vim-startify'

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
" }}}

" Fuzzy finder {{{

" fuzzy file, buffer etc. finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Fuzzy finding for lsp
Plug 'gfanto/fzf-lsp.nvim'
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

" Statusline {{{
lua require("statusline")
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

source ~/.config/nvim/config/plugins/vim-which-key.vim
source ~/.config/nvim/config/plugins/vim-startify.vim
source ~/.config/nvim/config/plugins/vim-vsnip.vim
source ~/.config/nvim/config/plugins/nvim-hlslens.vim
source ~/.config/nvim/config/plugins/vim-textmanip.vim
source ~/.config/nvim/config/plugins/fzf.vim
source ~/.config/nvim/config/plugins/indentLine.vim
source ~/.config/nvim/config/plugins/vim-easymotion.vim
source ~/.config/nvim/config/plugins/vim-better-whitespace.vim
source ~/.config/nvim/config/plugins/lsp-diagnostics.vim
source ~/.config/nvim/config/plugins/barbar.vim
source ~/.config/nvim/config/plugins/nvim-compe.vim

lua require("format-nvim")
lua require("treesitter-config")
lua require("lspsetup")
lua require("mykommentary")
lua require("scroll")
lua require("git")

" shortcuts for autoformatting the entire file: Ctrl+f
autocmd FileType * nnoremap <buffer><leader>f <Esc>:Format<CR>
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

let g:Illuminate_delay = 500

nnoremap <leader>ss :ClangdSwitchSourceHeader<CR>

let g:sneak#label = 1
