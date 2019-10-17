"
" .vimrc
" Vedran Vinko <vinkovedran@gmail.com>
"

set nocompatible

filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')

" General plugins
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'
Plug 'chr4/nginx.vim'
Plug 'junegunn/vim-easy-align'
Plug 'townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Rust plugin
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
endif

call plug#end()

filetype plugin indent on

syntax on

set history=500

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

set showmode                    " show mode we're currently in
set nowrap                      " don't wrap lines
set tabstop=2                   " 2 spaces
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs
set shiftwidth=2                " spaces for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " show line numbers
set showmatch                   " show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                " case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                " shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set nolist                      " don't show invisible characters by default
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to paste mode

set shortmess+=I                " hide the launch screen
set clipboard=unnamed           " normal OS clipboard interaction
set autoread                    " automatically reload files changed outside of Vim
set magic                       " For regular expressions turn magic on

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>

set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " show the status line
set cmdheight=2                 "
set hidden                      " hide buffers
set undolevels=1000             " undo level
set nobackup                    " do not keep backup files
set noswapfile                  " do not write swap files
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab

set wildignore=*.swp,*.bak,*.pyc,*.o

set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
set nomodeline                  " disable mode lines (security measure)
set ttyfast                     " always use a fast terminal
"set cursorline                 " underline the current line, for quick orientation
set nocursorline
set ruler

nnoremap <leader>Q :q<CR>       " Quickly close the current window
nnoremap <leader>q :bd<CR>      " Quickly close the current buffer

" Sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

" Use hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nnoremap j gj
nnoremap k gk

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

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

" Insert date - Oct 8, 2018
nnoremap <leader>fd "=strftime("%b %d, %Y")<CR>p

" Rust
let g:rustfmt_autosave = 1

" Rainbow plugin
let g:rainbow_active = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
