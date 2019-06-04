"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set rcfiles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! getPylintRCFile()
    let cwd = getcwd()
    if filereadable('.pylintrc')
        let rcfile_pylint=cwd . '/.pylintrc'
    elseif filereadable('$HOME/.pylintrc')
        let rcfile_pylint='$HOME/.pylintrc'
    else
        let rcfile_pylint=''
    endif   
    return rcfile_pylint
endfunction
