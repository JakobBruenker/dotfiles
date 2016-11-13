" {{{ VARIOUS SETTINGS

set nocompatible

set ignorecase
set smartcase

set nohlsearch

set undofile

set completeopt=longest,menuone,preview

let maplocalleader = ","
let mapleader      = ","

set list listchars=tab:├╶,trail:⋅
set showbreak=↪

set fillchars=vert:│

" Remember to hold Shift while selecting to get regular terminal mouse
" selection back!
set mouse=a

" }}}

" {{{ VIMRC HELPERS

" Edit .vimrc
nnoremap <Leader>ev :split $MYVIMRC<CR>

" Load .vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>

" }}}

" {{{ PLUGINS

call plug#begin('~/.vim/plugged')

" Make sure to use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'romainl/flattened'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

Plug '~/dotfiles/customvimstuff'

call plug#end()

" }}}

" {{{ DEOPLETE

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_smart_case = 0
let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#max_menu_width = 100
let g:deoplete#auto_complete_delay = 80

" }}}

" {{{ AIRLINE

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols['maxlinenr'] = ' '
let g:airline_theme = 'luna'
let g:airline_right_sep = ' '

" }}}

" {{{ FINDING FILES

" Search recursively
set path+=**

" Display all matching files when tab completing
set wildmenu
set wildmode=longest:full

" }}}

" {{{ MAPPINGS

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap / /\v
nnoremap ? ?\v

noremap g: g;

inoremap <expr> <Leader>n (pumvisible() ? "<C-E>" : "") . "<C-N>"
inoremap <Leader>f <C-X><C-F>

" }}}

" {{{ COLORSCHEME

set background=dark

color flattened_dark
highlight Normal ctermbg=NONE
highlight folded cterm=NONE ctermbg=NONE
highlight SpecialKey ctermfg=0 ctermbg=NONE

" }}}
