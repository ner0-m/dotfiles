" Plugins
call plug#begin('~/.config/nvim/bundle')

" ================ Navigation plugins ======================

" fuzzy file, buffer etc. finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" switch from headers to source files
Plug 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp', 'objc'] }

" Close buffer without the window
Plug 'qpkorr/vim-bufkill'

" ================ Edeting plugins ======================

Plug 'ntpeters/vim-better-whitespace'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

" Move lines
Plug 't9md/vim-textmanip'

" surround vim
Plug 'tpope/vim-surround'

" easy motion
Plug 'easymotion/vim-easymotion'

" Snippet stuff
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Tag side bar
Plug 'liuchengxu/vista.vim'

" Formatting for most languages 
Plug 'sbdchd/neoformat'

" Markdown + Pandoc (Not usued currently, prefer a makefile)
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" ================ View plugins ======================

" indentLine
Plug 'Yggdroot/indentLine'

" Show git diff
Plug 'airblade/vim-gitgutter'

" ================ Color plugins ======================

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'romgrk/doom-one.vim'
Plug 'mhartington/oceanic-next'

" ================ Tab manager =========================

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" ================ Linting plugins ======================

" Clang format
Plug 'rhysd/vim-clang-format'

 " Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'

" Extensions to built-in LSP, for example, providing type inlay hints
" Plug 'tjdevries/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

" CMake pluging
Plug 'jansenm/vim-cmake'

call plug#end()

" ================ Ctrl + S to save ======================

" Use CTRL-S for saving, also in Insert mode
noremap <C-s> :update<cr>
vnoremap <C-s> <C-c>:update<cr>
inoremap <C-s> <Esc>:update<cr>

" ================ Suggestions ======================

" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd

" ================ Column Line ======================

highlight ColorColumn ctermbg=gray
set colorcolumn=120

" ================ Color settings======================

" Theme
if (has("termguicolors"))
  set termguicolors
endif

" :color doom-one
colorscheme OceanicNext

" Set font color of Error sign to white
:hi! CocErrorSign guifg=#ffffff

" ================ Line numbering ==================

set number relativenumber
set nu rnu

" we don't want to see relative numbering while debugging
" debugger uses its own window, so we can disable rnu when source window loses
" focus
autocmd BufLeave * :set number
autocmd BufEnter * :set number relativenumber
function! SetRNU()
    if(mode()!='i')
        set rnu
    endif
endfunction

" ================ Terminal management ==================

" Set Esc to leave insert mode in terminal
tnoremap <Esc> <C-\><C-n>

" ================ File management ==================

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

" ================ Scrolling =========================

" Start scrolling when we're 16 lines away from margins
set scrolloff=16

" ================ Encoding =========================

"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif

" ================ Keyboard bindings ================

" noremap - no recursive mapping

" set the leader key to comma
let mapleader = ','

" clipboard
" copy
noremap <C-c> "+y

" paste
" noremap <C-v> "+p

" cut
noremap <C-x> "+d

" paste in insert mode
" inoremap <C-v> <Esc>"+pa

" shift the movement keys by 1 to the right
noremap j h
noremap k j
noremap l k
noremap ö l

" fast scrolling
nnoremap K 10j
nnoremap L 10k
vnoremap K 10j
vnoremap L 10k

" stay in normal mode after inserting a new line
noremap o o <Esc>
noremap O O <Esc>

" mapping that opens .vimrc in a split for quick editing
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader><leader>ev :split $MYVIMRC<CR>

" mapping that sources the vimrc in the current file
nnoremap <leader>sv :source $MYVIMRC<CR>

" Mapping U to Redo.
noremap U <c-r>
noremap <c-r> <NOP>

" indent via Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >>_
vnoremap <S-Tab> <<_


" ================ Window Navigation ========================

" remapt moving between windows
nnoremap <leader>wj <C-w>h
nnoremap <leader>wk <C-w>j
nnoremap <leader>wl <C-w>k
nnoremap <leader>wö <C-w>l

" Next window
nnoremap <leader>ww <C-w>w

" Top window
nnoremap <leader>wt <C-w>t

" Bottom window
nnoremap <leader>wb <C-w>b

" Previous window
nnoremap <leader>wp <C-w>p

" ================ Window Creation/closing ========================

" Split horizontally with same file
nnoremap <leader>ws <C-w>s
inoremap <leader>ws <C-w>s
vnoremap <leader>ws <C-w>s

" Split vertically with same file
nnoremap <leader>wv <C-w>v
inoremap <leader>wv <C-w>v
nnoremap <leader>wv <C-w>v

" Split empty horizontally
nnoremap <leader>wn <C-w>n

" close window
nnoremap <leader>wq <C-w>q
nnoremap <leader>wx <C-w>c

" ================ Window Moving ========================

" Swap windows
nnoremap <leader>wr <C-w>r
nnoremap <leader>wR <C-w>R
nnoremap <leader>wx <C-w>x

" Move windows in directions
nnoremap <leader>wJ <C-w>H
nnoremap <leader>wK <C-w>J
nnoremap <leader>wL <C-w>K
nnoremap <leader>wÖ <C-w>L

" ================ Window Resize ========================

" Make windows equal size
nnoremap <leader>we <C-w>=

" Height resize
nnoremap <leader>ww <C-w>+
nnoremap <leader>wx <C-w>-

" Width resize
nnoremap <leader>wf <C-w>>
nnoremap <leader>wa <C-w><


" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

" ================ Performance ======================

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw

" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set ttimeoutlen=10


" ================ Abbreviations ====================

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

" Add dictionaries
set dictionary+=/usr/share/dict/british-english
set dictionary+=/usr/share/dict/british
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/american
set dictionary+=/usr/share/dict/words
set dictionary+=/usr/share/dict/german
set dictionary+=/usr/share/dict/ngerman

" ================ Misc =============================

" Map Q to q => leave with :Q
command! -bar -bang Q quit<bang>

" highlight matching braces
set showmatch

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

" to avoid hitting:
" 'press ENTER or type command to continue'
" add 'silent' keyword before the command
"
" open a gnome-terminal with a shortcut
noremap <leader><CR> :silent !gnome-terminal<CR>

"disable preview window
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

" ================ Handle Pandoc more ealsy ==========================

" Compile and open output
" nnoremap <leader><leader>g :w! \| !comp <c-r>%<CR><CR>
" nnoremap <leader>o :!opout <c-r>%<CR><CR>

" ================ Plugins ==========================

" ################ UtilSnips ############################

" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger = '<c-g><c-g>'
let g:UltiSnipsListSnippets="<F5>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" ################ vim-anyfold ##########################

filetype plugin indent on " required
syntax enable             " required

set foldlevel=10

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" ################ vim-textmanip ##########################

xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

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

" ################ Statusline ##########################

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

" ################ Wildfire.vim #########################

map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)

" ################ vim-fswitch #########################

nmap <leader>fs :FSHere<cr>

" ################ vim-gitgutter #########################

set updatetime=250

set signcolumn=yes

let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" ################ vim-multi-cursor #########################

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ################ FZF #########################

so ~/.config/nvim/plugins/fzf/init.vim

" ################ pandoc #########################

so ~/.config/nvim/plugins/pandoc/init.vim

" ################ NERDTree #########################

" shift+i (show hidden files)

" ctrl+n open/closes nerd tree
nnoremap <C-b> :NERDTreeToggle<CR>

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "right"

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" ################ NERDcommenter ##########################

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


" ################ indentLine ##########################

set expandtab
set shiftwidth=4
set softtabstop=2

" ################ Clang format #####################

" Clang format - auto formatting
let g:clang_format#command = 'clang-format'
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format_on_insert_leave = 0

" shortcuts for autoformatting the entire file: Ctrl+f
autocmd FileType c,cpp,cu,cuh inoremap <buffer><C-f> <Esc>:ClangFormat<CR>a
autocmd FileType c,cpp,cu,cuh nnoremap <buffer><C-f> <Esc>:ClangFormat<CR>

" ################ Easymotion #######################

" shift the keys 1 to the right so they match my jklč config
map <leader><leader>j <Plug>(easymotion-linebackward)
map <leader><leader>k <Plug>(easymotion-j)
map <leader><leader>l <Plug>(easymotion-k)
map <leader><leader>ö <Plug>(easymotion-lineforward)

" ====================================================================
" Python
" ====================================================================

let g:python_highlight_all = 1

" ====================================================================
"  C/C++ Enhaced
" ====================================================================

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_class_decl_highlight = 1
let c_no_curly_error = 1

" == nvim-treesitter ====================================================

lua require("treesitter-config")

" == vim-better-whitespace ====================================================

let g:better_whitespace_enabled=1

autocmd FileType Python EnableStripWhitespaceOnSave

let g:strip_whitespace_confirm=0

let g:current_line_whitespace_disabled_soft=1

" == vist configuration =================================================

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_icon_indent = ["▸ ", ""]

" == barbar configuration =================================================

so ~/.config/nvim/plugins/barbar/init.vim

" == setup clangd from https://github.com/neovim/nvim-lspconfig#clangd
" Python setup taken from https://jdhao.github.io/2019/11/20/neovim_builtin_lsp_hands_on/

lua << EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
end
 
require'lspconfig'.clangd.setup { 
    on_attach=on_attach_vim, 
    config = { 
        cmd = { "clangd-10 --background-index --clang-tidy --header-insertion=never --header-insertion-decorator --suggest-missing-includes" 
        }
    }
} 
require'lspconfig'.cmake.setup{ 
    config = { 
        filetypes = { "cmake", "CMakeLists.txt" } 
    }
}
require'lspconfig'.sumneko_lua.setup{
    cmd = { "/home/david/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/david/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua" },
}


require'lspconfig'.pyls.setup{
    on_attach = on_attach_vim
}
EOF

autocmd BufEnter * lua require'completion'.on_attach()

autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" == LSP config from https://neovim.io/doc/user/lsp.html

" Code navigation shortcuts
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>


" Have nice symbold inline if there is an error
call sign_define("LspDiagnosticsSignError", {"text" : "✖", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsSignWarning", {"text" : "⚠", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsSignInformation", {"text" : "🛈", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsSignHint", {"text" : "➤", "texthl" : "LspDiagnosticsHint"})

" == LSP completion =================================================

" Set completeopt to have a better completion experience
" :help completeopt
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

" == neoformat configuration =================================================

let g:neoformat_enabled_python = ['yapf']

" let g:neoformat_cpp_clangformat = {
"     \ 'exe': 'clang-format',
"     \ 'args': ['-style=file', '-assume-filename=' . expand('%:t'), '--'],
" \}
let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=file'],
            \ }
let g:neoformat_enabled_cpp = ['']
let g:neoformat_enabled_c = ['']
