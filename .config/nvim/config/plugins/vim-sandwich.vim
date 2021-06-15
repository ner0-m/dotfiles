" No default keymappings
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

" add
silent! nmap <unique> ca <Plug>(operator-sandwich-add)
silent! xmap <unique> ca <Plug>(operator-sandwich-add)
silent! omap <unique> ca <Plug>(operator-sandwich-g@)

" delete
silent! nmap <unique><silent> cd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)

" Replace
silent! nmap <unique><silent> cr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)

silent! nmap <unique><silent> cdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> crb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
