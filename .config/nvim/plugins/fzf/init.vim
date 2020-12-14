"
" Config for fzf plugin
"

" Search for hiddenfiles, ignore build, git files
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.cache/**' --glob '!.git/**' --glob '!build/**' --glob '!_build/**'"

" Seach project files (runs &FZF_DEFAULT_COMMAND)
nnoremap <silent> <C-p> :Files<CR>

" Seach in open buffers
nmap <leader>b :Buffers<CR>

" Seach in commands
nmap <leader>c :Commands<CR>

" Seach tags in buffer
nmap <leader>t :BTags<CR>

" Use ripgrep to seach in project
nmap <leader>/ :Rg<CR>

" Seach in git commits
nmap <leader>gc :Commits<CR>

" Git status in fzf window
nmap <leader>gs :GFiles?<CR>

" Seach history
nmap <leader>sh :History/<CR>

" show mapping on all modes with F1
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Use 30% of the bottom to show FZF results
let g:fzf_layout = { 'down': '~30%' }

" Use escpe to exit the FZF window
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" Use a different FZF command for this, maybe expand for other projects
" let $FZF_DEFAULT_COMMAND = "fd --type f --type l --exclude build --exclude _build --exclude __pycache__"
let $FZF_DEFAULT_OPTS=' --layout=reverse  --inline-info'

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Floating layout
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  " let height = float2nr(30)
  " let width = float2nr(120)
  let height = &lines / 2
  let width = float2nr(&columns - (&columns * 2 / 10))
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
