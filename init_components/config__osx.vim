" Sets the vim background to light if running in light mode, otherwise sets
" the background to dark mode if running in dark mode.

if has('macunix')
  let js_command = 'Application(''System Events'').appearancePreferences.darkMode()'
  let os_appearance = system('osascript -l JavaScript -e "' . js_command . '"')

  " This removes the null character from the end of the output from 'system',
  " whose ouput has trailing nulls.
  let remove_trailing_null = substitute(os_appearance, '\n\+$', '', '')

  if remove_trailing_null ==# "true"
    set background=dark
  else
    set background=light
  endif
endif
