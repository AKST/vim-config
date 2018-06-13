" CtrlP settings

let ignored_dirs = []

call add(ignored_dirs, '.git')
call add(ignored_dirs, '.svn')

call add(ignored_dirs, '__pycache__')
call add(ignored_dirs, 'translations')
call add(ignored_dirs, 'node_modules')
call add(ignored_dirs, 'bower_components')
call add(ignored_dirs, 'flow-typed')
call add(ignored_dirs, 'target')
call add(ignored_dirs, 'dist')
call add(ignored_dirs, 'tmp')

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

let g:ctrlp_user_command = 'ag %s '
for ignored_directory in ignored_dirs
  let ignore_flag = ' --ignore-dir="' . ignored_directory . '" '
  let g:ctrlp_user_command = g:ctrlp_user_command . ignore_flag
endfor
let g:ctrlp_user_command = g:ctrlp_user_command . ' -l --nocolor --hidden -g ""'
