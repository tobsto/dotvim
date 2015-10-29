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
    let parg = ''
    if filereadable('/proc/cpuinfo')
        let parg = ' -j '.(system('grep -c ^processor /proc/cpuinfo')+1)
    endif
    let &makeprg = &makeprg . parg
endfunction
