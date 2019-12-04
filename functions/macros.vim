" macro decorate capital
" finds next occurence of capital word and decorates it with curly brackets
" Hello World -> {H}ello World
" usecase: bibtex
" \u: find next uppercase
map <leader>mdc /\u<CR>i{<ESC>lli}<ESC>
