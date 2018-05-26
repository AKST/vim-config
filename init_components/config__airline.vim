" Airline Characters
"
" unicode characters grabbed from here
"		https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
"
" left seperators
" let g:airline_left_sep=''
" let g:airline_left_alt_sep = ''

" allows airline to show up on a single split
set laststatus=2

" right seperators
" let g:airline_right_sep=''
" let g:airline_left_alt_sep = ''

" tab seprators
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = ' '
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline extensions
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
