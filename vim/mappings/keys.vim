
" I want my leader key to be the comma.
let mapleader = "," 

nnoremap ; :
inoremap jk <ESC> 
inoremap jj <ESC> 

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

inoremap <C-y> <ESC>:w <CR>:source %<CR>
nnoremap <C-y> :w <CR>:source %<CR>

inoremap <C-u> <ESC>:buffers<CR> 
nnoremap <C-u> :buffers<CR> 

inoremap <C-p> <ESC>:Files<CR> 
nnoremap <C-p> :Files<CR> 

nnoremap <leader>f :Files<CR> 
nnoremap <leader>b :Buffers<CR> 

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

