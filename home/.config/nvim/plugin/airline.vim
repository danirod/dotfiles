" disable webicons on airline because it breaks if i customize the sections.
" (I'll manually call webicons function where it makes sense on filetype).
let g:webdevicons_enable_airline_statusline = 0

" airline
let g:airline_powerline_fonts = 0
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1
function! AirlineInit()
    let g:airline_section_b = airline#section#create([])
    let g:airline_section_x = airline#section#create(['branch'])
    let g:airline_section_y = airline#section#create(['%{WebDevIconsGetFileTypeSymbol()} ', 'filetype'])
    let g:airline_section_z = airline#section#create(['%l:%c'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
