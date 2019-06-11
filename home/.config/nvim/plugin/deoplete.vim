" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete-clang
" TODO: These routes are hardcoded to work with macOS. What about Linux / BSD?
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang/9.1.0/include'
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
