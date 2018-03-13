" Angus Thomsens .vimrc

" load plugins
call plug#begin('~/.nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'tikhomirov/vim-glsl'
Plug 'lumiliet/vim-twig'
"
" Plug 'bronson/vim-trailing-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'neovimhaskell/haskell-vim'
Plug 'lukerandall/haskellmode-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'mattn/webapi-vim'
Plug 'jbgutierrez/vim-babel'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
" Plug 'mtscout6/vim-cjsx'
" Plug 'nikvdp/ejs-syntax'
Plug 'cespare/vim-toml'

" Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'uarun/vim-protobuf'

" Plug 'othree/yajs.vim'
Plug 'neoclide/vim-jsx-improve'
Plug 'flowtype/vim-flow'

" Plug 'hail2u/vim-css3-syntax'
" Plug 'stephenway/postcss.vim'
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
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
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
"
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
" Plug 'airblade/vim-gitgutter'

call plug#end()

" space as leader
let mapleader=" "

" makes vim usable in fish shell
if &shell =~# 'fish$'
  set shell=sh
endif

" syntax highlighing
syntax enable
colorscheme solarized
set bg=dark

" Enable indent specfic for files
filetype indent on

" Enable indent specfic from plugin
filetype plugin on
filetype plugin indent on

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
" set lazyredraw

" searches as characters are entered
set incsearch

" highlight matches
set hlsearch

" tabs are 2 spaces
set tabstop=2 shiftwidth=2 expandtab


for file in split(glob('~/.config/nvim/init_components/*.vim'), '\n')
  exe 'source' file
endfor

