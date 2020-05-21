
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mileszs/ack.vim'
" Plug 'vim-scripts/bufexplorer.zip'
Plug 'itchyny/lightline.vim'
" Plug 'joom/vim-commentary'
" Plug 'vim-scripts/mru.vim'
" Plug 'w0rp/ale'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
" If installed using Homebrew
Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run the install script if you use fzf only in Vim.
 
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" insert closing pairs
" Plug 'jiangmiao/auto-pairs'

" cassandra(cql syntax highlighting)
" Plug 'elubow/cql-vim'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Themes and color schemes
Plug 'sainnhe/edge'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

"
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Coc extensions
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" emmet
Plug 'mattn/emmet-vim'

call plug#end()

