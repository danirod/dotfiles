" Dani's .vimrc file

" pathogen
execute pathogen#infect()
filetype plugin indent on

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

" Requires having GitHub theme installed:
" www.vim.org/scripts/script.php?script_id=2855
colorscheme github

" Disable menu, toolbar, scrollbar on gVim by default
set guioptions-=m
set guioptions-=T
set guioptions-=r
