" vi: ft=vim

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
Plug 'joshdick/onedark.vim'

Plug 'honza/vim-snippets'

Plug 'pangloss/vim-javascript'
Plug 'stephpy/vim-yaml'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'ap/vim-css-color'

" Google java format
" https://github.com/google/vim-codefmt
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

" install glaive
call glaive#Install()
Glaive codefmt plugin[mappings]
" Glaive codefmt plugin[mappings]
" Glaive codefmt google_java_executable="java -jar $HOME/tools/google-java-format/google-java-format.jar"
"
Glaive codefmt google_java_executable="java -jar /Users/rnkoaa/tools/google-java-format/google-java-format-1.9-all-deps.jar"

augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  " autocmd FileType rust AutoFormatBuffer rustfmt
  " autocmd FileType vue AutoFormatBuffer prettier
augroup END
