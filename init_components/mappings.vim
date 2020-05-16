" quickly resizes the window
nnoremap <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Creates a fish shell
nnoremap <Leader>f :terminal fish<CR>

" maps jk to Esc
inoremap jk <Esc>
tnoremap <ESC> <C-\><C-n>

" exit out of terminal more easily
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>l <C-\><C-n><C-w>l

" switch between windows easier
nnoremap <C-w>H :tabp<CR>
nnoremap <C-w>L :tabn<CR>
tnoremap <C-w>H <C-\><C-n>:tabp<CR>
tnoremap <C-w>L <C-\><C-n>:tabn<CR>

if executable('rg')
  nnoremap <Leader>e :RG<CR><space>
else
  nnoremap <leader>e :FZF<CR>
endif

" file system viewer
nnoremap <leader>n :NERDTreeToggle<CR>

" view tags
nnoremap <Leader>b :TagbarToggle<CR>

" save
nnoremap <Leader>w :w<CR>

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


nnoremap <Leader>l :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

