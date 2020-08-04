
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'itchyny/lightline.vim'

Plug 'unblevable/quick-scope'

Plug 'justinmk/vim-sneak'

" insert closing pairs
Plug 'jiangmiao/auto-pairs'

" cassandra(cql syntax highlighting)
Plug 'elubow/cql-vim'
"
" emmet-vim
Plug 'mattn/emmet-vim'

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
Plug 'morhetz/gruvbox'

" Themes and color schemes
Plug 'joshdick/onedark.vim'

" post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'honza/vim-snippets'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'ap/vim-css-color'

call plug#end()

