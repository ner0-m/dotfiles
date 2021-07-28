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

" cut
noremap <C-x> "+d
" }}}

" Movement keys {{{
set scroll=10
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

" Indent via Tab {{{
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >>_
vnoremap <S-Tab> <<_
" }}}

" Window bindings {{{
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
" }}} General

