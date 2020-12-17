" macro decorate capital
" finds next occurence of capital word and decorates it with curly brackets
" Hello World -> {H}ello World
" usecase: bibtex
" \u: find next uppercase
map <leader>mdc /\u<CR>i{<ESC>lli}<ESC>
" delete all buffers but one
command! BufOnly silent! execute "%bd|e#|bd#"
" remove latex comment at end of line
map <leader>rc 0/%<CR>d$
" one sentence per line
command! -range=% OneSentencePerLine :<line1>,<line2> s/\n/ /g | s/  / /g | s/\. /\.\r/g

