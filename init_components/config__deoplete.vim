" ensure deoplete is running from start up
let g:deoplete#enable_at_startup = 1

" this config here is largely influenced by this article here
" > https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/

" ensures that deoplete utlizes omni patterns
if !exists('g:deoplete#omni#input_patterns')
  " let g:deoplete#omni#input_patterns = {}
endif

" adds supertab like functionality to deoplete by adding tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"

" automatically closes the scratch window at the top of the vim window
" on finishing a complete or leaving insert. If you don’t have something
" like this set, you’ll have to manually close it with :pc, :pclose or :q
" with the preview window active.
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
