" autoloads the plug lmao, doesn't really do much else
function! canva#load(...)
endfunction

" finds the features definition of the currently highlighted copy
function! canva#GotoFeatureDefinition()
  " get the content of the current line
  let current_line = getline(getcurpos()[1])

  " get the description of the step
  let step_match = matchlist(current_line, '\(When\|Then\|And\) \(.\+\)$')
  if len(step_match) < 2
    echom 'Excuse me 😡 The current line is not a feature test line! smh...'
    return
  endif
  let step_description = step_match[2]


  " find the file the step is defined in
  let command_str =
    \ 'find src -name "*.steps.ts" -type f -exec grep -l "'
    \ . step_description
    \ . '" {} +'
  let files = system(command_str)
  if empty(files)
    echom 'could not find file'
    return
  endif

  let [matched_file] = split(files, ' ')
  " goes to the
  execute 'split ' . matched_file
  " goes to the step in file we've just opened.
  execute '/' . step_description
  " centers the screen around the cursor if the file is
  " larger than the screen
  normal! zz
endfunction
