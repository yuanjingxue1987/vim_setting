"set verbose=9
"set verbosefile=vimLog.txt

set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.

" Turn off modelines
set modelines=0

" if hidden is not set, TextEdit might fail.


" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

set timeoutlen=1000 ttimeoutlen=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Vim's auto indentation feature does not work properly with text copied from
" outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set textwidth=16000
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
" share clipboard
set clipboard=unnamed

set laststatus=2
"filetype plugin on
filetype plugin indent on     " required

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('VundleVim/Vundle.vim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('dense-analysis/ale')
  call dein#add('honza/vim-snippets')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Yggdroot/indentLine')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('epilande/vim-react-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
					\ 'build': 'sh -c "cd app & yarn install"' })
  call dein#add('junegunn/limelight.vim')
  " call dein#add('Shougo/neocomplete')  " since neovim does not support lua_based plugin
  call dein#end()
  call dein#save_state()
endif


inoremap jk <ESC>
imap qw jki
imap qa jkla

let mapleader = "\<Space>"
syntax on
set encoding=utf-8

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"config for syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_check_on_open = 'ra' 
"let g:syntastic_aggregate_errors = 1
""
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$']
map <F7> :NERDTreeToggle<CR>

let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide

"config for ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|(node_modules|offline\-module\-cache))$',
    \ 'file': '\v\.(exe|so|dll|pyc|DS_STORE)$'
    \ }

" theme config
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized
:highlight Normal ctermbg=NONE

" Relative Row Numbers
set number relativenumber

" fix back key not working problem\
:set backspace=indent,eol,start

" config for indentLine
let g:indentLine_char = '|'

" copy paste across vim instance
vmap <silent> ,y :w! /tmp/vitmp<CR>                                                                   
nmap <silent> ,p :r! cat /tmp/vitmp<CR>

" config for lightline
let g:lightline = {
  \   'colorscheme': 'solarized',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': '▸%3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '▸', 'right': '▸'
  \}
let g:lightline.subseparator = {
	\   'left': '▸', 'right': '▸' 
  \}

set foldlevel=99 

let g:ale_linters = {
\  'python': ['pylint'],
\  'javascript': ['eslint']
\}

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_open_list = 1
let g:ale_lint_delay = 5000
autocmd QuitPre * if empty(&bt) | lclose | endif

" %linter% is the name of the linter that provided the message
" " %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" " Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<CR>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" disable beeping and flashing when error occors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

let g:neocomplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab>        pumvisible() ? "\<C-n>" : "\<Tab>"

let g:tagbar_type_javascript = {
    \'ctagstype': 'javascript',
    \'kinds': [
        \ 'V:Variables',
        \ 'A:Array',
        \ 'C:Class',
        \ 'E:Export',
        \ 'F:Function',
        \ 'G:Generator',
        \ 'I:Import',
        \ 'M:Method',
        \ 'O:Object',
        \ 'T:Tag',
        \ 'P:Preperty'
    \]
\}
nmap <F8> :TagbarToggle<CR>

"nmap <C-j> <C-W>j
"nmap <C-k> <C-W>k
"nmap <C-h> <C-W>h
"nmap <C-l> <C-W>l

let g:limelight_conceal_ctermfg = 240
autocmd VimEnter * Limelight

set incsearch
set nohlsearch
nnoremap <c-h> :set hlsearch!<cr>
