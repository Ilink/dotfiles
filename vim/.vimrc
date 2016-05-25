set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/rking/ag.vim'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'ilink/vim-buftabline'
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set paste
set ff=unix
filetype on
filetype indent on
filetype plugin on
syntax on
set laststatus=2
set ofu=syntaxcomplete#Complete
set number
set shiftwidth=4
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
set hidden
set clipboard=unnamed,unnamedplus " use system clipboard by default
set splitbelow
set path+=**
set cursorline " highlight line under cursor
set autoindent
set cindent
set smartindent

"source $VIMRUNTIME/mswin.vim
"behave mswin

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'rw'
" Should never open a duplicate
" instead it will switch to buffer
let g:ctrlp_switch_buffer = 'ET'


" airline config
""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1


" startify
""""""""""""""""""""""""""
let g:startify_session_persistence = 1
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks'] 
let g:startify_session_savevars = [
           \ 'g:startify_session_savevars',
           \ 'g:buftabline_session_order'
\ ]

" let g:startify_session_savevars = [
"            \ 'g:startify_session_savevars'
" \ ]

" bookmarks
""""""""""""""""""""""""""
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" delimit mate
""""""""""""""""""""""""""
let delimitMate_expand_cr = 1

" ctrlp
""""""""""""""""""""""""""
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" comments
""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'both'
" let g:NERDDefaultAlign = 'start'

" themes
""""""""""""""""""""""""""
let g:hybrid_use_iTerm_colors = 1
let g:hybrid_custom_term_colors = 1

" ycm
""""""""""""""""""""""""""
let g:ycm_server_python_interpreter='/usr/local/bin/python'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_allow_changing_updatetime = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
        return str
        endfunction
"let g:airline_section_b = '%{WindowNumber()}'
let g:airline_section_a_inactive = '%{WindowNumber()}'

let g:airline_section_a = '%{WindowNumber()} %#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'
let g:NERDCreateDefaultMappings = 0

" elflord actually works if xterm-256 isnt
" available; hybrid breaks horribly
"colorscheme elflord
colorscheme hybrid 

"Leader Key Bindings
"""""""""""""""""""""""""""
" to make space leader key work, must unmap space
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Project/file management
nnoremap <Leader>pf :CtrlP<CR>
nnoremap <Leader>ps :SSave<CR>

" Buffer management
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bf :CtrlPBuffer<CR>

" Window management
nnoremap <Leader>wd :close<CR>
" toggle single vertical split. use a new buffer
" move buffer left or right

" map leader + [1-9] to jump to a window
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
        let i = i + 1
        endwhile

" Misc
" search (silver searcher) with ag.vim
nnoremap <Leader>/ :Ag<Space>
nnoremap <Leader>' :call NERDComment("n", "Toggle")<CR>
vnoremap <Leader>' :call NERDComment("n", "Toggle")<CR>

" Bookmarks
nnoremap <Leader>mm :BookmarkToggle<CR>
nnoremap <Leader>mn :BookmarkNext<CR>
nnoremap <Leader>mp :BookmarkPrev<CR>
nnoremap <Leader>ma :BookmarkShowAll<CR>
nnoremap <Leader>ml :BookmarkShowAll<CR>

" Goto
" goto definition
nnoremap <Leader>gd <C-]>
" try to open file under cursor
nnoremap <Leader>gf gf 

" NERDTree
nnoremap <Leader>tt :NERDTreeToggle<CR>

" Registers
nnoremap <Leader>rr :registers<CR>
" The named 'x' buffer is used for cut (d) operations
" see key binding remaps for d below.
nnoremap <Leader>rx "xp

"Key Bindings
""""""""""""""""""""""""
"move back and forth between arrows"
nmap <silent> <A-C-Up> :wincmd k<CR>
nmap <silent> <A-C-Down> :wincmd j<CR>
nmap <silent> <A-C-Left> :wincmd h<CR>
nmap <silent> <A-C-Right> :wincmd l<CR>

:nnoremap ; :
:ca W w
:map <S-w> :MBEbd<CR> 
:map <Home> ^
:inoremap <Home> ^ 
:noremap f :Ag<Space>

" Indent stuff
imap <S-Tab> <C-o><<
vmap <S-TAB> <gv
vmap <TAB> >gv

" Give delete its own named buffer by default so it doesn't overwrite
" the last yank.
nnoremap d "xd
vnoremap d "xd

" I cant keep track of multiple registers anyway, so fuck it
nnoremap y "cy
vnoremap y "cy

nnoremap p "cp
vnoremap p "cp

" Buffer manipulation
:nnoremap - :BuffReorderPrevBuffer<CR>
:nnoremap = :BuffReorderNextBuffer<CR>
":map - :bprev<CR>
":map = :bnext<CR>
:nnoremap <c-k> :BuffReorderMoveCurBufBackward<CR>
:nnoremap <c-l> :BuffReorderMoveCurBufForward<CR>

" misc
"augroup autocom
    "autocmd!
    ""executes the command on quit
     "autocmd VimLeave *.cpp  

    ""execute the command on write
    "autocmd BufWritePost,FileWritePost *.cpp !your_commad
"augroup END

" This fixes airline symbols on some of my machines
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"



" session test for tabline ordering
" let g:buftabline_session_order = ["~/.vimrc", "plugin/buftabline.vim"]
