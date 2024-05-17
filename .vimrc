call plug#begin()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'itchyny/vim-cursorword'
Plug 'sheerun/vim-polyglot'
Plug 'bfrg/vim-cpp-modern'
Plug 'Yggdroot/indentLine'
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

set expandtab
set smarttab
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
autocmd FileType Makefile setlocal expandtab smarttab
set tabstop=5
set softtabstop=2
set shiftwidth=2
autocmd FileType Makefile setlocal expandtab smarttab
autocmd FileType cs setlocal softtabstop=4 shiftwidth=4
filetype plugin on
syntax on
set number
set mouse=
set ruler

set ignorecase
set smartcase
set hlsearch

set noswapfile
