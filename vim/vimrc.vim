" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
" Plug 'bling/vim-airline'
" Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'itchyny/lightline.vim'
Plug 'joom/vim-commentary'
" Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/mru.vim'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" insert closing pairs
Plug 'jiangmiao/auto-pairs'

" themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-scripts/peaksea', { 'as': 'peaksea' }
Plug 'liuchengxu/space-vim-dark', { 'as': 'space-vim-dark' }
Plug 'Heorhiy/VisualStudioDark.vim', {'as': 'VisualStudioDark'}

call plug#end()

let g:deoplete#enable_at_startup = 1

set number

" Mappings
inoremap jk <ESC> 

" normal mode mappings
" copy to the end of the file
noremap Y y$

let mapleader = "," 

filetype plugin indent on
syntax on
set encoding=utf-8
" set shell=/usr/local/bin/zsh
set number
set relativenumber

set incsearch
set hlsearch
set ignorecase
set smartcase

set showcmd
set hidden
set ruler
set ttyfast
set ttimeout
set ttimeoutlen=50
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap
set backspace=indent,eol,start
set wildmenu
set wildmode=longest:full,full
set laststatus=2

set cursorline

" set wrap
" set linebreak
" set nolist
" set formatoptions=qrn1
" set spell spelllang=en_us
" set colorcolumn=80

set splitbelow
set splitright
set autoindent

"colorscheme dracula 
color peaksea
set background=dark
set termguicolors

let g:indentLine_char_list = ['┊', '|', '¦', '┆' ]
"let g:indentLine_char = '┊'
let g:indentLine_setColors = 0

" emmet 
" Enable just for html/css
" expand html with <c-y>, (ctrl + y) then ,
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" nerdtree mappings
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark 
" map <leader>nf :NERDTreeFind<cr>

let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'

"toggle netrw on the left side of the editor
nnoremap <leader>n :Lexplore<CR>

