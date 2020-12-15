"
" Settings for the Tabline plugin barbar
"

let g:vem_tabline_multiwindow_mode = 0
let g:vem_tabline_show_number = 'none'

" Move to previous/next
" nmap <silent> <leader>bp <Plug>vem_prev_buffer-
" nmap <silent> <leader>bn <Plug>vem_next_buffer-

" Re-order to previous/next
" nmap <silent> <leader>bj <Plug>vem_move_buffer_left-
" nmap <silent> <leader>bö <Plug>vem_move_buffer_right-

" Delete buffer
" nmap <silent> <leader>bq <Plug>vem_delete_buffer-

" Goto buffer in workspace...
" nnoremap <silent>    <leader>b1 :1tabnext<CR>
" nnoremap <silent>    <leader>b2 :2tabnext<CR>
" nnoremap <silent>    <leader>b3 :3tabnext<CR>
" nnoremap <silent>    <leader>b4 :4tabnext<CR>
" nnoremap <silent>    <leader>b5 :5tabnext<CR>
" nnoremap <silent>    <leader>b6 :6tabnext<CR>
" nnoremap <silent>    <leader>b7 :7tabnext<CR>
" nnoremap <silent>    <leader>b8 :8tabnext<CR>
" nnoremap <silent>    <leader>b9 :9tabnext<CR>

" {{{ Relink colors  
highlight default link VemTablineNormal TabLine
highlight default link VemTablineLocation TabLine
highlight default link VemTablineNumber TabLine
 
highlight default link VemTablineSelected TabLineSel
highlight default link VemTablineLocationSelected TabLineSel
highlight default link VemTablineNumberSelected TabLineSel
highlight default link VemTablineTabSelected TabLineSel
 
highlight default link VemTablineShown TabLine
highlight default link VemTablineLocationShown TabLine
highlight default link VemTablineNumberShown TabLine
highlight default link VemTablinePartialName Tabline
highlight default link VemTablineSeparator TabLineFill
highlight default link VemTablineTabNormal TabLineFill
highlight default link VemTabline VemTablineNormal
" }}}
