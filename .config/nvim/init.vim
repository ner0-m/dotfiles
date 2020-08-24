" Plugins
call plug#begin('~/.config/nvim/bundle') 

" ================ Navigation plugins ======================
 
" nerd tree
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }

" fuzzy file, buffer etc. finder 
Plug 'ctrlpvim/ctrlp.vim'
 
" search for code and edit it in-place 
Plug 'dyng/ctrlsf.vim'
 
" buffer explorer that takes very little screen space 
Plug 'fholgado/minibufexpl.vim'
 
" display tags in a window order by scope 
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
 
" switch from headers to source files 
Plug 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp', 'objc'] }

" Close buffer without the window
Plug 'qpkorr/vim-bufkill' 
 
" ================ Edeting plugins ======================
 
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
 
" nerd commenter
Plug 'scrooloose/nerdcommenter'
 
" UltiSnips
Plug 'SirVer/ultisnips'
 
" Undo Tree 
Plug 'sjl/gundo.vim'
 
" Move lines 
Plug 't9md/vim-textmanip'
 
" Insert [], () and \"\" in pairs 
" Plug 'jiangmiao/auto-pairs'

" Fold plugin 
Plug 'pseewald/anyfold'
 
" surround vim
Plug 'tpope/vim-surround'
 
Plug 'kana/vim-operator-user'
 
" Select close text object 
Plug 'gcmt/wildfire.vim'
 
" Pull in C++ function prototypes into implementation files 
Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp', 'objc'] }

" easy motion
Plug 'easymotion/vim-easymotion'
 
" Multi line tools 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Markdown helpers
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
 
" ================ View plugins ======================
 
" indentLine
Plug 'Yggdroot/indentLine'

" Show git diff
Plug 'airblade/vim-gitgutter'

" ================ Color plugins ======================
 
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sheerun/vim-polyglot'
 
" ================ Linting plugins ======================
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
 
" Clang format
Plug 'rhysd/vim-clang-format'
 
" Plug 'w0rp/ale'
 
" function! BuildYCM(info)
" if a:info.status == 'installed' || a:info.force
"   !./install.py --clang-completer
" endif
" endfunction

" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
 
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

" ================ Folds ============================

" set foldmethod=marker   "fold based on marker
" set foldmarker={,}
" set foldnestmax=3       "deepest fold is 3 levels
" set nofoldenable        "dont fold by default
 
 
" ================ Scrolling =========================

" Start scrolling when we're 8 lines away from margins
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
noremap <C-v> "+p
 
" cut
noremap <C-x> "+d
 
" paste in insert mode
inoremap <C-v> <Esc>"+pa
 
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
 
" ================ Buffer navigation vim-bufkill ========================

" delete buffer from list, without closing window 
nnoremap <leader>bd :BD<cr>

" move to next buffer
nnoremap <leader>bn :BF<cr>
 
" move to previous buffer 
nnoremap <leader>bp :BB<cr>
 
" alternate buffer 
nnoremap <leader>ba :BA<cr> 
 
 
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
nnoremap <leader><leader>g :w! \| !comp <c-r>%<CR><CR>
nnoremap <leader>o :!opout <c-r>%<CR><CR>
 
" ================ Buffer switching ==========================

nnoremap <leader>bf :bfirst<CR> 
vnoremap <leader>bf :bfirst<CR> 
 
nnoremap <leader>bl :blast<CR> 
vnoremap <leader>bl :blast<CR> 
 
nnoremap <leader>bn :bnext<CR> 
vnoremap <leader>bn :bnext<CR> 
 
nnoremap <leader>bp :bprevious<CR> 
vnoremap <leader>bp :bprevious<CR> 
 
" ================ Plugins ==========================
 
" ################ UtilSnips ##########################
 
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
 
" ################ vim-anyfold ##########################

filetype plugin indent on " required
syntax on                 " required
 
autocmd Filetype * AnyFoldActivate
let g:anyfold_identify_comments=2
let g:anyfold_fold_comments=1 
set foldlevel=6
hi Folded term=NONE cterm=NONE

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
 
" ################ ultisnips ##########################

let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
 
" ################ Statusline ##########################

" Always show window statuses
set laststatus=2

" Statusline style
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%8*\ %=\ row:%l/%L\ (%p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

 
" ################ Wildfire.vim #########################
 
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)
 
" ################ tagbar #########################

inoremap <C-m> <esc>:TagbarToggle<cr>
nnoremap <C-m> :TagbarToggle<cr>

let tagbar_left=1
let tagbar_width=32
let g:tagbar_sort = 0
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
 \ 'ctagstype' : 'c++',
 \ 'kinds'     : [
     \ 'c:classes:0:1',
     \ 'd:macros:0:1',
     \ 'e:enumerators:0:0', 
     \ 'f:functions:0:1',
     \ 'g:enumeration:0:1',
     \ 'l:local:0:1',
     \ 'm:members:0:1',
     \ 'n:namespaces:0:1',
     \ 'p:functions_prototypes:0:1',
     \ 's:structs:0:1',
     \ 't:typedefs:0:1',
     \ 'u:unions:0:1',
     \ 'v:global:0:1',
     \ 'x:external:0:1'
 \ ],
 \ 'sro'        : '::',
 \ 'kind2scope' : {
     \ 'g' : 'enum',
     \ 'n' : 'namespace',
     \ 'c' : 'class',
     \ 's' : 'struct',
     \ 'u' : 'union'
 \ },
 \ 'scope2kind' : {
     \ 'enum'      : 'g',
     \ 'namespace' : 'n',
     \ 'class'     : 'c',
     \ 'struct'    : 's',
     \ 'union'     : 'u'
 \ }
\ }
 

" ################ vim-fswitch #########################
 
nmap <silent> <leader>fs :FSHere<cr>
 
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
 
" ################ gundo #########################

let g:gundo_prefer_python3 = 1
  
nnoremap <Leader>ud :GundoToggle<CR>
  
" set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

if !strlen(finddir('~/.vim/undofiles'))
echo "undofiles[~/.vim/undofiles] not found. Now it's being created. Press ENTER or type command to continue."
!mkdir -p ~/.vim/undofiles
endif

" if v:version >= 703
" set undodir=~/.vim/undofiles
" set undofile
" set colorcolumn=+1
" endif
 
" ################ ctrlp #########################
   
 " Disable output, vcs, archive, rails, temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vendor/bundle/*\|vendor/cache/*\|public\|spec)$',
  \ 'file': '\v\.(exe|so|dll|swp|log|jpg|png|json)$',
  \ }
 
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
let g:clang_format#command = 'clang-format-8'
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

" ====================================================================
" coc.nvim 
" ====================================================================
 " TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <C-h> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <leader><C-s> <Plug>(coc-range-select)
xmap <silent> <leader><C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
 
" Highlight stuff
autocmd CursorHold * silent call CocActionAsync('highlight')
 
:color delek 
" Set font color of Error sign to white 
:hi! CocErrorSign guifg=#ffffff 
