let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]

"
let g:startify_files_number = 5

" Save sessions dir
let g:startify_session_dir = '~/.config/nvim/session'

" Bookmarks
let g:startify_bookmarks = [
      \ {'c': '~/.config/nvim/init.vim'},
      \ '~/.zshrc',
      \ '~/.config/awesome/',
      \ ]

" Seek to git root dir
let g:startify_change_to_vcs_root = 1

