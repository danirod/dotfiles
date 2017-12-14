" danirod's nvimrc settings
" Author and maintainer: Dani Rodríguez <dani@danirod.es>
"
" Hello, dear lurkers! Just remember at all times these are my settings.
" They fit my use cases but they are highly opinionated, specially when it
" comes to themes and appearances.

" Installs vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !curl -fLso ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
end

" vim-plug plugins
call plug#begin("~/.config/nvim/plugged/")

" Shell and commands.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " To-Do: try fzf
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'vimwiki/vimwiki'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Language and framework packs
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'elixir-editors/vim-elixir'

" Development tools
Plug 'editorconfig/editorconfig-vim'
Plug 'slashmili/alchemist.vim'
Plug 'racer-rust/vim-racer'

" Web Development
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'

" Colorschemes
Plug 'morhetz/gruvbox'

" vim-plug plugins
call plug#end()

" Disable aditional files.
set noswapfile " disable swapfiles (maybe a bad idea? 🤔)
set nobackup " disable backup files (use git)
set encoding=utf-8 " windows needs to be reminded about utf-8
set backspace=indent,eol,start " backspace will always work on insert mode

" Indent settings
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

" Lets you hide a modified and unsaved buffer when you attempt to open another.
" Default behaviour without this warns the user to save the current buffer.
" Subjective opinion: set hidden should've been ON by default.
set hidden

" Additional buffer settings
set nowrap
set showmatch

" Some programming languages work better when 2 spaces for tab is used...
autocmd FileType html,css,sass,scss,javascript setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2

" Enable colorschemes, but only if terminal supports so.
if &t_Co > 2 || has("gui_running")
    syntax on
    set colorcolumn=80
    silent! color gruvbox
    set background=dark
endif

" Line numberings and relative numberings
set number
set relativenumber
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>i

" Mark cursor lines and columns, but only if there are enough colors.
" (These settings don't look so pleasant when there are not enough colors).
if &t_Co >= 256 || has("gui_running")
    set cursorline
    set cursorcolumn
endif

" Mark trailing spaces.
if &t_Co >= 2 || has("gui_running")
    " Fancy highlighting for space groups.
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    " Fallback trailing system.
    set listchars=trail:~
    set list
endif

" Vsplits show the pipe character. Remove this behaviour.
set fillchars+=vert:\

" Leader. We're having fun.
let mapleader=","

" Switch active buffers.
 map <C-N>      :bnext<CR>
imap <C-N> <Esc>:bnext<CR>i
 map <C-P>      :bprev<CR>
imap <C-P> <Esc>:bprev<CR>i

" CtrlP
let g:ctrlp_map = '<Leader>,'

" vim-closetag
let g:closetag_filenames = "*.html,*.html.erb,*.xml"

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 250

" vim-gutter
highlight GitGutterAdd ctermbg=green ctermfg=green
highlight GitGutterRemove ctermbg=red ctermfg=red
highlight GitGutterChange ctermbg=cyan ctermfg=cyan

" NERDtree
map <Leader>nt :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=20

" ack
nnoremap <C-T> :Ack!<Space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
end

" vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki'}]
