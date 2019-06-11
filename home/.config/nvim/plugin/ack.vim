" ack
nnoremap <C-T> :Ack!<Space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
end
