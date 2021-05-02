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

" }}} General

