" when i accientally hold shift
command! W w
command! Q q

function! ToggleVerboseLogs()
  if !&verbose
    set verbosefile=~/.log/nvim/verbose.log
    set verbose=15
  else
    set verbosefile=
    set verbose=0
  endif
endfunction


