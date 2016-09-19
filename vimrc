" ############################################################################
" ### VUNDLE
" ############################################################################
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
" File Browsing
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" Fuzzy file search
Bundle 'kien/ctrlp.vim'
" Autocompletion
Bundle 'Valloric/YouCompleteMe'
" Snippets
Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets'
" Make YCM and UltiSnips work together
Bundle 'ervandew/supertab'
" Syntax checker
Bundle 'scrooloose/syntastic'
" Find pattern in files (requires ag=the_silver_searcher)
Bundle 'rking/ag.vim'
" Source code Browser
Bundle 'vim-scripts/taglist.vim'
" Status line
Bundle 'bling/vim-airline'
" Git
Bundle 'tpope/vim-fugitive'
" surround code with parentheses, quotes, etc
Bundle 'tpope/vim-surround'
" sophisticated undo
Bundle 'sjl/gundo.vim'
" sophisticated search and replace
Bundle 'tpope/vim-abolish'
" most recently used files
Bundle 'vim-scripts/mru.vim'
" close all buffers but the current
Bundle 'BufOnly.vim'
" switch between source and header file quickly
Bundle 'a.vim'
" quick switching between buffers
Bundle 'bufexplorer.zip'
" Save vim session
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
" cmake integration
" Bundle 'jalcine/cmake.vim'
" Doxygen 
Bundle 'vim-scripts/DoxygenToolkit.vim'
" python
Bundle 'klen/python-mode'
" xml
Bundle 'sukima/xmledit'
" easy motion
Bundle 'Lokaltog/vim-easymotion'
" color themes
Bundle 'flazz/vim-colorschemes'
" comment/uncommend code
Bundle 'scrooloose/nerdcommenter'

Bundle 'octol/vim-cpp-enhanced-highlight'

" increment columns
Bundle 'vim-scripts/VisIncr'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"
" ############################################################################
" ### Vim options
" ############################################################################
" syntax highlighting
syntax on

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
set history=100
set undolevels=100
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

" 
set completeopt=menuone,longest

" conveniently access buffers
set wildchar=<Tab> wildmenu wildmode=full
" Now, pressing Tab on the command line will show a menu to complete buffer and file names. If you include the following, you can also press F10 to open the buffer menu.
"set wildcharm=<C-Z>
"nnoremap <F10> :b <C-Z>

" set make command to use parent build directory
" set makeprg=make\ -C\ ../build
source ~/.vim/setMakeprg.vim
call SetMakePrg()

" syntax highlighting for arduino files
" au BufRead,BufNewFile *.ino set filetype=cpp
au BufReadPost *.ino set syntax=cpp

" make taglist aware of cython functions
let tlist_pyrex_settings='python;c:classe;m:memder;f:function'
" ############################################################################
" ### Key mappings
" ############################################################################
" page up page down with c-j and c-k
map <c-k> <PageUp>
map <c-j> <PageDown>
" set leader key to ','
let mapleader=','
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
" Open buffer explorer with ,b
map <leader>b :BufExplorerVerticalSplit<CR>
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

" ############################################################################
" ### YouCompleteMe
" ############################################################################
let g:ycm_path_to_python_interpreter='/usr/bin/python'
let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_python_binary_path='/usr/bin/python2'
let g:ycm_key_detailed_diagnostics='<leader>yi'
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['ino'] }

" ############################################################################
" ### UltiSnips
" ############################################################################
"let g:UltiSnipsExpandTrigger="<C-j>"
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-S-j>"
" set ultisnips search directory
let g:runtimepath = "~/.vim/"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ############################################################################
" ### Jedi
" ############################################################################
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command = "<leader>jh"
let g:jedi#usages_command = "<leader>jn"
let g:jedi#completions_command = "<leader>jc"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#show_call_signatures = "1"

let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0

" ############################################################################
" ### TagList
" ############################################################################
" open taglist on right hand side (to be compatible with nerdtree)
let Tlist_Use_Right_Window=1
" the ":TlistToggle" command opens the taglist window
" and moves the cursor to the taglist window.
let Tlist_GainFocus_On_ToggleOpen=1

" ############################################################################
" ### CtrlP
" ############################################################################
" open new file in current window <c-y>
let g:ctrlp_open_new_file = 'r'
" open multiple files as hidden buffers
let g:ctrlp_open_multiple_files = '1ij'

" ############################################################################
" ### Session
" ############################################################################
" Disable prompt when quitting
" let g:session_autosave = 'no'
" Disable autoload of default session
let g:session_autoload = 'no'
"
" ############################################################################
" ### DoxygenToolkit
" ############################################################################
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_tparamTag_pre="\\tparam "
let g:DoxygenToolkit_returnTag_pre="\\return "
let g:DoxygenToolkit_throwTag_pre="\\throw "
let g:DoxygenToolkit_fileTag="\\file "
let g:DoxygenToolkit_authorTag="\\author "
let g:DoxygenToolkit_versionTag="\\version "
let g:DoxygenToolkit_dateTag="\\date "
let g:DoxygenToolkit_classTag="\\class "
let g:DoxygenToolkit_blockTag="\\name "

let g:DoxygenToolkit_authorName="Tobias Stollenwerk"
" DLR license
let g:DoxygenToolkit_licenseTag="\\copyright Copyright 2013 German Aerospace Center (http://www.DLR.de)\\n\\n\rLicensed under the Apache License, Version 2.0 (the \"License\");\ryou may not use this file except in compliance with the License.\rYou may obtain a copy of the License at\r\r      http://www.apache.org/licenses/LICENSE-2.0\r\rUnless required by applicable law or agreed to in writing, software\rdistributed under the License is distributed on an \"AS IS\" BASIS,\rWITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\rSee the License for the specific language governing permissions and\rlimitations under the License."


" ############################################################################
" ### python-mode
" ############################################################################
" turn of folding
let g:pymode_folding = 0
" remove automatic line numbers and put everything else back
let g:pymode_options = 0

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" disaple rope autocompletion in favour of jedi
let g:pymode_rope = 0

" Turn on code checking                                          *'g:pymode_lint'*
let g:pymode_lint = 1
" do not Check code on every save (if file has been modified)  *'g:pymode_lint_on_write'*
let g:pymode_lint_on_write = 1
" Check code when editing (on the fly)                        *'g:pymode_lint_on_fly'*
let g:pymode_lint_on_fly = 0
" Show error message if cursor placed at the error line  *'g:pymode_lint_message'*
let g:pymode_lint_message = 1
" ignore pep8 warnings: line to long
let g:pymode_lint_ignore = "E501,E302,C901"
" Auto open cwindow (quickfix) if any errors have been found  *'g:pymode_lint_cwindow'*
let g:pymode_lint_cwindow = 1

" ############################################################################
" ### syntastic
" ############################################################################
" disable pep8 warnings: line to long
" let g:syntastic_python_checker_args="--ignore=E501"

" ############################################################################
" ### Airline
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
" IMPORTANT: Uncomment one of the following lines to force
" " using 256 colors (or 88 colors) if your terminal supports it,
" " but does not automatically use 256 colors by default.
set t_Co=256
" "set t_Co=88
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme molokai
" let g:solarized_termcolors=256
" colorscheme solarized
"

" ############################################################################
" include my own check style script and map key
" ############################################################################
source ~/.vim/styleChecker.vim
map <leader>s :CheckStyle<CR>
map <leader>ss :CheckStyleNext 2<CR>
map <leader>sss :CheckStyleNext 3<CR>
map <leader>ssss :CheckStyleNext 4<CR>
map <leader>sssss :CheckStyleNext 5<CR>
map <leader>ssssss :CheckStyleNext 6<CR>
map <leader>sssssss :CheckStyleNext 7<CR>


" ############################################################################
" include my own style formatter
" ############################################################################
source ~/.vim/styleFormatter.vim
" map <leader>S :FormatCode<CR>
