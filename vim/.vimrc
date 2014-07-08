execute pathogen#infect()
execute pathogen#helptags()
set ff=unix
filetype on
filetype indent on
filetype plugin on
syntax on
set laststatus=2
"set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set ofu=syntaxcomplete#Complete
set number
set shiftwidth=4
set autoindent
set copyindent
set tabstop=4
set backspace=indent,eol,start
set showmatch
set ignorecase
set smartcase
set smarttab
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
set history=500
set undolevels=500
set title
set grepprg=grep\ -nH

" :let Grep_OpenQuickfixWindow = 0

source $VIMRUNTIME/mswin.vim
behave mswin
let g:nerdtree_tabs_open_on_console_startup=1
" This keeps the cwd set to the
" root of the nerd tree
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
" Should never open a duplicate
" instead it will switch to buffer
let g:ctrlp_switch_buffer = 'ET'

" elflord actually works if xterm-256 isnt
" available; hybrid breaks horribly
"colorscheme elflord
colorscheme hybrid 

"Key Bindings"
"move back and forth between arrows"
nmap <silent> <A-C-Up> :wincmd k<CR>
nmap <silent> <A-C-Down> :wincmd j<CR>
nmap <silent> <A-C-Left> :wincmd h<CR>
nmap <silent> <A-C-Right> :wincmd l<CR>

" these are broken :(
":noremap , <esc>yy 
":inoremap <C-c> <esc>yyi
" :inoremap <C-c> yyi

:nnoremap ; :
:ca W w
:ca nto NERDTreeTabsOpen
:ca ntc NERDTreeTabsClose
:ca sidebarOpen NERDTreeTabsOpen
:ca sidebarClose NERDTreeTabsClose
:ca sidebar NERDTreeTabsToggle
":noremap <C-]> :bn<CR>
:map - :bprev<CR>
:map = :bnext<CR>
:map <S-w> :MBEbd<CR> 
:map <Home> ^
"nnoremap <silent> <esc> :noh<CR><esc>
:noremap f :Rgrep 

" Comment hotkeys
smap <C-/> <C-_>b 
imap <C-/> <Leader>__

