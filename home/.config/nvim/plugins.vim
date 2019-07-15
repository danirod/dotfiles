" Vim productivity
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-obsession'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Language definitions.
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Language productivity
" Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'leafgarland/typescript-vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/echodoc.vim'
Plug 'michaeljsmith/vim-indent-object' " Let's be honest, this is written with python in mind
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

" Python productivity pack
Plug 'tmhedberg/SimpylFold', { 'for': ['python'] }
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }

" C productivity pack
Plug 'zchee/deoplete-clang', { 'for': ['c', 'c++'] }

" Go productivity pack
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Markdown productivity pack
Plug 'plasticboy/vim-markdown'

" Eye candy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'jeffkreeftmeijer/vim-dim'
