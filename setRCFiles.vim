"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set rcfiles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! SetRCFiles()
    let cwd = getcwd()
    if filereadable('.pylintrc')
        let g:rcfile_pylint=cwd . '/.pylintrc'
    elseif filereadable('/../.pylintrc')
        let g:rcfile_pylint=cwd . '/../.pylintrc'
    elseif filereadable('/../../.pylintrc')
        let g:rcfile_pylint=cwd . '/../../.pylintrc'
    elseif filereadable('$HOME/.pylintrc')
        let g:rcfile_pylint='$HOME/.pylintrc'
    else
        let g:rcfile_pylint=''
    endif   
endfunction
