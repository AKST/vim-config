" removes white space and restore cursor
function! ClearTrailingWhiteSpace()
  normal! mz"
  %s/\s\+$//e
  normal! 'z"
endfunc

" augroup akst__kill_white_space
"   autocmd!
"   autocmd BufWritePre * call ClearTrailingWhiteSpace()
" augroup END

let ft_that_usetabs = ['make']

" restores expand if it has been effected by
" a process that turns it off in the background!!!
function! AKSTElimateTabs()
  if &filetype
    if index(ft_that_usetabs, &filetype) == -1
      if &expandtab == 0
        setlocal expandtab
        retab
        echo "expanding tabs"
      endif
    endif
  endif
endfunc

" augroup akst__reexpand_tabs
"   autocmd!
"   " it is important that these run
"   " before AKSTSetDefaultExpandtab
"   autocmd BufRead * setlocal expandtab
"   autocmd FileType make setlocal noexpandtab
"
"   " these commands handle whatever is resetting
"   " expandtab to noexpandtab
"   autocmd BufWritePre * call AKSTElimateTabs()
" augroup END

augroup akst__restore_cursor_on_reopen
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" augroup akst__terminal
"   autocmd!
"   " remove line numbers from terminals
"   " window, so it feels less like a buffer
"   " and more like a shell window
"   autocmd BufEnter term://* setlocal norelativenumber
" 
"   " when switching into a terminal window
"   " you can automatically start typing
"   autocmd BufEnter term://* startinsert
" augroup END

