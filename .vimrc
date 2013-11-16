" danirod's vimrc file
" --------------------------------------------------------------------/
" This is my vimrc file. Just grab whatever you want. Most of the
" settings are commented so that you can know what this is doing.
"
" TODO: Now that I'm learning how to use vim like a pro, I would like
"       to do some refactoring to this file and to my brand new .vim
"       folder already created. Maybe this will affect later revisions
"       of my dotfiles repository.

" Load Pathogen
execute pathogen#infect()
filetype plugin indent on

syntax on           " enable syntax colouring on source code files
set number          " show line numbers at the left (extremely useful!)
set colorcolumn=80  " display a column bar fixed at 80 character position
colorscheme github  " http://www.vim.org/scripts/script.php?script_id=2855

" 4 space indenting
set autoindent      " autoindent: inherit indenting from last line
set expandtab       " use spaces to indent when tab key is pressed
set shiftwidth=4    " each tab indents 4 spaces
set softtabstop=4   " makes spaces act as tabs, each tab is 4 spaces long

" The following settings only apply to GVIM
if has("gui_running")
    set guioptions-=T   " disable toolbar
    set guioptions-=r   " disable scrollbar (I just don't need it)
    " I gonna keep menu bar just in case. Even though I don't use it.

    " MonacoB font must be installed (https://github.com/vjpr/monaco-bold)
    " I only use GVIM at Linux so I only add settings for GTK2.
    " If you plan to use another system such as KVIM, GVIM for Windows or
    " GVIM for X11, just make sure you add your command here.
    if has("gui_gtk2") " GVIM
        set guifont=MonacoB\ 9
    else " fallback settings. 
        set guifont=MonacoB:h9:cDEFAULT
    endif
endif
