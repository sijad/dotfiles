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
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

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

let g:sneak#use_ic_scs = 1

let mapleader = ","
let g:mapleader = ","

nmap <leader>f :GFiles<CR>
nmap <leader>F :GFiles?<CR>

nmap gs  <plug>(GrepperOperator)

set mouse=
set completeopt=menu,menuone,preview,noselect,noinsert

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

autocmd BufWritePre *.go :CocCommand editor.action.organizeImport

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
