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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noshiftround
set expandtab
set autoindent
set copyindent
set smartindent
set cindent
" share clipboard
set clipboard=unnamed

set laststatus=2
"filetype plugin on
filetype plugin indent on     " required

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'altercation/vim-colors-solarized'
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/limelight.vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-rooter'
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-styled-components',
  \ 'coc-eslint',
  \ 'coc-pyright',
  \ 'coc-json'
  \ ]
call plug#end()

inoremap jk <ESC>
imap qw jki
imap qa jkla

let mapleader = "\<Space>"
syntax on
set encoding=utf-8

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = 'python3'

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

"config for fzf
nmap <C-P> :FZF<CR>

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

set foldlevel=99 

let g:ale_linters = {
\  'python': ['pylint'],
\  'javascript': ['eslint'],
\  'json': ['eslint']
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

let g:neocomplete#enable_at_startup = 0
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


let $NVIM_NODE_LOG_FILE='nvim-node.log'
let $NVIM_NODE_LOG_LEVEL='warn'

set notermguicolors

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#formatter = 'default'  " f/p/file-name.js
let g:airline#extensions#tabline#formatter = 'jsformatter' " path-to/f
let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js
" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid
" accidentally overwriting its contents.

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' line:'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
"let g:airline_theme='base16'

" If you only see boxes here it may be because your system doesn't have
" the correct fonts. Try it in vim first and if that fails see the help
" pages for vim-airline :help airline-troubleshooting

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
