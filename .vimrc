" Dani's .vimrc file

syntax on       " enable syntax colouring on source code files
set number      " show line numbers at the left (extremely useful!)

" 4-space indenting.
set autoindent " autoindent: inherit indenting from last line
set expandtab "  use spaces to indent when tab key is pressed
set shiftwidth=4 " each tab indents 4 spaces
set softtabstop=4 " makes spaces act as tabs, each tab is 4 spaces long

" Color column @ 80 chars right
set colorcolumn=80
hi ColorColumn ctermbg=cyan
