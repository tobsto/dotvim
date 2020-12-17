" compile tikz standalone
function! TikzCompile()
    silent !clear
    execute '! echo "\documentclass[crop,tikz]{standalone}\n \\\begin{document}" > temp.tex; cat ' . bufname("%") . ' >> temp.tex; echo "\\\end{document}" >> temp.tex; pdflatex temp.tex'
endfunction

" preview markdown
function! TikzPreview()
    silent !clear
    call TikzCompile
    execute "! evince temp.pdf &"
endfunction
