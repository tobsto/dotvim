" compile markdown
function! MarkdownCompile()
    silent !clear
    execute "! pandoc -f markdown -t latex -o " . bufname("%:r") . ".pdf " . bufname("%")
endfunction

" preview markdown
function! MarkdownPreview()
    silent !clear
    call MarkdownCompile
    execute "! evince " . bufname("%:r") . ".pdf &" 
endfunction
