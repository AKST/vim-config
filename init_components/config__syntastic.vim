let g:syntastic_mode_map={
  \ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['handlebars', 'html', 'sass'] }

" so jsxhint is recongised as valid js
let g:syntastic_javascript_checkers = ['jsxhint --esnext']
let g:syntastic_javascript_checkers = ['jsxhint --esnext']
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

" add freaking c++ 11 baby
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
