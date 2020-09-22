" so ~/dotfiles/vim/vimrc.vim

call plug#begin('~/.vim/plugged')

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Show git status of changes in files
Plug 'mhinz/vim-signify'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
" If installed using Homebrew
Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 
" insert closing pairs
Plug 'jiangmiao/auto-pairs'

" cassandra(cql syntax highlighting)
" Plug 'elubow/cql-vim'
"

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" goyo plugin for texting
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-commentary'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Themes and color schemes
Plug 'sainnhe/edge'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Coc extensions
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" emmet
Plug 'mattn/emmet-vim'

call plug#end()

" wrap
set wrap
set linebreak

" colortheme
set background=dark
set termguicolors

colorscheme onedark

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

" I want my leader key to be the comma.
let mapleader = "," 

nnoremap ; :
inoremap jk  <ESC> 
inoremap jj <ESC> 

" fzf short cuts
nnoremap <C-p> :Files<CR>
nnoremap <leader>pg :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nmap // :BLines!<CR>
nmap ?? :Rg!<CR>

nnoremap <silent> <C-n> :NERDTree<CR>

" quickly modify vim configs
command! Config execute ":e $MYVIMRC"
command! Reload execute ":source $MYVIMRC"

" buffer window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap <leader>w <ESC>:w <CR>
nnoremap <leader>w :w <CR>

inoremap <C-y> <ESC>:w <CR>:source %<CR>
nnoremap <C-y> :w <CR>:source %<CR>

inoremap <C-u> <ESC>:buffers<CR> 
nnoremap <C-u> :buffers<CR> 

inoremap <C-p> <ESC>:Files<CR> 
nnoremap <C-p> :Files<CR> 

" Goyo Configurations
let g:goyo_width = 140


" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" NERDTree plugin specific commands
nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nb :NERDTreeFromBookmark 
nnoremap <leader>nf :NERDTreeFind<cr>

"autocmd vimenter * NERDTree


" If you want to disable gofmt on save
" let g:go_fmt_autosave = 0

" This file represents the minimal .vimrc needed to work with govim.
"
" We also include a number of suggested settings that we think the majority of
" users will like/prefer.
" key Mappings

set number
set relativenumber
set nocompatible
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

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
" set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number (requires Vim >= v8.1.1564)
set signcolumn=yes

" Suggestion: Turn on syntax highlighting for .go files. You might prefer to
" turn on syntax highlighting for all files, in which case
"
" syntax on
"
" will suffice, no autocmd required.
autocmd! BufEnter,BufNewFile *.go syntax on
autocmd! BufLeave *.go syntax off

" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
" include this by default in govim.
set autoindent
set smartindent
filetype indent on

" Suggestion: define sensible backspace behaviour. See :help backspace for
" more details
" set backspace=2

set tabstop=2
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

command! -nargs=* Wrap set wrap linebreak nolist

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
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

" Asciidoc Build command
nnoremap <silent> <leader>B :!asciidoctor %<CR>

" emmet
let g:user_emmet_leader_key=','


autocmd Filetype go setlocal tabstop=4

 " toggle invisible characters
" set list
" set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" highlight SpecialKey guifg=#333333 guibg=#111111

let g:user_emmet_leader_key=','

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

" signify configs
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk


" If you like colors instead
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
