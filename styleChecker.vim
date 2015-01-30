" ############################################################################
" ### TIGL syntax checker
" ############################################################################
function! CheckStyle(errornumber)
    execute 'silent!' . 'write'
    let errmsg = system("python $HOME/.vim/styleChecker/styleChecker.py -f " . expand("%") . " -e" . " " . a:errornumber)
    if errmsg =~ "style check successful"
       echo "style check successful" 
    elseif errmsg =~ "style check error"
       echom errmsg
    else
        let errmsgs = split(errmsg, ",")
        " echo errline
        let goToLine = 'normal!' . errmsgs[1] . 'G'
        execute goToLine
        let goToColumn = 'normal!' . errmsgs[2] . '|'
        execute goToColumn
        echom "Style error in line " . errmsgs[1] . ",  column " errmsgs[2] . " : " . errmsgs[3] . " : " . errmsgs[4]
    endif
endfunction
command! CheckStyle call CheckStyle(1)
command! -nargs=1 CheckStyleNext call CheckStyle(<f-args>)

