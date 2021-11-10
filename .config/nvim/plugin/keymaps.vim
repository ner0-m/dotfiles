" Leader mapping {{{
" Besure that space is not mapped
nnoremap <SPACE> <Nop>

" set the leader key to space
let mapleader = ' '
" }}}
 
" Keybindings {

" Copy and cut to clipboard {{{
noremap <C-x> "+d
" }}}

" Movement keys {{{
set scroll=10
" }}}

" Ctrl + S to save {{{
nnoremap <leader>s      :update<cr>
vnoremap <leader>s <C-c>:update<cr>
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
inoremap <c-j> <esc>:m .+1<CR>==
inoremap <c-k> <esc>:m .-1<CR>==
 
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
