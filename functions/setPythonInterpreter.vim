"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" set python interpreter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function! SetPythonInterpreter()
    let g:python_interpreter = system('which python3')[:-2]
endfunction
