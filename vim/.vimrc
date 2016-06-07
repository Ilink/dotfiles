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
" Plugin 'xolox/vim-easytags'
" Plugin 'xolox/vim-misc'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ilink/vim-buftabline'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'w0ng/vim-hybrid'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'dbakker/vim-projectroot'
Plugin 'ilink/vim-bufkill'
Plugin 'vim-scripts/C-fold'
Plugin 'ilink/vim-jumplist-files'

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
" set clipboard=unnamedplus " use system clipboard by default
set splitbelow
set path+=**
set cursorline " highlight line under cursor
set autoindent
set cindent
set smartindent
set tags=./tags;
set lazyredraw
set ttyfast

" remove auto comment extension stuff
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" can override these with inline settings in actual text files apparently
set foldmethod=indent
" set foldmethod=syntax
" still not entirely sure what these 2 do
set foldlevel=2
set foldlevelstart=4
" no folds within folds
set foldnestmax=1


syntax sync minlines=256

" ctrlp
""""""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'rw'
" Should never open a duplicate
" instead it will switch to buffer
let g:ctrlp_switch_buffer = 'ET'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_regexp_search=1
let g:ctrlp_lazy_update=1

" bufkill
""""""""""""""""""""""""""
let g:BufKillCreateMappings = 0 

" airline config
""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1


function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
        return str
        endfunction
"let g:airline_section_b = '%{WindowNumber()}'
let g:airline_section_a_inactive = '%{WindowNumber()}'

let g:airline_section_a = '%{WindowNumber()} %#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'

" This fixes airline symbols on some of my machines
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" startify
""""""""""""""""""""""""""
let g:startify_session_persistence = 1
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks'] 
let g:startify_session_savevars = [
           \ 'g:startify_session_savevars',
           \ 'g:buftabline_session_order'
\ ]


" bookmarks
""""""""""""""""""""""""""
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" delimit mate
""""""""""""""""""""""""""
let delimitMate_expand_cr = 1

" comments
""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'both'
let g:NERDCompactSexyComs = 0
let g:NERDDefaultNesting = 0

" ycm
""""""""""""""""""""""""""
let g:ycm_server_python_interpreter='/usr/local/bin/python'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_allow_changing_updatetime = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1

" NERD
""""""""""""""""""""""""""
let g:NERDCreateDefaultMappings = 0

" Color Theme
""""""""""""""""""""""""""
" elflord actually works if xterm-256 isnt
" available; hybrid breaks horribly
"colorscheme elflord
set background=dark

" let g:hybrid_use_iTerm_colors = 1
" let g:hybrid_custom_term_colors = 1

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
" nnoremap <Leader>bd :call BetterDelBuf()<CR>
nnoremap <Leader>bd :BD<CR>
nnoremap <Leader>bu :BUNDO<CR>
nnoremap <Leader>bf :CtrlPBuffer<CR>

" Folding
" toggle fold
nnoremap <Leader>ff za
" close all folds
nnoremap <Leader>fc zM
" open all folds
nnoremap <Leader>fo zR 


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
" nnoremap <Leader>/ :Ag<Space>
nnoremap <Leader>/ :Ag --cpp<Space>
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
" nnoremap <Leader>gd g<C-]>
nnoremap <Leader>gd :cs find g <C-R>=expand("<cword>")<CR><CR>  
" try to open file under cursor
nnoremap <Leader>gf gf 
" cscope show list of callers
" i wonder how this works with namespace::function
" cscope doesnt work with namespace::function it seems
nnoremap <Leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>  
nnoremap <Leader>gs :call ToggleHeaderSrc()<CR> 

" NERDTree
nnoremap <Leader>tt :NERDTreeToggle<CR>


" Registers
nnoremap <Leader>rr :registers<CR>
" The named 'x' buffer is used for cut (d) operations
" see key binding remaps for d below.
nnoremap <Leader>rx "xp

" Jumps
nnoremap <Leader>jn <C-I>
nnoremap <Leader>jb <C-O>
nnoremap <Leader>jfb :JumpFileBack<CR>
nnoremap <Leader>jfn :JumpFileForward<CR>

nnoremap <Leader>cb g;
nnoremap <Leader>cn g, 



" i want a function which just jumps back and forth
" from current to previous
" nnoremap <Leader>jj <C-O>



" Functions
""""""""""""""""""""""""
function! NextBufRestricted(dir)
    let curBufNum = bufnr("%")
    let curBufName = bufname(curBufNum)
    if curBufName != "NERD_tree_1" && getbufvar(curBufNum, "&buftype") != "quickfix" 
        if a:dir == 0 
            exec ":BuffReorderNextBuffer"
        else
            exec ":BuffReorderPrevBuffer"
        endif
    endif
endfunction

function! SudoWrite()
    execute ":w !sudo tee > /dev/null %"
endfunction
com! -bar SudoWrite call SudoWrite()

" Another way of doing this:
" http://stackoverflow.com/a/7078429/187469
" cmap w!! w !sudo tee > /dev/null %

function! ToggleHeaderSrc()
    let curFile = expand("%")
    let found = 0

    if curFile[-4:-1] == ".cpp"
        let tgtFile = curFile[0:-5] . ".h"
        let found = 1
    elseif curFile[-4:-1] == ".hpp"  
        let tgtFile = curFile[0:-5] . ".cpp"
        let found = 1
    elseif curFile[-2:-1] == ".h"
        let tgtFile = curFile[0:-3] . ".cpp"
        let found = 1
    endif

    if found && filereadable(tgtFile)
        execute("e " . tgtFile)
    endif
        
endfunction

function! BetterDelBuf()
    let curBuf = bufnr('%')
    call NextBufRestricted(-1)
    execute "bd " . curBuf
endfunction


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
:imap <Home> <esc><Home>i

" This keeps the cursor centered in the page as much as possible
" Ordinarily page up and page down bring the cursor all the way to the top or
" bottom
nmap <PAGEDOWN> <C-d>
nmap <PAGEUP> <C-u>

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

" the [p part pastes at the cursor instead of the next line
nnoremap p "c[p
vnoremap p "c[p

" I switched <x> to be the same as the old <d> key
" so it does cut
nnoremap x "cd
vnoremap x "cd
" vnoremap x "c<Del>
nnoremap xx "cdd
" vnoremap xx "cdd


" Buffer manipulation
" :nnoremap - :BuffReorderPrevBuffer<CR>
" :nnoremap = :BuffReorderNextBuffer<CR>
" :map - :bprev<CR>
" :map = :bnext<CR>
:nnoremap <c-k> :BuffReorderMoveCurBufBackward<CR>
:nnoremap <c-l> :BuffReorderMoveCurBufForward<CR>

:nnoremap - :call NextBufRestricted(-1)<CR>
:nnoremap = :call NextBufRestricted(0)<CR>
" :map - :bprev<CR>
" :map = :bnext<CR>



" Pasting stuff without ruining the formatting
set pastetoggle=<F2>
" windows
inoremap <C-v> <F10><C-r>+<F10>
inoremap <S-Insert> <F10><C-r>+<F10>
" os x
inoremap <m-v> <F10><C-r>+<F10>

" this just flat out doesnt work
" map <m-v> :set paste<CR>o<esc>"*]p:set nopaste<CR>


" Colors for tab plugin
exe "hi! TabLine ctermfg=250 ctermbg=234 gui=underline guibg=DarkGrey" 
exe "hi! TabLineSel term=reverse cterm=reverse ctermfg=110 ctermbg=234 gui=bold" 
exe "hi! TabLineFill term=reverse cterm=reverse ctermfg=234 ctermbg=235 gui=reverse" 



" cscope
""""""""""""""""""""""""
set cscopetag cscopeverbose

function! GetCscopeFile()
    return projectroot#guess() . "/cscope.out" 
endfunction


if filereadable(GetCscopeFile())
    execute("silent cs add " . GetCscopeFile())
    " silent cs add cscope.out
endif

function! SetupSession()
    " optimistically assume we dont have more than 1
    try
        silent cs remove 1
    catch
    endtry

    try
        let cscopeFile = GetCscopeFile() 
        execute("silent cs add " . cscopeFile)
    catch
    endtry
endfunction

autocmd SessionLoadPost * call SetupSession()


" Misc syntax
""""""""""""""""""""""""
au BufRead,BufNewFile *.scala set filetype=java


