" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd

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

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
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
set smartcase

" Highlight search results
set hlsearch

" Performance {{{
" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw

" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set timeoutlen=300
" }}}
" Spelling {{{

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
augroup cpp
    autocmd!
    autocmd FileType c,cpp setlocal comments-=:// comments+=://!,:///,:// spell
    autocmd FileType cpp setlocal matchpairs+=<:>
augroup END

" Set conceallevel, to show e.g. links in markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX)/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" }}}

