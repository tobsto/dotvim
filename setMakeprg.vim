"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set makeprg variable
"
" set to 'make' if 'pwd/../build' is not existent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! SetMakePrg()
    let cwd = getcwd()
    if isdirectory(cwd . '/../build')
        set makeprg=make\ -C\ ../build
    else
        set makeprg=make
    endif
endfunction
