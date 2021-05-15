
" Create mappings for autocorrect
" All autocorrect bindings have the prefix a 

" Enable 
nnoremap <leader>ae :EnableAutocorrect<CR>

" Disable
nnoremap <leader>ad :DisableAutocorrect<CR>
 
" Undo
nmap <Leader>au <Plug>VimyouautocorrectUndo
imap <F3> <C-O><Plug>VimyouautocorrectUndo 
 
" Next spelling 
nmap <leader>ap <C-O><Plug>VimyouautocorrectPrevious
imap <F4> <C-O><Plug>VimyouautocorrectPrevious
 
" Previous spelling 
nmap <leader>an <C-O><Plug>VimyouautocorrectNext
imap <F5> <C-O><Plug>VimyouautocorrectNext
