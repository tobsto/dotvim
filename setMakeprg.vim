"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set makeprg variable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! SetMakePrg()
    let cwd = getcwd()
    if isdirectory(cwd . '/../build')
        set makeprg=make\ -C\ ../build
    elseif isdirectory(cwd . '/../../build')
        set makeprg=make\ -C\ ../../build
    elseif isdirectory(cwd . '/build')
        set makeprg=make\ -C\ build
    else
        set makeprg=make
    endif
endfunction
