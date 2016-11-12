" VARIOUS SETTINGS
set nocompatible

set ignorecase
set smartcase
set nohlsearch

set completeopt=longest,menu,preview


let maplocalleader = ","
let mapleader      = ","

" VIMRC HELPERS

" Edit .vimrc
nnoremap <Leader>ev :split $MYVIMRC<CR>

" Load .vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>

" PLUGINS

call plug#begin('~/.vim/plugged')

" Make sure to use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'romainl/flattened'

Plug '~/dotfiles/customvimstuff'

call plug#end()

" FINDING FILES

" Search recursively
set path+=**

" Display all matching files when tab completing
set wildmenu
set wildmode=longest:full

" MAPPINGS

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap / /\v
nnoremap ? ?\v

inoremap <Leader>f <C-X><C-F>

" COLORSCHEME

color flattened_dark
highlight Normal ctermbg=NONE

