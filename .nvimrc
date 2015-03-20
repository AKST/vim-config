" Angus Thomsens .vimrc

" load plugins
call plug#begin('~/.nvim/plugged')

Plug 'altercation/vim-colors-solarized'

" Plug 'bronson/vim-trailing-whitespace'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'ervandew/supertab'
Plug 'wting/rust.vim'
Plug 'Lokaltog/powerline'
Plug 'tmhedberg/SimpylFold'
Plug 'rking/ag.vim'
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'myusuf3/numbers.vim'
Plug 'juvenn/mustache.vim'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'kien/ctrlp.vim'
Plug 'JuliaLang/julia-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
" Plug 'bling/vim-airline'
Plug 'jmcantrell/vim-virtualenv'
Plug 'majutsushi/tagbar'
" Plug 'airblade/vim-gitgutter'
" Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'embear/vim-localvimrc'
Plug 'ekalinin/Dockerfile.vim'
Plug 'rollxx/vim-antlr'
Plug 'lukerandall/haskellmode-vim'
Plug 'Superbil/llvm.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gkz/vim-ls'
Plug 'tpope/vim-haml'
Plug 'mikewest/vimroom'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-classpath'
Plug 'dag/vim-fish'
Plug 'leafgarland/typescript-vim'
Plug 'idris-hackers/idris-vim'
Plug 'digitaltoad/vim-jade'
Plug 'raichoo/purescript-vim'

call plug#end()

" makes vim usable in fish shell
if &shell =~# 'fish$'
  set shell=sh
endif

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

set backspace=2                                     " sane backspace && normal backspace

set smartindent
set tabstop=2                                       " number of visual spaces per TAB
set softtabstop=2                                   " number of spaces in tab when editing
set shiftwidth=2                                    
set expandtab                                       " tabs are spaces
set wrap                                            " stops line breaks
set nowrap                                          " stops line wrapping
set sidescroll=5                                    " smoother screen wrapping
set listchars+=precedes:<,extends:>                 " indications of line  wrapping
set nu                                              " line numbers
set textwidth=80
set autoread

set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevel=10                                    " fold level open on file open

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

imap jk <Esc>

" when i accientally hold shift 
command W w
command Q q

" paste without overriding buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

" space as leader
let mapleader=" " 
" save session with ,s
nnoremap <leader>s :mksession<CR> 
" fuzzy text search 
nnoremap <leader>e :CtrlP

nnoremap <leader>n :NERDTree

" allows airline to show up on a single split 
set laststatus=2


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


" html related stuff
let g:html_indent_inctags = "html,body,head,tbody"  " indent these tags like every other tag 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


let g:syntastic_mode_map={ 
  \ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['handlebars', 'html', 'sass'] }

" so jsxhint is recongised as valid js
let g:syntastic_javascript_checkers = ['jsxhint --esnext']

" haskell shit
let g:haddock_browser="/Applications/Safari"

" Airline Characters
"
" unicode characters grabbed from here
" https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
"
" left seperators
let g:airline_left_sep=''
let g:airline_left_alt_sep = ''

" right seperators
let g:airline_right_sep=''
let g:airline_left_alt_sep = ''

" tab seprators
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = ' '

let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" airline extensions
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1


