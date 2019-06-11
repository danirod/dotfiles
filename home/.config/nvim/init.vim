" Installs vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !curl -fLso ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
end

" vim-plug plugins
call plug#begin("~/.config/nvim/plugged/")
source $HOME/.config/nvim/plugins.vim
call plug#end()

" Set the host environment for Python
let g:python_host_prog  = simplify( stdpath('data') . '/python2/bin/python' )
let g:python3_host_prog = simplify( stdpath('data') . '/python3/bin/python' )

" Disable aditional files.
set noswapfile " disable swapfiles (maybe a bad idea? 🤔)
set nobackup " disable backup files (use git)
set encoding=utf-8 " windows needs to be reminded about utf-8
set backspace=indent,eol,start " backspace will always work on insert mode

" Indent settings
set autoindent
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4

" Buffer settings
set hidden
set nowrap
set showmatch
set noshowmode

" Some programming languages work better when 2 spaces for tab is used...
autocmd FileType python setlocal tw=79

" Enable colorschemes, but only if terminal supports so.
if &t_Co > 2 || has("gui_running")
    syntax on
    set background=dark
    set colorcolumn=80

    " Less aggresisve colour for the colorcolumn background.
    highlight ColorColumn ctermbg=0 ctermfg=8 cterm=reverse
endif

" Line numberings and relative numberings
set number
set relativenumber
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>i

" Mark cursor lines and columns, but only if there are enough colors.
" (These settings don't look so pleasant when there are not enough colors).
if &t_Co >= 256
    set cursorline

    " Custom color configuration.
    highlight CursorLine cterm=underline ctermbg=NONE
    highlight Folded cterm=reverse ctermfg=8 ctermbg=0
    highlight TabLineFill cterm=reverse ctermfg=8 ctermbg=0
    highlight LineNr ctermfg=8
endif

" Mark trailing spaces.
if &t_Co >= 2
    " Fancy highlighting for space groups.
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    " Fallback trailing system.
    set listchars=trail:~
    set list
endif

" Make the vertical separator between panes a continuous vertical line.
" NOTE! The font must support this character to make it look continuous.
" Otherwise, the vertical bar will have little gaps in between lines.
set fillchars+=vert:\│
highlight VertSplit guibg=NONE cterm=NONE ctermbg=NONE

" Leader. We're having fun.
let mapleader=","

" Switch active buffers.
 map <C-N>      :bnext<CR>
imap <C-N> <Esc>:bnext<CR>i
 map <C-P>      :bprev<CR>
imap <C-P> <Esc>:bprev<CR>i

" Folding settings: global and particular for specific plugins.
nmap <Space> za
let g:SimpylFold_docstring_preview = 1

if &t_Co >= 2
    " TODO: Decide if maybe changing DiffAdd/DiffChange/DiffDelete is better.
    highlight GitGutterAdd ctermfg=Green cterm=Bold
    highlight GitGutterDelete ctermfg=Red cterm=Bold
    highlight GitGutterChange ctermfg=Yellow
endif
