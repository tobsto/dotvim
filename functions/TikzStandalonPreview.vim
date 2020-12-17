" compile tikz standalone
function! TikzCompile()
    silent !clear
    execute "! echo '\documentclass[crop,tikz]{standalone}\n \\\begin{document}'; cat " . bufname("%") . "; echo \\\end{document} | pdflatex"
endfunction

" preview markdown
function! TikzPreview()
    silent !clear
    call TikzCompile
    execute "! evince " . bufname("%:r") . ".pdf &" 
endfunction
