" undotree
nmap <Leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=$HOME/.local/share/nvim/undo/
    set undofile
endif
