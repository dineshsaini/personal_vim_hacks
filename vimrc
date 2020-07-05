set nocompatible
filetype off
set hidden
set showtabline=0

set rtp+=~/.vim/bundle/Vundle.vim

" **** install Plugin in `~/.vim/ex_plugins/` directory ****
call vundle#begin('~/.vim/ex_pulgins/')

Plugin 'VundleVim/Vundle.vim'
" **** Plugins list [start] ****
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'mitsuhiko/vim-jinja'

" **** Plugins list [end] ****
call vundle#end()
filetype on
filetype plugin on
filetype plugin indent on

" **** Other Settings ****

set encoding=utf-8
set number

set colorcolumn=80
highlight ColorColumn term=bold,reverse cterm=bold ctermfg=1 ctermbg=121 gui=bold guifg=Red guibg=LightGreen
highlight Excess term=bold,reverse cterm=bold ctermbg=84 ctermfg=1 gui=bold guibg=bg guibg=fg
match Excess /\%81v.*/
set nowrap

syntax enable
set ruler
set ttyfast

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

set cursorline
set showmatch

set enc=utf-8

set incsearch
set hlsearch

"uncomment to use system clipboard 
"set clipboard=unnamed

" **** Plugins Settings ****

" **** 'scrooloose/nerdtree' ****
" set Open Key `<CTRL> + n`
map <C-n> :NERDTreeToggle<CR>

" if everything is closed except NERDTree then quit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"set max NERDTree width 
let NERDTreeWinSize=25

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" **** 'majutsushi/tagbar' **** 
let g:tagbar_autofocus=0
let g:tagbar_width=25
nmap <F8> :TagbarToggle<CR>
autocmd BufWinLeave *.py :TagbarClose

" **** 'vim-ctrlspace/vim-ctrlspace' **** 
" increase search delay
let g:CtrlSpaceSearchTiming=500

if executable("ag")
    let g:CtrlSpaceGlobCommand='ag -l --nocolor -g ""'
endif

" automatically save workspace on exit or switch
let g:CtrlSpaceSaveWorkspaceOnSwitch=1
let g:CtrlSpaceSaveWorkspaceOnExit=1

" **** 'yuttie/comfortable-motion.vim' **** 
" other default controls are (<Ctrl+f>, <Ctrl+b>), (<Ctrl+d>, <Ctrl+u>)
let g:comfortable_motion_scroll_down_key="j"
let g:comfortable_motion_scroll_up_key="k"

" **** 'w0rp/ale' **** 
" Run linters only when file is saved
"" don't run linters on opening a file, or text change
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

" if everything is closed except ALELint then quit
" TODO

" **** 'klen/python-mode' **** 
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_auto_project = 0
let g:pymode_rope_enable_autoimport = 0
let g:pymode_rope_autoimport_generate = 0
let g:pymode_rope_guess_project = 0

let g:pymode_doc = 0

let g:pymode_breakpoint = 1

