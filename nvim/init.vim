" {{{ VARIOUS SETTINGS

set nocompatible

set ignorecase
set smartcase

set nohlsearch

set undofile
set noswapfile

set completeopt=longest,menuone,preview

let maplocalleader = ","
let mapleader      = ","

set list listchars=tab:├╶,trail:⋅
set showbreak=↪

let &fillchars = 'vert: '

" Remember to hold Shift while selecting to get regular terminal mouse
" selection back!
set mouse=a

augroup SignCol
	autocmd!
	autocmd BufEnter * sign define dummy
	autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END

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

Plug 'airblade/vim-gitgutter'
Plug 'garbas/vim-snipmate'
Plug 'itchyny/vim-haskell-indent'
Plug 'junegunn/vim-easy-align'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'neomake/neomake'
Plug 'romainl/flattened'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-haskellFold', { 'for': 'haskell' }

Plug '~/dotfiles/customvimstuff'

call plug#end()

" }}}

" {{{ GITGUTTER

let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 1000

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
"let g:airline_right_sep = '▝'

" }}}

" {{{ FINDING FILES

" Search recursively
set path+=**

" Display all matching files when tab completing
set wildmenu
set wildmode=longest:full

" }}}

" {{{ MAPPINGS

let s:qfopen = 0

function! QuickfixToggle()
	if s:qfopen
		cclose
		let s:qfopen = 0
	else
		copen
		wincmd k
		let s:qfopen = 1
	endif
endfunction

function QuickfixOpen()
	if !s:qfopen
		copen
		wincmd k
		let s:qfopen = 1
	endif
endfunction

imap <Leader>a <Plug>snipMateNextOrTrigger

nnoremap <silent> Q :call QuickfixToggle()<CR>
nnoremap <silent> <Leader>n :cnext<CR>zO
nnoremap <silent> <Leader>r :cc<CR>zO
nnoremap <silent> <Leader>p :cprevious<CR>zO
nnoremap <silent> <Leader>b :buffer 1<CR>

nnoremap <Leader>o <C-o>
nnoremap <Leader>i <C-i>
nnoremap <Leader>t <C-]>
nnoremap <Leader>c <C-t>

noremap <Leader>, ;
noremap <Leader>: ,

nnoremap za zA
nnoremap zA za

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap / /\v
nnoremap ? ?\v

noremap g: g;

function! s:NextOrNewLine()
	return (col('.') >= col('$') && getline(line('.') + 1) =~? '\v^\s+$') ? "\<ESC>jA" : "\<CR>"
endfunction

inoremap <expr> <CR> (pumvisible() ? "<C-Y>" : "") . <SID>NextOrNewLine()
inoremap <expr> <TAB> (pumvisible() ? "<C-N>" : "<TAB>")
inoremap <S-TAB> <C-P>

inoremap <Leader>f <C-X><C-F>

" }}}

" {{{ COLORSCHEME

set background=dark

color flattened_dark
highlight Normal ctermbg=NONE
highlight folded cterm=italic ctermbg=NONE
highlight SpecialKey ctermfg=0 ctermbg=NONE
highlight Comment ctermfg=10 cterm=italic
highlight TODO ctermbg=NONE
highlight gitGutterAdd ctermfg=2 ctermbg=NONE
highlight gitGutterChange ctermfg=3 ctermbg=NONE
highlight gitGutterDelete ctermfg=1 ctermbg=NONE
highlight gitGutterChangeDelete ctermbg=NONE ctermfg=3
highlight LineNr ctermbg=NONE

" get highlight group of word under cursor
nmap <Leader>sI :call <SID>SynStack()<CR>

function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" }}}
