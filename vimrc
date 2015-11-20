let g:python_host_prog = '/usr/bin/python2'

if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	set runtimepath+=~/.vim/bundle/ctrlp.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

let g:neobundle#types#git#default_protocol = 'git'

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" BUNDLES to install
NeoBundle 'rking/ag.vim'	" use ag within vim
NeoBundle 'wincent/command-t'	" fast way to find/open files
NeoBundle 'Raimondi/delimitMate'	" insert matching delimiters
NeoBundle 'shawncplus/phpcomplete.vim'	" php omni complete
NeoBundle 'guiniol/vim-showspaces.git'	" show whitespaces
NeoBundle 'scrooloose/syntastic'	" syntax checking plugin
NeoBundle 'majutsushi/tagbar'		" side-window with methods and variables
NeoBundle 'manicmaniac/betterga'	" show details of character under cursor
NeoBundle 'coderifous/textobj-word-column.vim'	" operate on columns of code
NeoBundle 'Valloric/YouCompleteMe'	" auto-complete

NeoBundle 'bling/vim-airline'	 " enhanced status bar
NeoBundle 'tpope/vim-commentary'	" allows commenting out sections
NeoBundle 'maksimr/vim-jsbeautify'	" javscript indent
NeoBundle 'sheerun/vim-polyglot'	" multiple sytax highlighters
NeoBundle 'mhinz/vim-signify'	" git in gutter
NeoBundle 'jez/vim-superman'	" view man pages
NeoBundle 'tpope/vim-surround'	" surround chunks of text
NeoBundle 'christoomey/vim-tmux-navigator'	 " tmux navigation
NeoBundle 'ctrlpvim/ctrlp.vim'  " CtrlP replacement


" Color schemes
NeoBundleLazy 'sjl/badwolf', { 'autoload':
    \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'vim-scripts/summerfruit256.vim', { 'autoload':
    \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'joedicastro/vim-github256', { 'autoload':
    \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'altercation/vim-colors-solarized', { 'autoload':
    \ { 'unite_sources' : 'colorscheme', }}

NeoBundle 'tomasr/molokai', { 'autoload':
	\ { 'unite_sources' : 'colorscheme', }}
NeoBundle 'joedicastro/vim-molokai256', { 'autoload':
	\ { 'unite_sources' : 'colorscheme', }}

call neobundle#end()

" Installation check
NeoBundleCheck

" vim-signify
let g:signify_vcs_list = [ 'hg', 'git' ]

augroup vimrc_help
	autocmd!
	autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" commentary
" augroup plugin_commentary
"     au!
"     au FileType python setlocal commentstring=#\ %s
"     au FileType php setlocal commentstring=//\ %s
"     au FileType htmldjango setlocal commentstring={#\ %s\ #}
" augroup END


" YouCompleteMe
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" ag (silver surfer)
let g:ackprg = 'ag --nogroup --nocolor --column'

" ctrlp - search through buffer by default
let g:ctrlp_cmd = 'CtrlPBuffer'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8'] " pylint
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✘'
let g:syntastic_style_error_symbol = 'S✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_style_warning_symbol = "S▲"
" let g:syntastic_auto_jump = 1

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 0

" Powerline
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_dividers_override = ['', '', '', '']
" let g:Powerline_symbols_override = { 'BRANCH': '', 'LINE': '', 'RO': '' }
" let g:Powerline_dividers_override = ["\ue0b2", "\ue0b3", "\ue0b0", "\ue0b1"]
" let g:Powerline_dividers_override = [">>", ">", "<", "<<"]
" set guifont=Inconsolata\ for\ Powerline.otf:h4

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_section_b = '%{strftime("%b %d\ %I:%M")}'

" After NeoBundle commands
filetype plugin indent on
syntax enable
set novb				" turn off sound, visual instead
set number			" turn online numbering
set autochdir		" change to dir of open file
set laststatus=2    	" status line always visible
set cursorline      	" highlight the line under the cursor
set hidden		" hide buffers instead of closing
set incsearch                       " incremental search
set showmatch                       " show matching pairs
set hlsearch                        " highlight search results
set noshowmode
set colorcolumn=80      " display a vertical line at this column
set ts=4 sw=4 sts=4
set expandtab
set noswapfile
set nobackup
set history=5000
set undofile
set undoreload=1000
set viminfo='10,\"100,:200,%,n~/.vim/viminfo

set smartindent
set smarttab
set synmaxcol=2048
set encoding=utf-8
set fillchars+=vert:│              " better looking window separator
set ttyfast                        " better screen redraw
set t_ut=                          " refresh entire screen
set virtualedit=block                " block is also handy for selecting
set mouse=a
set formatoptions+=j	" delete comment character when joining commented lines
set backspace=indent,eol,start  " defines backspace behavior
set tabpagemax=50
" don't include '-' as part of word
set isk-=-
set dictionary="/usr/dict/words"
" scriptencoding=utf-8


if has('gui_running')
	colorscheme molokai
else
    set t_Co=256 " set 256 colors for terminal
    colorscheme molokai256
endif

" fix key mappings
" Home key
imap <esc>OH <esc>0i
cmap <esc>OH <home>
nmap <esc>OH 0
" End Key
imap <esc>OF <end>
cmap <esc>OF <end>
nmap <esc>OF <end>
cmap w!! w !sudo tee > /dev/null %

let mapleader = "\<Space>"
map     <F2> :set invpaste paste?<CR>
map     <F3> :nohlsearch<CR>
map     <F8> :TagbarToggle<CR>
map     <F11> :cnext<CR>
map     <F12> :cprev<CR>
map     <S-F11> :cpfile<CR>
map     <S-F12> :cnfile<CR>
map     <C-F11> :colder<CR>
map     <C-F12> :cnewer<CR>
map     <leader>c "+y
map     <leader>p "+p
vmap    <leader>c "+y
vmap    <leader>p "+p
map 	<leader>a :Ack
nmap 	<leader>gj <plug>(signify-next-hunk)
nmap 	<leader>gk <plug>(signify-prev-hunk)
nmap 	<silent> <leader>ev :e $MYVIMRC<CR>
nmap 	<silent> <leader>sv :so $MYVIMRC<CR>
noremap K :SuperMan <cword><CR>
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <leader>m mmHmtK%s/<C-V><CR>//ge<CR>'tzt'm
nnoremap <leader>r :redraw!<CR>
map 	<leader>s :ToggleShowSpaces<CR>
map 	<leader>sr :SyntasticReset<CR>
nmap 	<silent> <leader>t :CommandT<CR>
map 	<leader>te :tabedit
map 	<leader>tn :tabnew<CR>
map 	<leader>tm :tabmove
nnoremap <leader>tr :e term://bash<CR>
map 	q: <CR>
nnoremap <leader>ya ggVG"zy
nnoremap ; :
nnoremap gb :bNext<CR>
nnoremap gB :bprevious<CR>
:set wildcharm=<C-Z>

" Restore cursor position on file load
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Backups
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/

" make the dirs if they don't exist
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" History and undo

" Wildmenu
set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?               " vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~     " backup files
set wildignore+=*.luac              " Lua byte code
set wildignore+=*.jar
set wildignore+=*.pyc
set wildignore+=*.stats             " PyLint stats

set wildchar=<Tab> wildmenu wildmode=full

" Searching
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch


" Spelling
abbreviate teh the
abbreviate htis this
abbreviate THe The
abbreviate THi Thi
abbreviate Tabe tabe
abbreviate Set set

" Tabs, spaces and wrapping
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent ft=python.django
autocmd FileType php setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent
autocmd FileType html setlocal ft=htmldjango.html


if has('gui_running')
	" remove menubar
	set go -=m
	" remove toolbar
	set go -=T
	" remove right scrollbar
	set go -=r
	" remove left scrollbar
	set go -=L
	" remove graphical tab bar, use text-based tab bar
	set guioptions -=e
endif


" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
