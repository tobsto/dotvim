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



" colorschemes
"Bundle 'flazz/vim-colorschemes'

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
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" set make command to use parent build directory
set makeprg=make\ -C\ ../build

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
" Open Ag with F6 or ,m
map <F6> :MRU<CR>
map <leader>m :MRU<CR>
" Open buffer explorer with ,b
map <leader>b :BufExplorerVerticalSplit<CR>

" YouCompleteMe shortcuts
map <leader>yc :YcmForceCompileAndDiagnostics<CR>
map <leader>yg :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>yd :YcmDebugInfo<CR>
" Cycle through buffers easily
:nnoremap <C-l> :bnext<CR>
:nnoremap <C-h> :bprevious<CR>
" yank word under cursor
:noremap <bvey> <leader>w<CR>

" ############################################################################
" ### YouCompleteMe
" ############################################################################
let g:ycm_key_detailed_diagnostics='<leader>yi'
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:syntastic_always_populate_loc_list=1

" ############################################################################
" ### UltiSnips
" ############################################################################
let g:UltiSnipsExpandTrigger="<C-X>"
let g:UltiSnipsJumpForwardTrigger="<C-X>"
let g:UltiSnipsJumpBackwardTrigger="<C-Y>"

" ############################################################################
" ### TagList
" ############################################################################
" open taglist on right hand side (to be compatible with nerdtree)
let Tlist_Use_Right_Window=1

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
