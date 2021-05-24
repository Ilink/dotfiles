set nocompatible
filetype off

let g:vimwiki_map_prefix = '<Leader>n'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
" This is my fork of ctrlp which re-uses its whole UI, but
" adds my own fuzzy file matching server fuzd
" Plugin 'ilink/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
" Plugin 'haya14busa/vim-poweryank'
" Plugin 'vim-airline/vim-airline'
" Plugin 'ilink/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
" Plugin 'ilink/vim-buftabline'
Plugin 'ap/vim-buftabline'
Plugin 'ilink/vim-markdown'
Plugin 'https://github.com/rking/ag.vim'
Plugin 'tyru/caw.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'w0ng/vim-hybrid'
Plugin 'dracula/vim', { 'name': 'dracula' }
" Plugin 'ilink/vim-dracula'
Plugin 'connorholyday/vim-snazzy'
Plugin 'rakr/vim-one'
Plugin 'joshdick/onedark.vim'
Plugin 'mhartington/oceanic-next'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'felipesousa/rupza'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'dbakker/vim-projectroot'
Plugin 'ilink/vim-bufkill'
Plugin 'vim-scripts/C-fold'
Plugin 'ilink/vim-jumplist-files'
Plugin 'ervandew/supertab'
Plugin 'henrik/vim-indexed-search'
Plugin 'vim-scripts/DoxygenToolkit.vim'
" Plugin 'mildred/vim-bufmru'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'lyuts/vim-rtags'
Plugin 'skywind3000/asyncrun.vim'
" Plugin 'chrisbra/csv.vim'
Plugin 'mechatroner/rainbow_csv'
" Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-fugitive'
Plugin 'tikhomirov/vim-glsl'
Plugin 'ilink/nts'
Plugin 'ilink/hexmode'
Plugin 'pangloss/vim-javascript'
Plugin 'dkprice/vim-easygrep'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vimwiki/vimwiki'
Plugin 'ronakg/quickr-cscope.vim'
Plugin 'autoload_cscope.vim'
Plugin 'skywind3000/vim-quickui'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/ShaderHighLight'
" Plugin 'yggdroot/indentline'
" Plugin 'puremourning/vimspector'
" Plugin 'google/vim-searchindex'
Plugin 'andymass/vim-matchup'

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
" Gets rid of the characters to represent vertical splits
set fillchars+=vert:\ 
set path+=**
set cursorline " highlight line under cursor
set autoindent
set cindent
" http://stackoverflow.com/a/7623017/187469
" makes public/private not get indented
set cinoptions=g-1
set smartindent
set tags=./tags;
set lazyredraw
set ttyfast
set regexpengine=1
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256
let &t_Co=256

function! LoadProjectSettings()
    let l:projFile = ".vim_project"
    if filereadable(l:projFile)
        exec "source " . l:projFile
    else
        let g:project_settings = {}
    endif

    " Set defaults
    if !has_key(g:project_settings, "fzf_root")
        let g:project_settings.fzf_root = "."
    endif
    if !has_key(g:project_settings, "ignore_files")
        let g:project_settings.ignore_files = []
    endif
endfunction
call LoadProjectSettings()

set termguicolors
" Without these two lines, vim doesn't
" support truecolors. Not sure why.
" https://github.com/tmux/tmux/issues/1246
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" This makes 'labels' not get de-indendeted to the start of the line
" A label is something like 'abc:'
" note the trailing colon
set cinoptions+=L0

" this allows the cursor to go 1-past the end of the line
" set virtualedit=onemore

" improves performance but matches appear slower
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20

" remove auto comment extension stuff
autocmd! FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" can override these with inline settings in actual text files apparently
set foldmethod=indent
" set foldmethod=syntax
" still not entirely sure what these 2 do
set foldlevel=2
set foldlevelstart=4
" no folds within folds
set foldnestmax=1


syntax sync minlines=256

" Vimwiki
""""""""""""""""""""
augroup vimwiki_ft
  au!
  autocmd BufNewFile,BufRead *.vimwiki set filetype=vimwiki
augroup END

" Change mappings so this doesnt conflict with '-' and '+'
" which i use for moving between open buffers
nmap __ <Plug>VimwikiRemoveHeaderLevel
nmap ++ <Plug>VimwikiAddHeaderLevel
" Instead of setting the below, i just linked the ~/vimwiki dir to
" my journal git repo
" This makes it easy when I have different machines that have different journal git repos
" let g:vimwiki_list = [{'path': '~/src/splunk/ilink/journal/vimwiki',
"                   \ 'path_html': '~/src/splunk/ilink/journal/vimwiki_html'}]
" hi! VimwikiHeader1 ctermfg=214 guifg=#ff8700
let g:vimwiki_hl_headers=1
" hi def VimwikiHeader1 ctermfg=214 guifg=#ff8700 term=bold cterm=bold ctermfg=214 gui=bold guifg=#ff8700 guibg=bg
" hi def VimwikiHeader2 ctermfg=81 guifg=#5fd7ff

autocmd FileType vimwiki hi VimwikiHeader1 ctermfg=210 guifg=#ff8700 term=bold cterm=bold ctermfg=214 gui=bold guifg=#ff8700 guibg=bg
autocmd FileType vimwiki hi VimwikiHeader2 ctermfg=81 guifg=#5fd7ff term=bold cterm=bold ctermfg=81 gui=bold guifg=#5fd7ff guibg=bg
autocmd FileType vimwiki hi VimwikiHeader3 ctermfg=141 guifg=#af87ff term=bold cterm=bold ctermfg=141 gui=bold guifg=#af87ff guibg=bg
autocmd FileType vimwiki setlocal textwidth=80 

" hi link VimwikiHeader1 NotesHeader

" let g:vimwiki_global_vars.hcolor_guifg_light = ['#ff8700', '#ff8700', '#ff8700', '#ff8700']
let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]


" Asyncrun
""""""""""""""""""""
let g:asyncrun_bell = 1
" This allows the errorformat to be determined by the local
" language instead of the global errorformat.
let g:asyncrun_local = 1
" let g:asyncrun_timer=1000
" From the manual:
"     Vim may parse errorformat-multi-line incorrectly (using %A, %C, %Z) and omit or
"     duplicate output. You can ask vim to re-parse quickfix content with 'copen'.
"     This autocmd will automatically re-parse quickfix on job completion.
" I added to this to make it stay in the quickfix window, then scroll to the bottom
augroup local-asyncrun
    au!
    au User AsyncRunStop | copen | exec "normal G"
augroup END

" Tags
""""""""""""""""""""""""""
" remove i to not search every file in our path 
" http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete=.,w,b,u,t

" cscope / quickr-cscope
""""""""""""""""""""""""
let g:quickr_cscope_keymaps = 0
let g:quickr_cscope_autoload_db = 0
" let g:quickr_cscope_debug_mode = 1

" Git
""""""""""""""""""""""""""


" ctrlp
""""""""""""""""""""""""""
" set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_working_path_mode = 'rw'
" " Should never open a duplicate
" " instead it will switch to buffer
" let g:ctrlp_switch_buffer = 'ET'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard --exclude=*\.js --exclude=*html']
" let g:ctrlp_regexp_search=1
" " let g:ctrlp_lazy_update=1
" let g:ctrlp_lazy_update=300
" " apparently some settings of this variable override the custom ignore below
" " not sure why
" unlet g:ctrlp_user_command
" " let g:ctrlp_custom_ignore = {
" " 	\ 'dir':  '\v(contrib)|([\/]\.(git|hg|svn|js|html))$',
" " 	\ 'file': '\v\.(exe|so|dll|js|html)$',
" " 	\ }
" " let g:ctrlp_custom_ignore = {
" " 	\ 'dir':  'contrib$\|\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$',
" "     \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.js$\|\.html$\|\.map$\|\.md5$\|\.png$\|\.jpg$' }

" bufkill
""""""""""""""""""""""""""
let g:BufKillCreateMappings = 0 

" airline config
""""""""""""""""""""""""""
" Returns true if at least delay seconds have elapsed since the last time this function was called, based on the time
" contained in the variable "timer". The first time it is called, the variable is defined and the function returns
" true.
"
" True means not zero.
"
" For example, to execute something no more than once every two seconds using a variable named "b:myTimer", do this:
"
" if LongEnough( "b:myTimer", 2 )
"   <do the thing>
" endif
"
" The optional 3rd parameter is the number of times to suppress the operation within the specified time and then let it
" happen even though the required delay hasn't happened. For example:
"
" if LongEnough( "b:myTimer", 2, 5 )
"   <do the thing>
" endif
"
" Means to execute either every 2 seconds or every 5 calls, whichever happens first.
function! LongEnough( timer, delay, ... )
  let result = 0
  let suppressionCount = 0
  if ( exists( 'a:1' ) )
    let suppressionCount = a:1
  endif
  " This is the first time we're being called.
  if ( !exists( a:timer ) )
    let result = 1
  else
    let timeElapsed = localtime() - {a:timer}
    " If it's been a while...
    if ( timeElapsed >= a:delay )
      let result = 1
    elseif ( suppressionCount > 0 )
      let {a:timer}_callCount += 1
      " It hasn't been a while, but the number of times we have been called has hit the suppression limit, so we activate
      " anyway.
      if ( {a:timer}_callCount >= suppressionCount )
        let result = 1
      endif
    endif
  endif
  " Reset both the timer and the number of times we've been called since the last update.
  if ( result )
    let {a:timer} = localtime()
    let {a:timer}_callCount = 0
  endif
  return result
endfunction


" Lightline Config
"""""""""""""""""""
" Custom dracula lightline
function! s:setupDraculaLightline()
    let s:black    = g:dracula#palette.bg
    let s:gray     = g:dracula#palette.selection
    let s:white    = g:dracula#palette.fg
    let s:darkblue = g:dracula#palette.comment
    let s:cyan     = g:dracula#palette.cyan
    let s:green    = g:dracula#palette.green
    let s:orange   = g:dracula#palette.orange
    let s:purple   = g:dracula#palette.purple
    let s:red      = g:dracula#palette.red
    let s:yellow   = g:dracula#palette.yellow
    let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
    let s:p.normal.left = [ [ s:black, s:purple ], [ s:cyan, s:gray ] ]
    let s:p.normal.right = [ [ s:black, s:purple ], [ s:white, s:darkblue ] ]
    let s:p.inactive.right = [ [ s:black, s:darkblue ], [ s:white, s:black ] ]
    " This is the only change - following is the original line
    " let s:p.inactive.left =  [ [ s:cyan, s:black ], [ s:white, s:black ] ]
    let s:p.inactive.left =  [ [ s:cyan, s:gray ], [ s:white, s:black ] ]
    let s:p.insert.left = [ [ s:black, s:green ], [ s:cyan, s:gray ] ]
    let s:p.replace.left = [ [ s:black, s:red ], [ s:cyan, s:gray ] ]
    let s:p.visual.left = [ [ s:black, s:orange ], [ s:cyan, s:gray ] ]
    let s:p.normal.middle = [ [ s:white, s:gray ] ]
    let s:p.inactive.middle = [ [ s:white, s:gray ] ]
    let s:p.tabline.left = [ [ s:darkblue, s:gray ] ]
    let s:p.tabline.tabsel = [ [ s:cyan, s:black ] ]
    let s:p.tabline.middle = [ [ s:darkblue, s:gray ] ]
    let s:p.tabline.right = copy(s:p.normal.right)
    let s:p.normal.error = [ [ s:red, s:black ] ]
    let s:p.normal.warning = [ [ s:yellow, s:black ] ]

    let g:lightline#colorscheme#dracula2#palette = lightline#colorscheme#flatten(s:p)
endfunction
call s:setupDraculaLightline()

let g:lightline = {
    \ 'colorscheme': 'dracula2',
    \ 'component': {
    \   'lineinfo': '%3l:%-2v(%L)', 'line': '%l', 'column': '%c'
    \},
	\ 'component_function': {
    \   'filename': 'StatusFilename',
 	\ },
\}

function! StatusFilename()
    " http://stackoverflow.com/a/42194918/187469
    let fname = fnamemodify(resolve(expand('%:p')),':~')
    let max_chars = 90
    let len_fname = len(fname)
    if (len_fname > max_chars)
        let suffix_len = len_fname - max_chars 
	    let fname = "..." . fname[suffix_len:]	
	endif
	return fname
endfunction


" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_theme='distinguished'
" let g:airline_powerline_fonts = 1
" " remove stupid whitespace garbage
" let g:airline_section_warning = ''
" " let g:airline_section_z = '%{g:airline_symbols.linenr} %l/%L %{%l/%L}'
" let g:airline_section_y = ''
" let g:airline_section_z = '%{g:airline_symbols.linenr} %l/%L (%p%%)'
" let g:airline#extensions#wordcount#enabled = 0
"
" function! WindowNumber()
"     let str=tabpagewinnr(tabpagenr())
"         return str
"         endfunction
" "let g:airline_section_b = '%{WindowNumber()}'
" let g:airline_section_a_inactive = '%{WindowNumber()}'
"
" let g:airline_section_a = '%{WindowNumber()} %#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'
"
" " This fixes airline symbols on some of my machines
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

" Quickfix Toggle
" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
"""""""""""""""""""""""""
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

function! WaitStopCurrentJob()
    AsyncStop!
    while g:asyncrun_status == 'running'
        sleep 50m
    endwhile
endfunction

function! AsyncCmdFn(cmd)
    call WaitStopCurrentJob()
    exec(":AsyncRun! ".a:cmd)
    " opens the quickfix, focuses the window if it's already open
    copen 
endfunction

command! -nargs=+ -complete=file AsyncCmd
    \ call AsyncCmdFn(<q-args>)

" Load buid.log errors
function! LoadBuildLog()
    " cgetfile doesn't jump to first error like cfile does
    cgetfile build.log 
    copen
endfunction

function! GetNumCores()
    " It was easier to make this work on hostname rather than actually do the smart thing
    " some of the hosts use distcc so j > physical cores
    let host=system('hostname')
    if host =~ "ronnie" || host =~ "wimpy" || host =~ "mrt" || host =~ "fool\\d\\{2\}" || host =~ "chieftain"
        return 200
    elseif host =~ "ilink_linux"
        return 12
    elseif host =~ "squid"
        return 4
    else
        return 4
    endif
endfunction

let g:num_cores = GetNumCores()

function! Build()
    call WaitStopCurrentJob()
    let extension=expand('%:e')

    if filereadable("make.sh")
        exec(":AsyncRun ./make.sh \|& tee build.log")
    elseif(filereadable("build.py"))
        exec(":AsyncRun ./build.py \|& tee build.log")
    elseif(filereadable("script/build.sh"))
        exec(":AsyncRun bash script/build.sh \|& tee build.log")
    elseif(extension == "go")
        let file=expand('%')
        exec(":AsyncRun go build \|& tee build.log")
    else
        " exec(":AsyncRun -raw pity install \|& tee build.log")
        exec(":AsyncRun pity install &> build.log")
    endif
    " opens the quickfix, focuses the window if it's already open
    copen 
endfunction

function! BuildCurrentFile()
    " cpp/ninja only
    call WaitStopCurrentJob()
    exec(":AsyncRun ninja %^ &> build.log")
endfunction

" startify
""""""""""""""""""""""""""

let g:startify_session_persistence = 1
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks'] 
let g:startify_session_savevars = [
           \ 'g:startify_session_savevars',
           \ 'g:session_type'
\ ]

" markdown
""""""""""""""""""""""""""
" I find the way it does indenting not helpful
" let g:vim_markdown_new_list_item_indent = 0
" markdown auto-new line insertion
autocmd FileType markdown setlocal textwidth=60 
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
augroup END
au BufRead,BufNewFile *.md set filetype=markdown

let g:markdown_fenced_languages = ['cpp', 'python', 'bash=sh']

" delimit mate
""""""""""""""""""""""""""
let delimitMate_expand_cr = 1

" comments
""""""""""""""""""""""""""
let g:caw_operator_keymappings = 0
autocmd FileType shaderlab let b:caw_oneline_comment = '//'

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

" Tagbar
""""""""""""""""""""""""""
" This effectively unbinds this key. It is set to <Space> by default
" which overlaps with my leader key. I don't care about this
" command anyway so im fine removing it.
let g:tagbar_map_showproto = "q"

" Color Theme
""""""""""""""""""""""""""
" elflord actually works if xterm-256 isnt
" available; hybrid breaks horribly
"colorscheme elflord
set background=dark

" let g:hybrid_use_iTerm_colors = 1
" let g:hybrid_custom_term_colors = 1

" colorscheme hybrid 
colorscheme dracula
" Tweaks for dracula
" exe "hi! TabLine ctermfg=250 ctermbg=234 gui=NONE guifg=#c5c8c6 guibg=DarkGrey"
" exe "hi! TabLine ctermfg=250 ctermbg=234 gui=NONE guibg=#141a2b" 
hi! TabLine ctermfg=250 ctermbg=234 term=NONE cterm=NONE gui=NONE guibg=#adbcd3 guifg=#303030
hi! TabLineSel gui=NONE ctermfg=110 ctermbg=234 guibg=#cc8df0 guifg=#303030 term=NONE cterm=NONE
hi! TabLineFill term=reverse cterm=reverse gui=NONE ctermfg=234 ctermbg=235
" TabLine        ctermfg=250 ctermbg=234 guifg=#303030 guibg=#adbcd3
" TabLineSel     term=reverse cterm=reverse ctermfg=110 ctermbg=234
" TabLineFill    term=reverse cterm=reverse ctermfg=234 ctermbg=235
hi type guibg=NONE guifg=#8be9fd
hi comment guifg=#8a8a8a


" colorscheme onehalfdark
" colorscheme palenight
" Tweaks for palenight
" hi normal ctermfg=145 ctermbg=235 guifg=#bfc7d5 guibg=#232735
" Colors for tab plugin
" exe "hi! TabLine ctermfg=250 ctermbg=234 gui=underline guibg=DarkGrey" 
" exe "hi! TabLineSel term=reverse cterm=reverse ctermfg=110 ctermbg=234 gui=bold" 
" exe "hi! TabLineFill term=reverse cterm=reverse ctermfg=234 ctermbg=235 gui=reverse" 

" colorscheme snazzy

" colorscheme one
" colorscheme onedark

" colorscheme OceanicNext
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" Tweaks for OceanicNext 
" exe "hi! TabLine ctermfg=250 ctermbg=234 gui=underline guibg=DarkGrey" 
" exe "hi! TabLineSel term=reverse cterm=reverse ctermfg=110 ctermbg=234 gui=bold" 
" exe "hi! TabLineFill term=reverse cterm=reverse ctermfg=234 ctermbg=235 gui=reverse" 


" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized

" colorscheme rupza 

let g:dracula_italic = 1


" bookmarks
" This has to go after the colorscheme stuff
""""""""""""""""""""""""""
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
highlight BookmarkSign ctermfg=110
highlight BookmarkLine ctermbg=235 
" highlight BookmarkLine ctermbg=2 
let g:bookmark_highlight_lines = 1

function! BetterPaste()
    " https://vi.stackexchange.com/questions/11476/how-can-i-get-the-character-at-the-cursor-position-in-a-multibyte-aware-manner
    " Gets the current character under the cursor
    " let l:cursorCh = matchstr(getline('.'), '\%'.col('.').'c.')
    " if l:cursorCh != ' '
    "     echom "not a space"
    "     " insert a space
    " endif 
    " let l:lineLen = strlen(getline(".")) 
    " if l:cursorCh == '<CR>'
    "     echom "CR"
    " endif
    " echom l:cursorCh
    exec "normal a \e"
    normal lp 
endfunction

"Leader Key Bindings
"""""""""""""""""""""""""""
" to make space leader key work, must unmap space
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

nnoremap <Leader>pp li<space><esc>p

" Project/file management
nnoremap <Leader>pf :CtrlP<CR>
" nnoremap <Leader>ps :SSave<CR>
nnoremap <Leader>ps :call SessionSavePrompt()<CR>

" Buffer management
" nnoremap <Leader>bd :call BetterDelBuf()<CR>
nnoremap <Leader>bd :BD<CR>
nnoremap <Leader>bu :BUNDO<CR>
nnoremap <Leader>bf :CtrlPBuffer<CR>

function! GetListedBuffers()
	return filter(range(1, bufnr('$')), 'buflisted(v:val)')
endfunction

function! GetListedBuffer(idx)
	let listed_buffs = GetListedBuffers()
	if a:idx >= len(listed_buffs)
	    return bufnr('%')
    endif
    return listed_buffs[a:idx]
endfunction

function! GetLastBuffer()
	" let listed_buffs = GetListedBuffers()
	" return listed_buffs[len(listed_buffs)-1]
	return get(buftabline#user_buffers(),-1,'')
endfunction

" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <Leader>g1 :AirlineGotoOrderedBuffer1<CR>
" nmap <Leader>g2 :AirlineGotoOrderedBuffer2<CR>
" nmap <Leader>g3 :AirlineGotoOrderedBuffer3<CR>
" nmap <Leader>g4 :AirlineGotoOrderedBuffer4<CR>
" nmap <Leader>g5 :AirlineGotoOrderedBuffer5<CR>
" nmap <Leader>g6 :AirlineGotoOrderedBuffer6<CR>
" nmap <Leader>g7 :AirlineGotoOrderedBuffer7<CR>
" nmap <Leader>g8 :AirlineGotoOrderedBuffer8<CR>
" nmap <Leader>g9 :AirlineGotoOrderedBuffer9<CR>
" nmap <Leader>g0 :AirlineLastBuffer<CR>
nmap <leader>g1 <Plug>BufTabLine.Go(1)
nmap <leader>g2 <Plug>BufTabLine.Go(2)
nmap <leader>g3 <Plug>BufTabLine.Go(3)
nmap <leader>g4 <Plug>BufTabLine.Go(4)
nmap <leader>g5 <Plug>BufTabLine.Go(5)
nmap <leader>g6 <Plug>BufTabLine.Go(6)
nmap <leader>g7 <Plug>BufTabLine.Go(7)
nmap <leader>g8 <Plug>BufTabLine.Go(8)
nmap <leader>g9 <Plug>BufTabLine.Go(9)
nmap <leader>g0 :b<C-R>=GetLastBuffer()<CR><CR>

let g:buftabline_indicators=1
" :exe 'b'.get(buftabline#user_buffers(),9,'')

" nmap <Leader>g1 :b<C-R>=GetListedBuffer(1)<CR><CR>
" nmap <Leader>g2 :b<C-R>=GetListedBuffer(2)<CR><CR>
" nmap <Leader>g3 :b<C-R>=GetListedBuffer(3)<CR><CR>
" nmap <Leader>g4 :b<C-R>=GetListedBuffer(4)<CR><CR>
" nmap <Leader>g5 :b<C-R>=GetListedBuffer(5)<CR><CR>
" nmap <Leader>g6 :b<C-R>=GetListedBuffer(6)<CR><CR>
" nmap <Leader>g7 :b<C-R>=GetListedBuffer(7)<CR><CR>
" nmap <Leader>g8 :b<C-R>=GetListedBuffer(8)<CR><CR>
" nmap <Leader>g9 :b<C-R>=GetListedBuffer(9)<CR><CR>
" nmap <Leader>g0 :b<C-R>=GetLastBuffer()<CR><CR>

" Folding
" toggle fold
nnoremap <Leader>ff za
" close all folds
nnoremap <Leader>fc zM
" open all folds
nnoremap <Leader>fo zR 

" Find and replace
vnoremap <Leader>rr :<C-U>%s/\%Vfind/repl/g 
nnoremap <Leader>rr :%s/find/repl/g

" Window management
nnoremap <Leader>wd :close<CR>
" the # specifies the buffer. <C-R> grabs function output
nnoremap <Leader>ws :vsplit #<C-R>=bufnr('%')<CR><CR>
" horizontal split
nnoremap <Leader>wh :split #<C-R>=bufnr('%')<CR><CR>
" resize splits
nnoremap <Leader>w+ :vertical res +
nnoremap <Leader>w- :vertical res -

" Quickfix
nnoremap <Leader>qn :cnewer<CR>
nnoremap <Leader>qp :colder<CR>
nnoremap <Leader>qe :call LoadBuildLog()<CR> 
" nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
" nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> <Leader>qq :call ToggleList("Quickfix List", 'c')<CR> 

" Doxygen
nnoremap <Leader>dd :Dox<CR>

" map leader + [1-9] to jump to a window
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
        let i = i + 1
        endwhile

" Misc
" search (silver searcher) with ag.vim
" nnoremap <Leader>/ :Ag! --cpp --cc<Space>

function! GetAgFlags()
    let extension=expand('%:e')
    if extension=="js"
        return "--js"
    elseif extension=="cpp" || extension=="c" || extension=="h" || extension=="hpp"
        return "--cpp --cc"
    elseif extension=="py"
        return "--py"
    else
        return ""
    endif
endfunction

" The <C-R>=fn()<CR> part will get the result of the function
" and place it into the command
" nnoremap <Leader>/ :Ag! <C-R>=GetSearchFtype()<CR><Space>
" nnoremap <Leader>/ :AsyncCmd ag --cpp --cc<Space>
nnoremap <Leader>/ :AsyncCmd ag <C-R>=GetAgFlags()<CR><Space>

" :<C-U> enters command mode and deletes (Ctrl-u) the '<,'> range
" automatically inserted due to the visual selection.
" TODO do async version of ag
" vnoremap <Leader>/ :<C-U>Ag! <C-R>=GetSearchFtype()<CR><Space><C-R>=Quote(GetVisualSelection())<CR>
vnoremap <Leader>/ :<C-U>AsyncCmd ag --cpp --cc<Space><C-R>=Quote(GetVisualSelection())<CR>

" Comments
" For some reason this doesnt with with nore
vmap <Leader>' <Plug>(caw:hatpos:toggle)
nmap <Leader>' <Plug>(caw:hatpos:toggle)

" Context menu (vim-quickui)
let opts = {'index':g:quickui#context#cursor}
nnoremap <Leader>fp :call quickui#preview#open("<C-R>=expand("<cfile>")<CR>", opts)<CR>

" Bookmarks
nnoremap <Leader>mm :BookmarkToggle<CR>
nnoremap <Leader>mn :BookmarkNext<CR>
nnoremap <Leader>mp :BookmarkPrev<CR>
nnoremap <Leader>ma :BookmarkShowAll<CR>
nnoremap <Leader>ml :BookmarkShowAll<CR>

function! GitDiffGf()
    echom "foobar"
    " The diff format we're trying to follow is:
    "
    " +++ b/src/framework/Arena.cpp
    " @@ -65,7 +65,7 @@ void* Arena::fallbackAllocate(size_t n)
    "
    " b: searches in reverse
    " n: doesn't move the cursor
    let cur_line_num = line(".")
    " The \v means 'very magic' and makes the regexes more like those
    " in other languages.
    let file_name_line_num = search('\v\+\+\+ b', "bn")
    let file_offset_line_num = search('\v\@\@ [\+|-]\d', "bn")
    let dert_line_num_match = matchlist(getline(file_offset_line_num), '\v\@\@ .*\+(\d*)')[1]
    let dest_line_num = str2nr(dert_line_num_match)
    " b contains the modified file, so we want to use that.
    " At least, it does with how I generate diffs.
    let file_name = matchlist(getline(file_name_line_num), '\vb/(.*)')[1]

    echom "cur_line_num: " . cur_line_num
    echom "file offset line: " . getline(file_offset_line_num)
    echom "dest_line_num: " . dest_line_num  
    echom "file_name_line_num: " . file_name_line_num
    echom "file_offset_line_num: " . file_offset_line_num
    echom "file_name: " . file_name

    let offset = cur_line_num - file_offset_line_num - 1
    echom "offset (before subtraction of -): " . offset

    " If the line starts with a "-" we dont bother with the offset
    " calculation.  We are assuming the user has the "changed" file opened. So
    " it doesn't make much sense to try to jump to a modification/line which
    " doesnt exist on the current file.
    if getline(cur_line_num)[0] != '-'
        " The minus 1 is because the line after the "@@ " line number reference
        " is the line which it refers to.
        " The goal here is to find the true offset of the line within the file.
        " There are removed lines mixed in with the diff, so we can't just use
        " the current line relative to the file header.
        " Lines which were removed by this branch have a '-' at the start of the line.
        let line_num = file_offset_line_num
        while line_num < cur_line_num
            let line = getline(line_num)
            if line[0] == '-'
                let offset -= 1
            endif

            let line_num += 1
        endwhile
    endif

    echom "offset: " . offset
    let full_line_num = offset + dest_line_num
    echom "full_line_num: " . full_line_num  

    exec "edit +" . full_line_num . " " . file_name
endfunction

" Goto
" goto definition
nnoremap <Leader>gd g<C-]>
" nnoremap <Leader>gd :cs find g <C-R>=expand("<cword>")<CR><CR>  
" try to open file under cursor
nnoremap <Leader>gf gf 
autocmd FileType diff nnoremap <buffer> <Leader>gf :call GitDiffGf()<CR>
nnoremap <Leader>gs :call ToggleHeaderSrc()<CR> 
" Not sure why these dont work with nnoremap
nmap <leader>gu <plug>(quickr_cscope_symbols)
nmap <leader>gc <plug>(quickr_cscope_callers)


" Sidebars: NERDTree + Tagbar
nnoremap <Leader>tt :NERDTreeToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>tw :TagbarCurrentTag('s', 'f')<CR>

" Text Processing
" Format line
nnoremap <Leader>tf gqq
" Format visual selection
vnoremap <Leader>tf gq



" Jumps
nnoremap <Leader>jn <C-I>
nnoremap <Leader>jb <C-O>
nnoremap <Leader>jfb :JumpFileBack<CR>
nnoremap <Leader>jfn :JumpFileForward<CR>
nnoremap <Leader>jm v%

" Prev/next change
nnoremap <Leader>cb g;
nnoremap <Leader>cn g, 


" MRU
" nnoremap <C-M> :MRU <C-R>=getcwd()<CR><CR>


" i want a function which just jumps back and forth
" from current to previous
" nnoremap <Leader>jj <C-O>



" Functions
""""""""""""""""""""""""
function! IsValidBuffer()
    let curBufNum = bufnr("%")
    let curBufName = bufname(curBufNum)
    return curBufName != "NERD_tree_1" && getbufvar(curBufNum, "&buftype") != "quickfix" 
endfunction

function! NextBufRestricted(dir)
    " TODO does vim have a do-while loop that i can use instead of this
    " code duplication?
    if IsValidBuffer()
        if a:dir == 0 
            exec ":bn"
        else
            exec ":bp"
        endif
        
        while !IsValidBuffer()
            if a:dir == 0 
                exec ":bn"
            else
                exec ":bp"
            endif
        endwhile
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
    let altTgtFile = "" 

    if curFile[-4:-1] == ".cpp"
        let tgtFile = curFile[0:-5] . ".h"
        let found = 1
    elseif curFile[-4:-1] == ".hpp"  
        let tgtFile = curFile[0:-5] . ".cpp"
        let found = 1
    elseif curFile[-2:-1] == ".h"
        let prefix = curFile[0:-3]  
        let tgtFile = prefix . ".cpp"
        let altTgtFile = prefix . ".c"  
        let found = 1
    elseif curFile[-2:-1] == ".c"
        let prefix = curFile[0:-3]  
        let tgtFile = prefix . ".h"
        let found = 1
    endif

    if found 
        if filereadable(tgtFile)
            execute("e " . tgtFile)
        elseif altTgtFile != "" && filereadable(altTgtFile)
            execute("e " . altTgtFile)
        endif
    endif
        
endfunction

function! BetterDelBuf()
    let curBuf = bufnr('%')
    call NextBufRestricted(-1)
    execute "bd " . curBuf
endfunction

" function! GotoLastTab()
"     " execute "normal \<Plug>AirlineSelectTab1
"     " call NextBufRestricted(-1)
" endfunction

function! SessionSavePrompt()
  let curline = getline('.')
  call inputsave()
  let g:session_type = input('Session type: ') | redraw
  call inputrestore()
  execute(":SSave")
endfunction

function! GetSearchFtype()
    let search_types = ""
    if exists('g:session_type')
        if g:session_type == "cpp"
            let search_types = "--cc --cpp"
        endif
    endif
    return search_types
endfunction

function! Quote(str)
    let str = '"' . a:str . '"'
    return str
endfunction

" http://stackoverflow.com/a/6271254/187469
function! GetVisualSelection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  let str = join(lines, "\n")
  return join(lines, "\n")
endfunction

" http://stackoverflow.com/a/12216578/187469
" also have to call ':profile pause' when done
function! Profile()
    exec "profile start ~/vim_profile.log"
    exec "profile func *"
    exec "profile file *"
endfunction

"Key Bindings
""""""""""""""""""""""""
"move back and forth between arrows"
nmap <silent> <A-C-Up> :wincmd k<CR>
nmap <silent> <A-C-Down> :wincmd j<CR>
nmap <silent> <A-C-Left> :wincmd h<CR>
nmap <silent> <A-C-Right> :wincmd l<CR>

nnoremap ; :
vnoremap ; :
ca W w
map <S-w> :MBEbd<CR> 
map <Home> ^
imap <Home> <esc><Home>i
" Since x got turned into cut, i need a new key to delete a single char
nnoremap q x
vnoremap q x
nnoremap <S-q> q
" Paste from the default register during insert mode
inoremap <C-p> <C-r>"
" Paste at the end of the line
" Note that this will add a space, paste, then remove the space
nmap P A <esc>p$q

" nmap <C-p> 

" Completion menu
" Allows j and k to navigate up/down within completion menu
" http://stackoverflow.com/a/4016817/187469
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
" " accept selection with enter key
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" this makes arrow keys not break after escape is remapped below
" taken from https://github.com/spf13/vim-autoclose/blob/master/plugin/autoclose.vim 
" here is their explanation:
"   the following simply creates an ambiguous mapping so vim fully
"   processes the escape sequence for terminal keys, see 'ttimeout' for a
"   rough explanation, this just forces it to work
inoremap <silent> <C-[>OC <RIGHT>
" close completion menu with escape but stay in insert mode
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"


" this feels kinda bad, but might be worth considering
" inoremap ;; <C-N>

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
" TODO make this work with the one below
" replace currently selected text with default register
" without yanking it
" vnoremap p "_d[p


" I switched <x> to be the same as the old <d> key
" so it does cut
nnoremap x "cd
vnoremap x "cd
" vnoremap x "c<Del>
nnoremap xx "cdd
" vnoremap xx "cdd


" Buffer manipulation
" nnoremap <c-k> :AirlineMoveCurBufBackward<CR>
" nnoremap <c-l> :AirlineMoveCurBufForward<CR>

nnoremap <silent> - :bprev<CR>
nnoremap <silent> = :bnext<CR>
" nnoremap - :call NextBufRestricted(-1)<CR>
" nnoremap = :call NextBufRestricted(0)<CR>
" :map - :bprev<CR>
" :map = :bnext<CR>
" :nnoremap <c-h> :AirlinePrevBuffer<CR>
" :nnoremap <c-j> :AirlineNextBuffer<CR>

" nnoremap <F12> :AsyncRun ./build_srsmem.sh \|& tee build.log<CR>
nnoremap <F12> :call Build()<CR>
" nnoremap <F12> :AsyncRun pity install<CR>
nnoremap <F11> :call WaitStopCurrentJob()<CR>
nnoremap <F10> :call LoadBuildLog()<CR>
nnoremap <F9> :call BuildCurrentFile()<CR>

" Pasting stuff without ruining the formatting
set pastetoggle=<F2>

" this just flat out doesnt work
" map <m-v> :set paste<CR>o<esc>"*]p:set nopaste<CR>

" this takes a few moments to appear because it's not unique enough
" vnoremap / y/<C-R>"
" this appears instantly
vnoremap // y/<C-R>"<CR>
" the S-N at the end will take us back one match so we dont jump
" the \< and \ are word-boundary  characters
nnoremap // /\<<C-R>=expand("<cword>")<CR>\><CR><S-N>
" nnoremap // :<C-U>Ag! <C-R>=GetSearchFtype()<CR><Space><C-R>=Quote(GetVisualSelection())<CR>
" nnoremap <Leader>gd :cs find g <C-R>=expand("<cword>")<CR><CR>  

" Colors for tab plugin
" exe "hi! TabLine ctermfg=250 ctermbg=234 gui=underline guibg=DarkGrey" 
" exe "hi! TabLineSel term=reverse cterm=reverse ctermfg=110 ctermbg=234 gui=bold" 
" exe "hi! TabLineFill term=reverse cterm=reverse ctermfg=234 ctermbg=235 gui=reverse" 

" colors for indent guide
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

" Maintain visual selection when indenting in visual mode
vnoremap < <gv
vnoremap > >gv

" ctags
"""""""""""
set tags=./tags;
" set tags+=./tags;../.git/tags
" set tags=../.git/tags

" cscope
""""""""""""""""""""""""
" set cscopetag cscopeverbose
" " Use quickfix instead of the other dumb menu
" " TODO: using the quickfix automatically opens the first entry. Fix so it doesnt!
" " set cscopequickfix=s-,c-,d-,i-,t-,e-
"
" function! GetCscopeFile()
"     return projectroot#guess() . "/cscope.out" 
" endfunction


" if filereadable(GetCscopeFile())
"     execute("silent cs add " . GetCscopeFile())
"     " silent cs add cscope.out
" endif

function! CSRedir()
	let temp_reg = @"
	redir @"
	silent! execute cmd
    redir END
    let output = copy(@")
endfunction

function! SetupSession()
    " optimistically assume we dont have more than 1
    try
        silent cs remove 1
    catch
    endtry

    " try
    "     let cscopeFile = GetCscopeFile() 
    "     execute("silent cs add " . cscopeFile)
    " catch
    " endtry
endfunction

autocmd SessionLoadPost * call SetupSession()

" Jump Mode
"""""""""""""""
" Cant seem to make this plugin work how i would like, try again sometime

" call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
" call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
" call submode#leave_with('undo/redo', 'n', '', '<Esc>')
" call submode#map('undo/redo', 'n', '', '-', 'g-')
" call submode#map('undo/redo', 'n', '', '+', 'g+')
"" enter jump mode (also performs the first jump)
" call submode#enter_with('jump_mode', 'n', '', '<Space>jn', '<C-I>')
" call submode#enter_with('jump_mode', 'n', '', '<Space>jp', '<C-O>')
" call submode#leave_with('jump_mode', 'n', '', '<Esc>')
" " bind to forward and back jump
" call submode#map('jump_mode', 'n', '', 'n', '<C-I>')
" call submode#map('jump_mode', 'n', '', 'b', '<C-O>')

" Misc syntax
""""""""""""""""""""""""
au BufRead,BufNewFile *.scala set filetype=java
au BufRead,BufNewFile *.conf set filetype=apache
au BufRead,BufNewFile *.cginc set filetype=shaderlab
au BufRead,BufNewFile *.compute set filetype=shaderlab


" Find replace
" replace accross all files in current directory
" ag -l | xargs perl -pi -E 's/NetworkExp/Tracer/g'


" This will keep the spaces after an indentation
" Usually they go away if you make a newline and exit insert mode
" http://stackoverflow.com/a/7413117/187469 
" inoremap <CR> <CR>x<BS>
" nnoremap o ox<BS>
" nnoremap O Ox<BS>


" Misc extra keyword highlights
"""""""""""""""""""""""""""""""""""
" this should be orange with the hybrid color scheme
hi! Important ctermfg=173 
match Important /NOTE/

" Misc Notes
"""""""""""""""""""""""""""
" using vim to write git commit messages has problems sometimes (warnings on
" startup). This seems to fix it:
"       git config --global core.editor /usr/bin/vim
" where the path to vim matches your environment

" rtags
"""""""""""""""""""""""""""
let g:rtagsUseDefaultMappings = 0
noremap <Leader>ri :call rtags#SymbolInfo()<CR>
noremap <Leader>rj :call rtags#JumpTo(g:SAME_WINDOW)<CR>
noremap <Leader>rJ :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
noremap <Leader>rS :call rtags#JumpTo(g:H_SPLIT)<CR>
noremap <Leader>rV :call rtags#JumpTo(g:V_SPLIT)<CR>
noremap <Leader>rT :call rtags#JumpTo(g:NEW_TAB)<CR>
noremap <Leader>rp :call rtags#JumpToParent()<CR>
noremap <Leader>rf :call rtags#FindRefs()<CR>
noremap <Leader>rn :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rs :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
" noremap <Leader>rr :call rtags#ReindexFile()<CR>
noremap <Leader>rl :call rtags#ProjectList()<CR>
noremap <Leader>rw :call rtags#RenameSymbolUnderCursor()<CR>
noremap <Leader>rv :call rtags#FindVirtuals()<CR>
noremap <Leader>rb :call rtags#JumpBack()<CR>
noremap <Leader>rC :call rtags#FindSuperClasses()<CR>
noremap <Leader>rc :call rtags#FindSubClasses()<CR>
noremap <Leader>rd :call rtags#Diagnostics()<CR>



" Closes all buffers to the right of the current window
function! CloseRight()
    let l:startBuf = bufnr('%') 
    " exec ":AirlineLastBuffer"
    exec ":b".GetLastBuffer()
    while 1
        let l:curBuf = bufnr('%') 
        if l:startBuf == l:curBuf
            break
        endif

        " exec ":AirlinePrevBuffer"
        exec ":bprev"
        " delete previous buffer
        exec "bd ".l:curBuf
    endwhile
endfunction

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" set errorformat^=%-G%f:%l:\ warning:%m,%-G%f:%l:\ note:%m 
" set errorformat^=%-G%f:%l:%c\ \ \ required\ from\ %m,%-G%f:%l:\ note:%m 
" set errorformat=%*[^\"]\"%f\"%*\\D%l:\ %m,\"%f\"%*\\D%l:\ %m,%-G%f:%l:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,%-G%f:%l:\ for\ each\ function\ it\ appears\ in.),%-GIn\ file\ included\ from\ %f:%l:%c:,%-GIn\ file\ included\ from\ %f:%l:%c,%-GIn\ file\ included\ from\ %f:%l,%-Gfrom\ %f:%l:%c,%-Gfrom\ %f:%l,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',%D%*\\a:\ Entering\ directory\ `%f',%X%*\\a:\ Leaving\ directory\ `%f',%DMaking\ %*\\a\ in\ %f,%f\|%l\|\ %m

" GCC only
" src/pipeline/indexer/search/TaskGraph.cpp:856:52: error: no matching function for call to ‘make_edge(std::tuple_element<0, std::tuple<tbb::flow::interface11::internal::multifunction_output<tg::StatusMsg> > >::type&, tbb::flow::interface11::function_node<tg::StatusMsg::MessageT, tbb::flow::interface11::continue_msg>&)’
" set errorformat=%f:%l:%c:\ error:\ %m


" exe "hi! TabLine ctermfg=250 ctermbg=234 gui=underline guifg=#c5c8c6 guibg=DarkGrey"

" let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.srs'
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'

let g:hexmode_cols = 8

" csv
" The python code used by rainbow csv uses tempfile.gettempdir()
" which uses /tmp by default, apparently. However it will also use
" the TMPDIR environment variable to decide where to put files
let temp_dir = $HOME . "/.vim_temp"
if !isdirectory(temp_dir)
    call mkdir(temp_dir, "p")
endif
let $TMPDIR=temp_dir

" fzf
let fzfCmd = 'fd --type f' 
for ignore_pattern in g:project_settings.ignore_files
    let fzfCmd .= " --exclude " . ignore_pattern
endfor

let $FZF_DEFAULT_COMMAND=fzfCmd
exec "nnoremap <C-p> :FZF ".g:project_settings.fzf_root."<CR>"
nnoremap <C-o> :Buffers<CR>
let g:fzf_layout = { 'down': '~40%' }

function! LoadSRS()
    " The '%:p' part is the current filename being loaded
    exec "noautocmd %!bin/splunkd toCsv '%:p'"
endfunction

" au FileReadPre,FileReadPost,BufReadPre,BufReadPost,BufNewFile *.srs,*.srs.gz,*.srs.zst call LoadSRS()
au FileReadPre,FileReadPost,BufReadPre,BufReadPost,BufNewFile *.srs,*.srs.gz,*.srs.zst exec "%!$SPLUNK_HOME/bin/splunkd toCsv '%:p'"


" Terminal and Termdebug
" packadd termdebug

" https://github.com/vim/vim/issues/2716
" I think the idea is that double tapping escape switches immedietly back
" to normal mode. However, hitting escape once makes it wait for ttimeoutlen
" to elapse before going back to normal mode. I'm not sure exactly.
" The setting seems to fix the issue with arrow keys (which begin with escape)
" trigger exiting back to normal mode. That's why we cant just map escape without 
" the other stuff.
" I think the double escape is needed to make sure vim will try waiting for more input before continuing
" Idk
tnoremap <Esc> <C-W>N
tnoremap <Esc><Esc> <C-W>N
set timeout timeoutlen=1000  " Default
" set ttimeout ttimeoutlen=100  " Set by defaults.vim
set ttimeout ttimeoutlen=0  " Set by defaults.vim

set shortmess-=S
