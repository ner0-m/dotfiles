" Plugins {{{
call plug#begin('~/.config/nvim/bundle')

" Navigation plugins{{{

" switch from headers to source files
Plug 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp', 'objc'] }

" Move forward and backward in line
Plug 'unblevable/quick-scope'

" easy motion (currently trying quick-scope)
" Plug 'easymotion/vim-easymotion'

"}}}

" Misc {{{
Plug 'liuchengxu/vim-which-key'
" }}}

" Editing  related plugins {{{

" Show whitespaces in red, and add command to remove trailing
Plug 'ntpeters/vim-better-whitespace'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

" Move lines
Plug 't9md/vim-textmanip'

" Surround words with parenthesis
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'

" Tag side bar
Plug 'liuchengxu/vista.vim'

" Add targets TODO: tryout
Plug 'wellle/targets.vim'

"}}}

" Close buffer without the window
" Plug 'qpkorr/vim-bufkill'

" Color plugins {{{
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'romgrk/doom-one.vim'
Plug 'mhartington/oceanic-next'
"}}}

" Viewing and apperance {{{
" Start screen TODO tryout
Plug 'mhinz/vim-startify'

" Smooth scrolling TODO tryout
Plug 'psliwka/vim-smoothie'

" Show thin lines indicating indentation
Plug 'Yggdroot/indentLine'

" Devicons
Plug 'kyazdani42/nvim-web-devicons'

" Show git diff
" Plug 'airblave/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Switch tabline, as barbar sadly currently has many bugs for me
" Plug 'romgrk/barbar.nvim'
Plug 'pacha/vem-tabline'
" }}}

" Fuzzy finder {{{

" fuzzy file, buffer etc. finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Fuzzy finding for lsp
" Plug 'ojroques/nvim-lspfuzzy', {'branch': 'main'}
Plug 'gfanto/fzf-lsp.nvim'
" }}}

" Coding plugins {{{
" Clang format
Plug 'rhysd/vim-clang-format'

" CMake pluging
Plug 'jansenm/vim-cmake'

" Snippet stuff
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Formatting for most languages
Plug 'sbdchd/neoformat'
" }}}

" Neovim LSP {{{
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'
"}}}

call plug#end()
"}}}


" Keybindings {{{

" General keybindings {{{

" Ctrl + S to save {{{

" Use CTRL-S for saving, also in Insert mode
nnoremap <C-s>      :update<cr>
vnoremap <C-s> <C-c>:update<cr>
inoremap <C-s> <Esc>:update<cr>
" }}}

" Terminal keybindings {{{
" Set Esc to leave insert mode in terminal
tnoremap <Esc> <C-\><C-n>
" }}}
" Leader mapping {{{
" Besure that space is not mapped
nnoremap <SPACE> <Nop>

" set the leader key to space
let mapleader = ' '
" }}}

" Copy and cut to clipboard {{{
" clipboard
" copy
noremap <C-c> "+y

" paste
" noremap <C-v> "+p

" cut
noremap <C-x> "+d

" paste clipboard in insert mode
inoremap <C-v> <Esc>"+pa

" paste cplopboard in normal mode
" nnoremap <C-v> "+Pa<Esc>
" }}}

" Movement keys {{{
set scroll=10 
 
" shift the movement keys by 1 to the right
noremap j h
noremap k j
noremap l k
noremap ö l

" Remap horizontal scrolling
noremap Ö zl
noremap J zh
noremap <leader>ö zL
noremap <leader>j zH


" fast scrolling using smoothie
map K      <Plug>(SmoothieDownwards)
map L      <Plug>(SmoothieUpwards)
map <C-k>      <Plug>(SmoothieForwards)
map <C-l>      <Plug>(SmoothieBackwards)

" }}}

" .vimrc reload and opening {{{
" mapping that opens .vimrc in a split for quick editing
nnoremap <leader>eE :vsplit $MYVIMRC<CR>
nnoremap <leader>ee :split $MYVIMRC<CR>

" mapping that sources the vimrc in the current file
nnoremap <leader>es :source $MYVIMRC<CR>
" }}}

" Remap o and O {{{
" stay in normal mode after inserting a new line
noremap o o <Esc>
noremap O O <Esc>
" }}}

" Mapping U to Redo {{{
noremap U <c-r>
noremap <c-r> <NOP>
" }}}

" Indent via Tab {{{
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >>_
vnoremap <S-Tab> <<_
" }}}

" }}} General

" Window Keybindings {{{

" Window navigation {{{
" remapt moving between windows
" nnoremap <leader>wj <C-w>h
" nnoremap <leader>wk <C-w>j
" nnoremap <leader>wl <C-w>k
"nnoremap <leader>wö <C-w>l

" Next window
" nnoremap <leader>ww <C-w>w

" Top window
" nnoremap <leader>wt <C-w>t

" Bottom window
" nnoremap <leader>wb <C-w>b

" Previous window
" nnoremap <leader>wp <C-w>p
" }}}

" Window Spltting {{{
" Split horizontally with same file
"nnoremap <leader>ws <C-w>s
"inoremap <leader>ws <C-w>s
"vnoremap <leader>ws <C-w>s

" Split vertically with same file
"nnoremap <leader>wv <C-w>v
"inoremap <leader>wv <C-w>v
"nnoremap <leader>wv <C-w>v

" Split empty horizontally
"nnoremap <leader>wn <C-w>n
" }}}

" Window Closing {{{
" close window
"nnoremap <leader>wq <C-w>q
"nnoremap <leader>wx <C-w>c
" }}}

" Window Moving {{{
" Swap windows
"nnoremap <leader>wr <C-w>r
"nnoremap <leader>wR <C-w>R
"nnoremap <leader>wx <C-w>x

" Move windows in directions
"nnoremap <leader>wJ <C-w>H
"nnoremap <leader>wK <C-w>J
"nnoremap <leader>wL <C-w>K
"nnoremap <leader>wÖ <C-w>L
" }}}

" Window resize{{{
" Make windows equal size
" nnoremap <leader>we <C-w>=

" Height resize
" nnoremap <leader>ww <C-w>+
" nnoremap <leader>wx <C-w>-

" Width resize
" nnoremap <leader>wf <C-w>>
" nnoremap <leader>wa <C-w><
" }}}
" }}}

" Miscellaneous Keybindings {{{
" toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>
" }}}

" Change language {{{
map <F5> :setlocal spell spelllang=en_us<CR>
map <F6> :set nospell<CR>
" }}}
" }}} Keybindings

" Settings {{{
" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd

" Colors {{{
" Use term GUI colors
if (has("termguicolors"))
  set termguicolors
endif

" Oceanic has support for bold and italic
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" :color doom-one
colorscheme OceanicNext
" }}}

" Statusline {{{
" Always show window statuses
set laststatus=2

" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

set statusline+=\ %{LspStatus()}

" }}}

" Column Line {{{
highlight ColorColumn ctermbg=gray
set colorcolumn=120
" }}}

" Folding {{{
filetype plugin indent on " required
syntax enable             " required

" For vim files fold on marker
:autocmd FileType vim setlocal foldmethod=marker

set foldlevel=10

" Use treesitter for folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}}

" Indentation {{{
set expandtab
set shiftwidth=4
set softtabstop=2
" }}}

" Line numbering {{{
" Use relative linenumbers
set number relativenumber
set nu rnu
" }}}

" File management {{{
" Turn off swap files
set noswapfile
set nobackup
set nowb

" TODO: improve behaviour
" reload files changed outside vim
set autoread

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" }}}
" Start scrolling when we're 16 lines away from margins
set scrolloff=16

" set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif

" Searching {{{
" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
" set smartcase

" Highlight search results
set hlsearch

" }}}
" Performance {{{
" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw

" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set timeoutlen=200
" }}}
" Spelling {{{

" Activate spelling
set spell

" Abbreviations
iab wiht with
iab whit with
iab ture true
iab flase false
iab wieght weight
iab hieght height
iab tihs this
iab mian main
iab funciton function
iab funcition function

" }}}

" Misc settings {{{
" Map Q to q => leave with :Q
command! -bar -bang Q quit<bang>

" highlight matching braces
set showmatch

" Let change buffers, even if changes are not changed
set hidden

" How many tenths of a second to blink when matching brackets
set mat=0

" When the last window will have a status line (2 = always)
set laststatus=2

" disable wrapping of long lines into multiple lines
set nowrap

" history
set history=1000

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

" disable preview window
set completeopt-=preview

" disable auto commenting after enter
set formatoptions-=cro

" Show the line and column number of the cursor position
set ruler

" Add triple slash as documentation
autocmd Filetype c,cpp set comments^=:///

" Set conceallevel, to show e.g. links in markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:conceallevel = 0
" }}}

" Language specific settings {{{
" Python {{{
let g:python_highlight_all = 1
" }}}

" C++ {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_class_decl_highlight = 1
let c_no_curly_error = 1
" }}}

" }}}

" }}}


" Pluging configuration {{{
" vim-which-key {{{

" Map leader to which_key
" Initial config taken form https://www.chrisatmachine.com/Neovim/15-which-key/
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}

" Define a separator
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 1

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Single mappings
let g:which_key_map['ö'] = 'Scroll right'
let g:which_key_map['j'] = 'Scroll left'
let g:which_key_map['d'] = [ '<Plug>(textmanip-duplicate-down)'  , 'Duplicate below' ]
let g:which_key_map['D'] = [ '<Plug>(textmanip-duplicate-up)'    , 'Duplicate above' ]


let g:which_key_map.e = {
      \ 'name' : '+config',
      \ 'e' : 'Split horizontal',
      \ 'E' : 'Split vertical',
      \ 's' : 'Source',
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'n' : ['<plug>vem_next_buffer-'          , 'Next buffer'],
      \ 'p' : ['<plug>vem_prev_buffer-'          , 'Previous buffers'],
      \ 'j' : ['<plug>vem_move_buffer_left-'     , 'Move buffer left'],
      \ 'ö' : ['<plug>vem_move_buffer_right-'    , 'Move Buffer right'],
      \ 'q' : ['<plug>vem_delete_buffer-'        , 'Delete Buffer'],
      \ '1' : [':1tabnext'        , 'Switch to tab 1'],
      \ '2' : [':2tabnext'        , 'Switch to tab 2'],
      \ '3' : [':3tabnext'        , 'Switch to tab 3'],
      \ '4' : [':4tabnext'        , 'Switch to tab 4'],
      \ '5' : [':5tabnext'        , 'Switch to tab 5'],
      \ '6' : [':6tabnext'        , 'Switch to tab 6'],
      \ '7' : [':7tabnext'        , 'Switch to tab 7'],
      \ '8' : [':8tabnext'        , 'Switch to tab 8'],
      \ '9' : [':9tabnext'        , 'Switch to tab 9'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'd' : [':Gdiffsplit<CR>' , 'Git diff split'],
      \ 'b' : [':Gblame<CR>'     , 'Git blame'],
      \ 'c' : [':Commits<CR>'     , 'Search commits'],
      \ 's' : [':FFiles?<CR>'     , 'Search files'],
      \ }

let g:which_key_map.s = {
      \ 'name' : '+fuzzy',
      \ 'b' : [':Buffers<CR>'     , 'Search in buffers'],
      \ 'c' : [':Commands<CR>'    , 'Search in commands'],
      \ 't' : [':BTags<CR>'       , 'Search in tags'],
      \ '/' : [':Rg<CR>'          , 'Search in project'],
      \ 'h' : [':History/<CR>'    , 'Search in history'],
      \ 's' : [':FSHere'          , 'Switch header-source']
      \ }

let g:which_key_map['w'] = {
      \ 'name' : '+window' ,
      \ 'n' : ['<C-w>w' , 'Next window'],
      \ 'p' : ['<C-w>p' , 'Previous window'],
      \ 't' : ['<C-w>t' , 'Top window'],
      \ 'b' : ['<C-w>t' , 'Bottom window'],
      \ 'j' : ['<C-w>h' , 'Move to window to left'],
      \ 'k' : ['<C-w>j' , 'Move to window below'],
      \ 'l' : ['<C-w>k' , 'Move to window above'],
      \ 'ö' : ['<C-w>l' , 'Move to window to right'],
      \ 's' : ['<C-w>s' , 'Split horizontally'],
      \ 'v' : ['<C-w>v' , 'Split vertically'],
      \ 'o' : ['<C-w>n' , 'Split horizontally new file'],
      \ 'q' : ['<C-w>q' , 'Close window'],
      \ 'r' : ['<C-w>r' , 'Swap window'],
      \ 'R' : ['<C-w>R' , 'Swap window'],
      \ 'J' : ['<C-w>H' , 'Move window to the left'],
      \ 'K' : ['<C-w>J' , 'Move window down'],
      \ 'L' : ['<C-w>K' , 'Move window up'],
      \ 'Ö' : ['<C-w>L' , 'Move window to the right'],
      \ 'e' : ['<C-w>=' , 'Resize to equal size'],
      \ 'w' : ['<C-w>+' , 'Increase height'],
      \ 'x' : ['<C-w>-' , 'Decrease height'],
      \ 'f' : ['<C-w>>' , 'Increase width'],
      \ 'a' : ['<C-w><' , 'Decrease width']
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = '<c-g><c-g>'
let g:UltiSnipsListSnippets="<F7>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']
" }}}
" vim-textmanip {{{
xmap <A-k> <Plug>(textmanip-move-down)
nmap <A-k> <Plug>(textmanip-move-down)

xmap <A-l> <Plug>(textmanip-move-up)
nmap <A-l> <Plug>(textmanip-move-up)

xmap <A-j> <Plug>(textmanip-move-left)
nmap <A-j> <Plug>(textmanip-move-left)

xmap <A-ö> <Plug>(textmanip-move-right)
nmap <A-ö> <Plug>(textmanip-move-right)

" toggle insert/replace with <F10>
nmap <F10> <Plug>(textmanip-toggle-mode)
xmap <F10> <Plug>(textmanip-toggle-mode)
" }}}

" vim-fswitch {{{
" nmap <leader>fs :FSHere<cr>
" }}}

" FZF {{{
so ~/.config/nvim/plugins/fzf/init.vim
" }}}

" Pandoc {{{
so ~/.config/nvim/plugins/pandoc/init.vim
" }}}

" Nerdcommenter {{{
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

let g:which_key_map.c = {
      \ 'name' : '+comment',
      \ 'c' : 'Comment'    ,
      \ ' ' : 'Toggle'    ,
      \ 'm' : 'Minimal'    ,
      \ 'n' : 'Nested'    ,
      \ '$' : 'To EOL'    ,
      \ 'i' : 'Invert'    ,
      \ 's' : 'Sexy'    ,
      \ 'y' : 'Yank then comment'    ,
      \ 'A' : 'Append'    ,
      \ 'l' : 'Left aligned'    ,
      \ 'b' : 'Left and right aligend'    ,
      \ 'u' : 'Uncomment'    ,
      \ 'a' : 'Switch Delimiters'    ,
      \ }
" }}}

" indentLine {{{
" indentation char
let g:indentLine_char = '¦'
" }}}

" Neoformat {{{
let g:neoformat_enabled_python = ['yapf']

let g:neoformat_enabled_cpp = ['']
let g:neoformat_enabled_c = ['']

" shortcuts for autoformatting the entire file: Ctrl+f
" autocmd FileType * inoremap <buffer><C-f> <Esc>:Neoformat<CR>a
" autocmd FileType * nnoremap <buffer><C-f> <Esc>:Neoformat<CR>
autocmd FileType * inoremap <buffer><leader>f <Esc>:Neoformat<CR>a
autocmd FileType * nnoremap <buffer><leader>f <Esc>:Neoformat<CR>
" }}}

" clang-format {{{
" Clang format - auto formatting
let g:clang_format#command = 'clang-format'
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format_on_insert_leave = 0

" shortcuts for autoformatting the entire file: Ctrl+f
" autocmd FileType c,cpp,cu,cuh inoremap <buffer><C-f> <Esc>:ClangFormat<CR>a
" autocmd FileType c,cpp,cu,cuh nnoremap <buffer><C-f> <Esc>:ClangFormat<CR>

autocmd FileType c,cpp,cu,cuh inoremap <buffer><leader>f <Esc>:ClangFormat<CR>a
autocmd FileType c,cpp,cu,cuh nnoremap <buffer><leader>f <Esc>:ClangFormat<CR>

" Add entry to vim-which-key 
let g:which_key_map['f'] = 'Format'
" }}}

" TODO: this is currently replaced by quickscope, maybe remove this soon
" Easymotion {{{
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" shift the keys 1 to the right so they match my jklč config
" map <leader><leader>j <Plug>(easymotion-linebackward)
" map <leader><leader>k <Plug>(easymotion-j)
" map <leader><leader>l <Plug>(easymotion-k)
" map <leader><leader>ö <Plug>(easymotion-lineforward)
" }}}

" Tree-sitter {{{
lua require("treesitter-config")
" }}}


" vim-better-whitespace {{{

" Enable it by default
let g:better_whitespace_enabled=1

" For python files, just remove them on save
autocmd FileType Python EnableStripWhitespaceOnSave

" Don't ask for confirmation, just to it
let g:strip_whitespace_confirm=0

let g:current_line_whitespace_disabled_soft=1
" }}}

" vim-fugitive {{{
" fugitive mappings
"nmap <leader>gd :Gdiffsplit<CR>
"nmap <leader>gb :Gblame<CR>
" }}}

" TODO: remove this, I've never used this to be honest
" vista {{{
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_icon_indent = ["▸ ", ""]
" }}}

" TODO: remove this, just replaced by vem-tabline
" barbar {{{
" so ~/.config/nvim/plugins/barbar/init.vim
" }}}

" vem-tabline {{{
so ~/.config/nvim/plugins/vem-tabline/init.vim
" }}}


" LSP setup {{{

" Register lsp clients {{{
lua << EOF
-- taken from https://gitlab.com/SanchayanMaity/dotfiles/-/blob/master/nvim/.config/nvim/lua/lsp.lua
function preview_location(location, context, before_context)
  -- location may be LocationLink or Location (more useful for the former)
  context = context or 10
  before_context = before_context or 5
  local uri = location.targetUri or location.uri
  if uri == nil then
    return
  end
  local bufnr = vim.uri_to_bufnr(uri)
  if not vim.api.nvim_buf_is_loaded(bufnr) then
    vim.fn.bufload(bufnr)
  end
  local range = location.targetRange or location.range
  local contents =
    vim.api.nvim_buf_get_lines(bufnr, range.start.line - before_context, range["end"].line + 1 + context, false)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  return vim.lsp.util.open_floating_preview(contents, filetype)
end

function preview_location_callback(_, method, result)
  local context = 10
  if result == nil or vim.tbl_isempty(result) then
    print("No location found: " .. method)
    return nil
  end
  if vim.tbl_islist(result) then
    floating_buf, floating_win = preview_location(result[1], context)
  else
    floating_buf, floating_win = preview_location(result, context)
  end
end

function peek_definition()
  if vim.tbl_contains(vim.api.nvim_list_wins(), floating_win) then
    vim.api.nvim_set_current_win(floating_win)
  else
    local params = vim.lsp.util.make_position_params()
    return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
  end
end

local function echo(hlgroup, msg)
  vim.cmd(string.format('echohl %s', hlgroup))
  vim.cmd(string.format('echo "[lspfuzzy] %s"', msg))
  vim.cmd('echohl None')
end

-- on_attack for completion
local on_attach_vim = function(bufnr, client)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require'completion'.on_attach(client)

  -- taken from https://gitlab.com/SanchayanMaity/dotfiles/-/blob/master/nvim/.config/nvim/lua/lsp.lua
  local opts = { noremap=true, silent=true }

  ---[[ With fzf-lsp, this is possible
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', ':Definitions<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgD', ':Declarations<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgi', ':Implementations<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgt', ':TypeDefinitions<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', ':References<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', ':DocumentSymbols<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lS', ':WorkspaceSymbols<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', ':CodeActions<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lA', ':RangeCodeActions<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldd', ':Diagnostics<CR>', opts)
  --]]

  --[[ Else we can use this again
  echo("Hello")
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lS', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --]]


  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lp', '<cmd>lua peek_definition()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldN', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ldP', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>', opts)
end

-- setup lsp clangd from https://github.com/neovim/nvim-lspconfig#clangd
require'lspconfig'.clangd.setup {
    on_attach=on_attach_vim,
    config = {
        cmd = { "clangd-10 --background-index --clang-tidy --header-insertion=never --header-insertion-decorator --suggest-missing-includes"
        }
    }
}
-- setup lsp for CMake
require'lspconfig'.cmake.setup{
    config = {
        filetypes = { "cmake", "CMakeLists.txt" }
    }
}
-- setup lsp for lua
require'lspconfig'.sumneko_lua.setup{
    cmd = { "/home/david/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/david/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua" },
}

-- setup lsp for python https://jdhao.github.io/2019/11/20/neovim_builtin_lsp_hands_on/
require'lspconfig'.pyls.setup{
    on_attach = on_attach_vim
}

-- setup fuzzy lsp
-- require('lspfuzzy').setup {}

-- setup lsp diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = false,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)

EOF

autocmd BufEnter * lua require'completion'.on_attach()

autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
" }}}

" LSP Keybindings {{{
let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'r' : 'References',
      \ 'R' : 'Rename',
      \ 'a' : 'code-action',
      \ 's' : 'document-symbol',
      \ 'S' : 'workspace-symbol',
      \ 'h' : 'Hover',
      \ 'H' : 'Signature help',
      \ 'p' : 'Peek definition',
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : 'Definition',
        \ 'D' : 'Declaration',
        \ 'i' : 'Implementation',
        \ },
      \ 'd' : {
        \ 'name': '+diagnostics',
        \ 'n' : 'Next (cycle)',
        \ 'p' : 'Previous (cycle)',
        \ 'N' : 'Next (cycle)',
        \ 'P' : 'Previous (cycle)',
        \ },
      \ }
" }}}

" Setup nice symbols for diagnostics {{{

call sign_define("LspDiagnosticsSignError", {"text" : "✖", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsSignWarning", {"text" : "⚠", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsSignInformation", {"text" : "🛈", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsSignHint", {"text" : "➤", "texthl" : "LspDiagnosticsHint"})
" }}}

" lsp-completion {{{
" Set completeopt to have a better completion experience :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Trigger completion with <Tab>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <C-x><C-k> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Use UltiSnips as a completion engine
let g:completion_enable_snippet = 'UltiSnips'

let g:completion_enable_auto_popup = 1

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1
" }}}

" }}}

" }}}
