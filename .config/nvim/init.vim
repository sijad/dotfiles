set shell=bash

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug '~/.fzf' | Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'

call plug#end()

source ~/.config/nvim/basic.vim

set noai

set history=1000

set number

set showbreak=↪\ 
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨," eol:↲,nbsp:·,
set list

" Theme
" let g:onedark_termcolors=256
set background=dark
colorscheme onedark
hi SpecialKey ctermfg=8
set termguicolors
set cc=80

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2


" Plugins
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 1

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_go_golangci_lint_options = '--enable-all
\ --disable typecheck
\ --disable gochecknoglobals
\ --disable gochecknoinits'

let g:sneak#use_ic_scs = 1

let mapleader = ";"
let g:mapleader = ";"

nmap <leader>f :GFiles<CR>
nmap <leader>F :GFiles?<CR>

nmap gs  <plug>(GrepperOperator)

set mouse=
set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_linters = {
\   'javascript': ['eslint', 'flow-language-server'],
\   'javascript.jsx': ['eslint', 'flow-language-server'],
\   'go': ['bingo', 'gotype', 'golint', 'golangci-lint'],
\}

let g:ale_fixers = {
\   'go': ['goimports', 'gofmt'],
\   'javascript': ['prettier', 'eslint'],
\   'javascript.jsx': ['prettier', 'eslint'],
\   'typescript': ['eslint', 'tslint'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'php': ['php_cs_fixer', 'phpcbf'],
\}
