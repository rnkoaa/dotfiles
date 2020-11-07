" wrap
set wrap
set linebreak

" We also include a number of suggested settings that we think the majority of
" users will like/prefer.
" key Mappings

" set number
" show the line number of the current cursor as well as the relative line numbers
set number relativenumber
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start
set wildmenu             " visual autocomplete for command menu
set wildmode=longest:full,full
set laststatus=2

set cursorline           " highlight current line

filetype plugin on

set mouse=a

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
" set ttymouse=sgr

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
" set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number (requires Vim >= v8.1.1564)
set signcolumn=yes

set autoindent
set smartindent
filetype indent on

set tabstop=2
set smarttab
set softtabstop=0
set shiftwidth=2
set expandtab

"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

set iskeyword+=-                      	" treat dash separated words as a word text object"
set conceallevel=0                      " So that I can see `` in markdown files

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

 " toggle invisible characters
set list
" This blog inspired me to change the tab marker
" https://hashrocket.com/blog/posts/cool-looking-tabs-in-vim
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
highlight SpecialKey ctermfg=grey ctermbg=black
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Fold methods
" set foldmethod=indent
" Enable enable this when you open or enter a JavaScript or TypeScript buffer, and disable it when you leave:
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Prettier config 
" enable prettier using .prettierrc
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_config_present = 1

command! Config execute ":e $MYVIMRC"
command! Reload execute ":source $MYVIMRC"
