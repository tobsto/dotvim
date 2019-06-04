"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set makeprg variable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! SetMakePrg()
    let cwd = getcwd()
    if filereadable('makefile')
        set makeprg=make
    elseif filereadable('Makefile')
        set makeprg=make
    else
        if isdirectory(cwd . '/../build')
            set makeprg=make\ -C\ ../build
        elseif isdirectory(cwd . '/../../../build')
            set makeprg=make\ -C\ ../../build
        elseif isdirectory(cwd . '/../../build')
            set makeprg=make\ -C\ ../../build
        elseif isdirectory(cwd . '/build')
            set makeprg=make\ -C\ build
        else
            set makeprg=make
        endif
    endif
    let parg = ''
    if filereadable('/proc/cpuinfo')
        let parg = ' -j '.(system('grep -c ^processor /proc/cpuinfo')+1)
    endif
    let &makeprg = &makeprg . parg
endfunction
