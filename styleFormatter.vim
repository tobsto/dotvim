" ############################################################################
" ### TIGL style formatter
" ############################################################################
function! FormatCode()
    execute 'silent!' . 'write'
    let errmsg = system("astyle --options=$HOME/.vim/styleChecker/astyle.config " . expand("%"))
    execute 'edit ' . expand("%")
endfunction
command! FormatCode call FormatCode()

