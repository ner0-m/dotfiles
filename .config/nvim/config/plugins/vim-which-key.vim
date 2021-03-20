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
let g:which_key_map['h'] = 'Stop Search'
let g:which_key_map['f'] = 'Format'

" open and source neovim config
let g:which_key_map.e = {
      \ 'name' : '+config',
      \ 'e' : 'Split horizontal',
      \ 'E' : 'Split vertical',
      \ 's' : 'Source',
      \ }

" Buffer keybindings
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

" Git keybindings
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'd' : [':Gdiffsplit<CR>' , 'Git diff split'],
      \ 'b' : [':Gblame<CR>'     , 'Git blame'],
      \ 'c' : [':Commits<CR>'    , 'Search commits'],
      \ 's' : [':FFiles?<CR>'    , 'Search files'],
      \ }

" Search and jump bindings
let g:which_key_map.s = {
      \ 'name' : '+fuzzy',
      \ 'b' : [':Buffers'     , 'Search in buffers'],
      \ 'c' : [':Commands'    , 'Search in commands'],
      \ 't' : [':BTags'       , 'Search in tags'],
      \ '/' : [':Rg'          , 'Search in project'],
      \ 'h' : [':History/'    , 'Search in history'],
      \ 's' : [':FSHere'      , 'Switch header-source']
      \ }

" Window bindings
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

" Comment bindings
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
        \ 'l' : 'Show line diagnostic',
        \ 'n' : 'Next (cycle)',
        \ 'p' : 'Previous (cycle)',
        \ 'N' : 'Next (cycle)',
        \ 'P' : 'Previous (cycle)',
        \ },
      \ }
" }}}


" Register which key map
call which_key#register('<Space>', "g:which_key_map")

