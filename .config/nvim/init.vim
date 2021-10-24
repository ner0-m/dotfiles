" Leader mapping {{{
" Besure that space is not mapped
nnoremap <SPACE> <Nop>

" set the leader key to space
let mapleader = ' '
" }}}

lua require("neva.plugins")
lua require("neva.build")

" Settings {{{
source ~/.config/nvim/config/general.vim
" }}}

lua require("colors")
lua require("globals")
 
" Key bindings {{{
" shortcuts for autoformatting the entire file: Ctrl+f
autocmd FileType * nnoremap <buffer><leader>xf <Esc>:Format<CR>
autocmd FileType * nnoremap <buffer><leader>xF <Esc>:FormatWrite<CR>
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Keybindings {

" Copy and cut to clipboard {{{
noremap <C-x> "+d
" }}}

" Movement keys {{{
set scroll=10
" }}}

" Ctrl + S to save {{{
nnoremap <C-s>      :update<cr>
vnoremap <C-s> <C-c>:update<cr>
inoremap <C-s> <Esc>:update<cr>
" }}}

" stay in normal mode for o and O {{{
noremap o o <Esc>
noremap O O <Esc>
" }}}

" Paste _ registry
vnoremap <leader>p "_dP

" Copy
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" Copy till end of file
nnoremap <leader>Y gg"+yG
" Cut
nnoremap <leader>d "+d
vnoremap <leader>d "+d
" Delete line storing into _ register
nnoremap <leader>dd "_d
vnoremap <leader>dd "_d


" Make Y consistent with D and C {{{
nnoremap Y y$
" }}}

" Keep cursor centered {{{
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" }}}

" Undo break points {{{
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
" }}}
" Moveing text {{{
" Move in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Move in insert mode (seems broken?)
inoremap <c-j> <esc>:m .+2<CR>==
inoremap <c-k> <esc>:m .-2<CR>==
" Move in normal mode
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
" }}}

" Use Tab and shift tab to intent lines {{{
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" }}}

" Window bindings I just hate the <C-w>... {{{
nnoremap <leader>wp <C-w>p
nnoremap <leader>wt <C-w>t
"TODO: this one is wrong
nnoremap <leader>wb <C-w>t
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>wn <C-w>n
nnoremap <leader>wn <C-w>n
nnoremap <leader>wq <C-w>q
nnoremap <leader>wr <C-w>r
nnoremap <leader>wR <C-w>R
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L
nnoremap <leader>we <C-w>=
nnoremap <leader>ww <C-w>+
nnoremap <leader>wx <C-w>-
nnoremap <leader>wf <C-w>>
nnoremap <leader>wy <C-w><
" }}}

" Use Exc to leave terminal {{{
tnoremap <Esc> <C-\><C-n>
" }}}

" Navigate quickfix list {{{
nnoremap <C-q> :copen<CR>
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprevious<CR>
nnoremap <leader>qc :cclose<CR>
" }}}

" Reload current luafile
nnoremap <leader>xl :luafile %<CR>

"}}}
