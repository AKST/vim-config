" Angus Thomsens .vimrc
"
" load plugins
call pathogen#infect()

" syntax highlighing
syntax enable
colorscheme solarized
set bg=dark

" ignore stuff for nerd tree
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']


filetype indent on                                  " Enable indent specfic for files
filetype plugin on 
filetype plugin indent on                           " Enable filetype detection

" kills trailing whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

set backspace=2         " sane backspace && normal backspace

set smartindent
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set shiftwidth=2        
set expandtab           " tabs are spaces
set wrap
set nu                  " line numbers
set textwidth=80
set autoread

set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevel=10        " fold level open on file open

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

set showcmd             " show command in bottom bar
set cursorline          " highligh current line
set wildmenu            " visual autocomplete for command menu           
set lazyredraw          " redraw only when we need to.

" search 
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" color stuff

" imap ;; <Esc>
imap jk <Esc>
imap kj <Esc>

" when i accientally hold shift 
command W w
command Q q

" space as leader
let mapleader=" " 
" save session with ,s
nnoremap <leader>s :mksession<CR> 
" search file/s :Ag /pattern/ dir/file
nnoremap <leader>a :Ag 
" fuzzy text search 
nnoremap <leader>e :CtrlP

" allows airline to show up on a single split 
set laststatus=2

" Airline Characters
"
" unicode characters grabbed from here
" https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
"
" left seperators
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_left_sep='⮀'
let g:airline_left_alt_sep = '⮁'

" right seperators
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_right_sep='⮂'
let g:airline_left_alt_sep = '⮃'

" tab seprators
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⮁ '

let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" airline extensions
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" html related stuff
let g:html_indent_inctags = "html,body,head,tbody"  " indent these tags like every other tag 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
