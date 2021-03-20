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
" inoremap <C-v> <Esc>"+pa

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
" map <C-k>      <Plug>(SmoothieForwards)
" map <C-l>      <Plug>(SmoothieBackwards)

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

