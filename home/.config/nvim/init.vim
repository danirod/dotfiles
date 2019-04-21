" Installs vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !curl -fLso ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
end

" vim-plug plugins
call plug#begin("~/.config/nvim/plugged/")
source $HOME/.config/nvim/plugins.vim
call plug#end()

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

" CtrlP
let g:ctrlp_map = '<Leader>,'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-gitgutter
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
if &t_Co >= 2
    " TODO: Decide if maybe changing DiffAdd/DiffChange/DiffDelete is better.
    highlight GitGutterAdd ctermfg=Green cterm=Bold
    highlight GitGutterDelete ctermfg=Red cterm=Bold
    highlight GitGutterChange ctermfg=Yellow
endif

" undotree
nmap <Leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=$HOME/.local/share/nvim/undo/
    set undofile
endif

" Buffergator
nmap <Leader>b :BuffergatorToggle<CR>

" NERDtree
map <Leader>nt :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=35

" tagbar
nmap <F8> :TagbarOpen fj<CR>
let g:tagbar_indent = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_width = 35

" ack
nnoremap <C-T> :Ack!<Space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
end

" vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki'}]

" deoplete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog='/home/danirod/opt/neovim-python/bin/python'
let g:deoplete#sources#jedi#show_docstring = 1
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory="~/.local/share/nvim/snippets/"

" deoplete-clang
" TODO: These routes are hardcoded to work with macOS. What about Linux / BSD?
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang/9.1.0/include'
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_c_config_file = '.syntastic_c_config'
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" echodoc
let g:echodoc_enable_at_startup = 1

" indentline
let g:indentLine_concealcursor=0

" bookmarks
nmap <Leader>bm <Plug>BookmarkToggle
nmap <Leader>bi <Plug>BookmarkAnnotate
nmap <Leader>ba <Plug>BookmarkShowAll
nmap <Leader>bj <Plug>BookmarkNext
nmap <Leader>bk <Plug>BookmarkPrev
nmap <Leader>bc <Plug>BookmarkClear
nmap <Leader>bx <Plug>BookmarkClearAll
nmap <Leader>bkk <Plug>BookmarkMoveUp
nmap <Leader>bjj <Plug>BookmarkMoveDown
nmap <Leader>bg <Plug>BookmarkMoveToLine

" markdown + vim-markdown
let g:vim_markdown_frontmatter = 1
autocmd FileType markdown set breakindent wrap linebreak

" devicons
let g:lightline = {
      \ 'colorscheme': 'PaperColor_dark',
      \ 'active': {
      \    'left': [ [ 'mode', 'paste' ],
      \              [ 'readonly', 'filename', 'modified' ] ],
      \    'right': [ [ 'lineinfo' ],
      \               [ 'percent' ],
      \               [ 'gitbranch', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filetype': 'LightlineFileTypeDevIcon',
      \   'fileformat': 'LightlineFileFormatDevIcon',
      \   'gitbranch': 'fugitive#head',
      \ }
      \ }

function! LightlineFileTypeDevIcon()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileFormatDevIcon()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
