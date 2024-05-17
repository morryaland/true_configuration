call plug#begin()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
<<<<<<< HEAD
=======
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
>>>>>>> 10b25dd (config update)
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'preservim/nerdtree'
Plug 'itchyny/vim-cursorword'
Plug 'sheerun/vim-polyglot'
Plug 'bfrg/vim-cpp-modern'
Plug 'tribela/vim-transparent'
<<<<<<< HEAD
Plug 'fcpg/vim-orbital'
=======
>>>>>>> 10b25dd (config update)
Plug 'Yggdroot/indentLine'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
<<<<<<< HEAD

=======
>>>>>>> 10b25dd (config update)
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

let g:ycm_enable_semantic_highlighting=1
let g:ycm_enable_inlay_hints=1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

<<<<<<< HEAD
colorscheme orbital
=======
>>>>>>> 10b25dd (config update)

set expandtab
set smarttab
set smartindent
<<<<<<< HEAD
set tabstop=2
set softtabstop=2
set shiftwidth=2
autocmd FileType Makefile setlocal expandtab smarttab
=======
set tabstop=5
set softtabstop=2
set shiftwidth=2
autocmd FileType Makefile setlocal expandtab smarttab
autocmd FileType cs setlocal softtabstop=4 shiftwidth=4
>>>>>>> 10b25dd (config update)
filetype plugin on

syntax on
set number
set mouse=
set ruler

set ignorecase
set smartcase
set hlsearch

set noswapfile
<<<<<<< HEAD

=======
set updatetime=300
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
>>>>>>> 10b25dd (config update)

" default
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

" Pmenu
let g:transparent_groups += ['Pmenu']

augroup transparent
    autocmd VimEnter,ColorScheme * call MyTransparent()
augroup END

function! MyTransparent()
    " Customize the highlight groups for transparency in here.

    " CursorLine
    "hi CursorLine ctermfg=NONE ctermbg=239 guibg=NONE guibg=#4e4e4e

    " coc.nvim
    "hi CocMenuSel ctermbg=239 guibg=#4e4e4e
endfunction
