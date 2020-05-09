"
" .vimrc
" Vedran Vinko <vinkovedran@gmail.com>
"

set nocompatible
filetype off

call plug#begin('~/vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'chr4/nginx.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'
Plug 'townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
endif

call plug#end()

filetype plugin indent on
syntax on
colorscheme 1989

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set copyindent
set encoding=utf-8
set expandtab
set gdefault
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set magic
set nobackup
set nocursorline
set noerrorbells
set nolist
set nomodeline
set noshowmode
set noswapfile
set nowrap
set number
set pastetoggle=<F2>
set ruler
set scrolloff=4
set shiftround
set shiftwidth=2
set shortmess+=I
set showcmd
set showmatch
set smartcase
set smarttab
set softtabstop=2
set tabstop=2
set ttyfast
set undolevels=1000
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.o
set wildmenu
set wildmode=list:full

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" Use hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Insert \v as a first char in searching; disable Vim regex
nnoremap / /\v
vnoremap / /\v

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>

" Discard search
nnoremap <leader><space> :nohlsearch<CR>

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Quickly close the current window
nnoremap <leader>Q :q<CR>

" Quickly close the current buffer
nnoremap <leader>q :bd<CR>      

" Sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

" Insert date - Oct 8, 2018
nnoremap <leader>fd "=strftime("%b %d, %Y")<CR>p

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" C-U in insert/normal mode, to uppercase the word under cursor
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Quote words under cursor
nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" auto reload vimrc when editing it
" autocmd! bufwritepost .vimrc source ~/.vimrc
au FileType Makefile set noexpandtab

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Manage tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" NERDTree
" Open NERDTree if vim starts with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree with Ctrl+t
map <C-t> :NERDTreeToggle<CR>

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Rust
let g:rustfmt_autosave = 1

" Rainbow plugin
let g:rainbow_active = 1

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
