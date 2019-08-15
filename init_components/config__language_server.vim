set hidden

let g:LanguageClient_serverCommands = {
\  'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
\  'typescript': ['typescript_language_server_path', '--stdio'],
\  'typescript.tsx': ['typescript_language_server_path', '--stdio']
\}

let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
