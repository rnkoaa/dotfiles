
" I want my leader key to be the comma.
let mapleader = "," 

nnoremap ; :
inoremap jk <ESC> 
inoremap jj <ESC> 

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" buffer window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" easy save files
inoremap <leader>w <ESC>:w <CR>
nnoremap <leader>w :w <CR>
" Fast saving
nmap <leader>w :w!<cr>

" replace line with clipboard
" nnoremap <leader>yp <S-v>p

" duplicate lines
inoremap <C-d> <ESC>yyp
nnoremap <C-d> yyp

inoremap <C-y> <ESC>:w <CR>:source %<CR>
nnoremap <C-y> :w <CR>:source %<CR>

inoremap <C-u> <ESC>:buffers<CR> 
nnoremap <C-u> :buffers<CR> 

inoremap <C-p> <ESC>:Files<CR> 
nnoremap <C-p> :Files<CR> 

" nnoremap <leader>f :Files<CR> 
" nnoremap <leader>b :Buffers<CR> 

" Better tabbing
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" Asciidoc Build command
nnoremap <silent> <leader>B :!asciidoctor %<CR>

 " toggle invisible characters
" set list
" set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" highlight SpecialKey guifg=#333333 guibg=#111111

let g:user_emmet_leader_key=','

inoremap <silent> <leader>p <ESC>:Prettier<CR> 
nnoremap <silent> <leader>p :Prettier<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

