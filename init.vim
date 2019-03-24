" Angus Thomsens .vimrc

" load plugins
call plug#begin('~/.nvim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THEME Plugins

Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/powerline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONFIG Plugins

Plug 'embear/vim-localvimrc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML Templating Plugins

Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-haml'
Plug 'digitaltoad/vim-jade'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMPLETE Plugins

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ervandew/supertab'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH / AUTOCOMPLETE / NAVIGATION / FORMAT Plugins

Plug 'myusuf3/numbers.vim' " line numbers
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmhedberg/SimpylFold' " formatting
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT Plugins

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = ANTLR Plugins

Plug 'rollxx/vim-antlr'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = CLOJURE Plugins

Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = C++ / C Plugins

Plug 'octol/vim-cpp-enhanced-highlight'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Dockerfile Plugins

Plug 'ekalinin/Dockerfile.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Erlang / Exilir Plugins

Plug 'elixir-lang/vim-elixir'
Plug 'vim-erlang/vim-erlang-skeletons'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Fish Plugins

Plug 'dag/vim-fish'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = GLSL Plugins

Plug 'tikhomirov/vim-glsl'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Haskell / Idris / Purescipt Plugins

Plug 'lukerandall/haskellmode-vim'
Plug 'idris-hackers/idris-vim'
Plug 'raichoo/purescript-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = JAVA / SCALA Plugins

Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'tpope/vim-classpath'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = JS / TS / LIVESCRIPT / COFFEESCRIPT Plugins

Plug 'neoclide/vim-jsx-improve'
Plug 'flowtype/vim-flow'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'gkz/vim-ls' " livescript
Plug 'jbgutierrez/vim-babel'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Julia Plugins

Plug 'JuliaLang/julia-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = LLVM Plugins

Plug 'Superbil/llvm.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Markdown Plugins

Plug 'plasticboy/vim-markdown'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Protobuf Plugins

Plug 'uarun/vim-protobuf'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Python Plugins

Plug 'jmcantrell/vim-virtualenv'
Plug 'tshirtman/vim-cython'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Rust / CPP Plugins

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE = Toml Plugins

Plug 'cespare/vim-toml'

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

