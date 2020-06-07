
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'itchyny/lightline.vim'

Plug 'unblevable/quick-scope'

Plug 'justinmk/vim-sneak'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" insert closing pairs
" Plug 'jiangmiao/auto-pairs'

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
" Plug 'sainnhe/edge'
Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'

"
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'honza/vim-snippets'

call plug#end()

