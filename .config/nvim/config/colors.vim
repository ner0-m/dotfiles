" Use term GUI colors
if (has("termguicolors"))
  set termguicolors
endif

" Oceanic has support for bold and italic
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

let g:tokyonight_style = "night"
colorscheme tokyonight

" Unset the spelling as it's read in tokyonight and that just looks aweful 
hi clear SpellBad 
hi SpellBad gui=underline

