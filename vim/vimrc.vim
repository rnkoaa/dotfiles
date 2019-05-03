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
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" insert closing pairs
Plug 'jiangmiao/auto-pairs'

call plug#end()
let g:deoplete#enable_at_startup = 1

set number

" Mappings
inoremap jk <ESC> 

" normal mode mappings
noremap Y y$

let mapleader = "," 

filetype plugin indent on
syntax on
set encoding=utf-8
set shell=/usr/local/bin/zsh
set number
set relativenumber
set incsearch
set smartcase
set showcmd
set hidden
set ruler
set ttyfast
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap

" set wrap
" set linebreak
" set nolist
" set formatoptions=qrn1
" set spell spelllang=en_us
" " set colorcolumn=80

" " colorscheme solarized
" set background=light

let g:indentLine_setColors = 0

" emmet 
" Enable just for html/css
" expand html with <c-y>, (ctrl + y) then ,
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
