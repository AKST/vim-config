" Angus Thomsens .vimrc

" load plugins
call plug#begin('~/.nvim/plugged')

Plug 'altercation/vim-colors-solarized'

" Plug 'bronson/vim-trailing-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neovimhaskell/haskell-vim'
Plug 'facebook/vim-flow'
Plug 'mattn/webapi-vim'
Plug 'jbgutierrez/vim-babel'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'mtscout6/vim-cjsx'
Plug 'ervandew/supertab'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'Lokaltog/powerline'
Plug 'tmhedberg/SimpylFold'
Plug 'rking/ag.vim'
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'myusuf3/numbers.vim'
Plug 'tshirtman/vim-cython'
Plug 'mustache/vim-mustache-handlebars'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'kien/ctrlp.vim'
Plug 'JuliaLang/julia-vim'
Plug 'Hydrotoast/vim-gss'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'mphe/grayout.vim'
" Plug 'bling/vim-airline'
Plug 'jmcantrell/vim-virtualenv'
Plug 'majutsushi/tagbar'
" Plug 'bitc/lushtags'
" Plug 'airblade/vim-gitgutter'
" Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'embear/vim-localvimrc'
Plug 'ekalinin/Dockerfile.vim'
Plug 'rollxx/vim-antlr'
" Plug 'lukerandall/haskellmode-vim'
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
Plug 'ntpeters/vim-better-whitespace'

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
let NERDTreeIgnore=[]
call add(NERDTreeIgnore, '\.pyc')
call add(NERDTreeIgnore, '\~$')
call add(NERDTreeIgnore, '\.swo$')
call add(NERDTreeIgnore, '\.swp$')
call add(NERDTreeIgnore, '\.git$')
call add(NERDTreeIgnore, '\.hg')
call add(NERDTreeIgnore, '\.svn')
call add(NERDTreeIgnore, '\.bzr')
call add(NERDTreeIgnore, '\.so')
call add(NERDTreeIgnore, '\.o')



filetype indent on                                  " Enable indent specfic for files
filetype plugin on 
filetype plugin indent on                           " Enable filetype detection

" kills trailing whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

" sane backspace && normal backspace
set backspace=2
set ruler
set smartindent

" number of spaces in tab when editing
set softtabstop=2

set nolinebreak
set nowrap

" smoother screen wrapping
set sidescroll=5

" indications of line  wrapping
set listchars+=precedes:<,extends:>

set nu
set textwidth=80
set autoread

set foldmethod=indent
set foldnestmax=10
set foldenable

" fold level open on file open
set foldlevel=10

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

" show command in bottom bar
set showcmd

" highligh current line
set cursorline

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to.
set lazyredraw


" searches as characters are entered
set incsearch

" highlight matches
set hlsearch

" tabs are 2 spaces
set tabstop=2 shiftwidth=2 expandtab

" Restore cursor position on reopen
autocmd! BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" maps jk to Esc
inoremap jk <Esc>

" maps jk to Enter Edit mode
tnoremap jk <C-\><C-n>

" when i accientally hold shift
command! W w
command! Q q

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

" fuzzy text search
nnoremap <leader>e :CtrlP<CR>

" file system viewer
nnoremap <leader>n :NERDTreeToggle<CR>

" view tags
nnoremap <Leader>b :TagbarToggle<CR>

" save
nnoremap <Leader>w :w<CR>

" quickly resizes the window
nnoremap <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Creates a fish shell
nnoremap <Leader>f :terminal fish<CR>

" allows airline to show up on a single split
set laststatus=2


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s --ignore-dir=".git" --ignore-dir="bower_components" --ignore-dir="node_modules" -l --nocolor --hidden -g ""'


" indent these tags like every other tag
let g:html_indent_inctags = "html,body,head,tbody"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


let g:syntastic_mode_map={
  \ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['handlebars', 'html', 'sass'] }

" so jsxhint is recongised as valid js
let g:syntastic_javascript_checkers = ['jsxhint --esnext']
let g:syntastic_javascript_checkers = ['jsxhint --esnext']
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

" haskell shit
let g:haddock_browser="/Applications/Safari"

" Airline Characters
"
" unicode characters grabbed from here
"		https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
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

" adds ctags for haskell code
" if executable('lushtags')
"     let g:tagbar_type_haskell = {
"         \ 'ctagsbin' : 'lushtags',
"         \ 'ctagsargs' : '--ignore-parse-error --',
"         \ 'kinds' : [
"             \ 'm:module:0',
"             \ 'e:exports:1',
"             \ 'i:imports:1',
"             \ 't:declarations:0',
"             \ 'd:declarations:1',
"             \ 'n:declarations:1',
"             \ 'f:functions:0',
"             \ 'c:constructors:0'
"         \ ],
"         \ 'sro' : '.',
"         \ 'kind2scope' : {
"             \ 'd' : 'data',
"             \ 'n' : 'newtype',
"             \ 'c' : 'constructor',
"             \ 't' : 'type'
"         \ },
"         \ 'scope2kind' : {
"             \ 'data' : 'd',
"             \ 'newtype' : 'n',
"             \ 'constructor' : 'c',
"             \ 'type' : 't'
"         \ }
"     \ }
" endif

let g:rust_recommended_style = 0

" ctags

let g:tagbar_type_rust = {
   \ 'ctagstype' : 'rust',
   \ 'kinds' : [
       \'T:types,type definitions',
       \'f:functions,function definitions',
       \'g:enum,enumeration names',
       \'s:structure names',
       \'m:modules,module names',
       \'c:consts,static constants',
       \'t:traits,traits',
       \'i:impls,trait implementations',
   \]
   \}

" add freaking c++ 11 baby
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
