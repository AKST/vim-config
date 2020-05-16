set hidden

" Nesting the call to system inside substitute will strip
" away any excesss whitespace wrapping the output, which
" is occastionally an issue with the output of `system`.
let typescript_language_server_path =
  \ substitute(system('which typescript-language-server'), '^\(.\{-}\)\n$', '\1', '')

let g:LanguageClient_serverCommands = {
\  'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
\  'typescript': ['typescript-language-server', '--stdio'],
\  'typescript.tsx': ['typescript-language-server', '--stdio']
\}

let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
