"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set rcfiles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! SetRCFiles()
    let cwd = getcwd()
    let home = $HOME
    if filereadable(cwd .'/.pylintrc')
        let g:rcfile_pylint=cwd . '/.pylintrc'
    elseif filereadable(cwd .'/../.pylintrc')
        let g:rcfile_pylint=cwd . '/../.pylintrc'
    elseif filereadable(cwd .'/../../.pylintrc')
        let g:rcfile_pylint=cwd . '/../../.pylintrc'
    elseif filereadable(cwd .'/dev_tools/conf/.pylintrc')
        let g:rcfile_pylint=cwd . '/dev_tools/conf/.pylintrc'
    elseif filereadable(home . '/.pylintrc')
        let g:rcfile_pylint=home .'/.pylintrc'
    else
        let g:rcfile_pylint=''
    endif   
endfunction
