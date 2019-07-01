" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://github.com/aonemd/aaku/blob/master/vim/vimrc

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'itchyny/lightline.vim'
Plug 'joom/vim-commentary'
Plug 'vim-scripts/mru.vim'
Plug 'w0rp/ale'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" insert closing pairs
Plug 'jiangmiao/auto-pairs'

" cassandra(cql syntax highlighting)
Plug 'elubow/cql-vim'

"themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-scripts/peaksea', { 'as': 'peaksea' }
Plug 'liuchengxu/space-vim-dark', { 'as': 'space-vim-dark' }
Plug 'Heorhiy/VisualStudioDark.vim', {'as': 'VisualStudioDark'}

call plug#end()

" Mappings
inoremap jk <ESC> 

" normal mode mappings
" copy to the end of the file
noremap Y y$

let mapleader = "," 

filetype plugin indent on
" filetype indent on      " load filetype-specific indent files

syntax on
set encoding=utf-8
" set shell=/usr/local/bin/zsh
set number
set relativenumber

set incsearch
set hlsearch
set ignorecase
set smartcase

set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set showcmd            " show command in bottom bar
set hidden
set ruler
set ttyfast
set ttimeout
set ttimeoutlen=50
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set nobackup
set noswapfile
set nowrap
set backspace=indent,eol,start
set wildmenu             " visual autocomplete for command menu
set wildmode=longest:full,full
set laststatus=2

set cursorline           " highlight current line

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

" toggle gundo
" nnoremap <leader>u :GundoToggle<CR>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" let g:indentLine_char_list = ['┊', '|', '¦', '┆' ]
" "let g:indentLine_char = '┊'
" let g:indentLine_setColors = 0

" emmet 
" Enable just for html/css
" expand html with <c-y>, (ctrl + y) then ,

" AutoGroups
augroup configgroup
  autocmd!
  " autocmd! FileType c    setlocal ts=4 sts=4 sw=4 noexpandtab
  " autocmd! FileType java setlocal ts=4 sts=4 sw=4 expandtab
  " autocmd! FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall

  autocmd FileType json syntax match Comment +\/\/.\+$+

  autocmd VimEnter * highlight clear SignColumn
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4

  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2

augroup END

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

"move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

"keep text selected after indentation
vnoremap < <gv
vnoremap > >gv

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

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

