" ############################################################################
" ### General Vim options
" ############################################################################
" change indent to 4
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab

" swap/undo/backup
set undofile
set history=500
set undolevels=500
set undodir=~/.vim/tmp/undo
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap
set backup

" show cursor line and column in the status line
set ruler

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set smartcase search (warning: affects searches AND substitutions s/././; use 'set noic' to override)
set ignorecase
set smartcase

" auto indent and smart indent
set ai
set si
set cindent

" scrolling
set scrolloff=4 " always show 4 lines at the edge when moving the cursor
set sidescrolloff=7 " always show 7 columns at the edge when moving the cursor
set sidescroll=1 " for fast terminals

" allow buffer switch without saving
set hidden
" conveniently access buffers
set wildchar=<Tab> wildmenu wildmode=full
" ############################################################################
" ### External functions
" ############################################################################
" set rcfile 
" this sets the 'rcfile_pylint' variable
source ~/.vim/functions/setRCFiles.vim
call SetRCFiles()

" set make command to use parent build directory
" this sets the 'make' command (which folder to exectute in)
source ~/.vim/functions/setMakeprg.vim
call SetMakePrg()

" set python interpreter
" this sets the 'python_interpreter' variable
source ~/.vim/functions/setPythonInterpreter.vim
call SetPythonInterpreter()

" define 'ToogleSpellCheck' function
source ~/.vim/functions/ToogleSpellCheck.vim

" define 'MarkdownPreview' function
source ~/.vim/functions/MarkdownPreview.vim

" define 'TikzPreview' function
source ~/.vim/functions/TikzPreview.vim

" other macros
source ~/.vim/functions/macros.vim
" ############################################################################
" ### Plugins
" ############################################################################
call plug#begin('~/.vim/plugins')

    " Auto completion browser
    Plug('valloric/YouCompleteMe')
    " File browser
    Plug('scrooloose/nerdtree')
    Plug('jistr/vim-nerdtree-tabs')
    " Fuzzy file search
    Plug('kien/ctrlp.vim')
    " Snippets engine
    Plug('SirVer/ultisnips')
    " Snippets
    Plug('honza/vim-snippets')
    " Make YCM and UltiSnips work together
    Plug('ervandew/supertab')
    " Syntax checker
    Plug('w0rp/ale')
    " Find pattern in files (requires ag=the_silver_searcher)
    Plug('rking/ag.vim')
    " Source code Browser
    Plug('vim-scripts/taglist.vim')
    " Status line
    Plug('bling/vim-airline')
    " Git
    Plug('tpope/vim-fugitive')
    " surround code with parentheses, quotes, etc
    Plug('tpope/vim-surround')
    " sophisticated undo
    Plug('sjl/gundo.vim')
    " sophisticated search and replace
    Plug('tpope/vim-abolish')
    " most recently used files
    Plug('vim-scripts/mru.vim')
    " Save vim session
    Plug('xolox/vim-misc')
    Plug('xolox/vim-session')
    " color themes
    "Plug('flazz/vim-colorschemes')
    Plug('rafi/awesome-vim-colorschemes')
    " comment/uncommend code
    Plug('scrooloose/nerdcommenter')

    " python indentation
    Plug('vim-scripts/indentpython.vim')
    " increment columns
    Plug('vim-scripts/VisIncr')
    " sort python imports
    Plug('fisadev/vim-isort')
    " python autoformat
    Plug('Chiel92/vim-autoformat')
    " latex plugin
    Plug('lervag/vimtex')
    " conda env support
    Plug('cjrh/vim-conda')
    " one sentence per line formatting
    Plug('Konfekt/vim-sentence-chopper')

call plug#end()

" ############################################################################
" ### Key mappings
" ############################################################################
" page up page down with c-j and c-k
map <c-k> <PageUp>
map <c-j> <PageDown>
" set leader key to ','
let mapleader=','
" set localleader key to ','
let maplocalleader=','
" Open and close NERDTree with F2 or ,n
map <F2> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
" Open and close Taglist with F3 or ,t
map <F3> :TlistToggle<CR>
map <leader>t :TlistToggle<CR>
" Open and close Gundo with F4 or ,u
map <F4> :GundoToggle<CR>
map <leader>u :GundoToggle<CR>
" Open Ag with F5 or ,f
map <F5> :Ag!<CR>
map <leader>f :Ag!<CR>
" Open Ag with F6 or ,r
map <F6> :MRU<CR>
map <leader>r :MRU<CR>
" Set paste mode toggle to ,p
set pastetoggle=<leader>p

" YouCompleteMe shortcuts
map <leader>yc :YcmForceCompileAndDiagnostics<CR>
map <leader>yg :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>yd :YcmDebugInfo<CR>

" Cycle through buffers easily
:nnoremap <C-l> :bnext<CR>
:nnoremap <C-h> :bprevious<CR>

" yank word under cursor
:noremap <bvey> <leader>w<CR>

" map parallel make command to ,m
map <leader>m :w <bar> make -j 16<CR>
" map parallel make install command to ,i
map <leader>i :w <bar> make -j 16 install<CR>

" spellcheck
:map <leader>se :setlocal spelllang=en_us<CR>
:map <leader>sb :setlocal spelllang=en_gb<CR>
:map <leader>sg :setlocal spelllang=de_de<CR>
" ############################################################################
" ### Options for Session Plugin
" ############################################################################
" Disable autoload of default session
let g:session_autoload = 'no'
let g:session_directory = '~/.vim/tmp/sessions/'

"###############################################################################
"### Options for YouCompleteMe Plugin
"###############################################################################
"let g:ycm_path_to_python_interpreter=python_interpreter
let g:ycm_python_binary_path=python_interpreter
let g:ycm_key_detailed_diagnostics='<leader>yi'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" for python
let g:ycm_semantic_triggers = {'python': ['re!from\s+\S+\s+import\s']}

" ############################################################################
" ### Options for the UltiSnips Plugin
" ############################################################################
" set ultisnips search directory
let g:runtimepath = "~/.vim/"
let g:UltiSnipsSnippetDirectories=["~/.vim/ultisnips/"]

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ############################################################################
" ### Options for ale Plugin (linting)
" ############################################################################
let g:ale_linters = {'python': ['pylint']}
let g:ale_python_pylint_options = ' --rcfile=' . rcfile_pylint
let g:ale_python_pylint_use_global = 0
"let g:ale_python_pylint_executable = python_interpreter


" ############################################################################
" ### Options for Airline Plugin (status bar, tabs)
" ############################################################################
" always visible
set laststatus=2
" set colorscheme
set t_Co=256
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
" set airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1


" ############################################################################
" ### Options for Color Plugin
" ############################################################################
" " using 256 colors (or 88 colors) if your terminal supports it,
" " but does not automatically use 256 colors by default.
set t_Co=256
" default colorscheme
colorscheme molokai
" uncomment next 4 lines for working outside in bright conditions
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_contrast_light='hard'
"set background=light
"colorscheme gruvbox


" ############################################################################
" Options for Spell Check Plugin
" ############################################################################
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

" ############################################################################
" Options for Conda Plugin
" ############################################################################
" suppress start up message
let g:conda_startup_msg_suppress = 1

" ############################################################################
" Shortcuts for markdown preview
" ############################################################################
autocmd BufRead,BufNewFile *.md  map <leader>ll :call MarkdownCompile()<CR> | map <leader>lv :call MarkdownPreview()<CR>

" ############################################################################
" latexmk configuration
" ############################################################################
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \ ],
    \}

