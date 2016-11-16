" {{{ VARIOUS SETTINGS

set nofoldenable
set ignorecase
set smartcase

set nohlsearch

set undofile
set noswapfile

set completeopt=longest,menuone,preview

set virtualedit=block

" Display all matching files when tab completing
set wildmenu
set wildmode=longest:full

let maplocalleader = ","
let mapleader      = ","

" We can see the mode in airline anyway
set noshowmode

set list listchars=tab:├╶,trail:⋅,nbsp:␣
let &showbreak=' ↪'
set breakindent

set scrolloff=8

set hidden
set spell
set nojoinspaces

set matchpairs+=<:>

set pastetoggle=<F10>

let &fillchars = 'vert: ,fold:·'

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
nnoremap <Leader><Leader><Leader>ev :split $MYVIMRC<CR>

" Load .vimrc
nnoremap <Leader><Leader><Leader>lv :source $MYVIMRC<CR>

" }}}

" {{{ PLUGINS

call plug#begin('~/.vim/plugged')

" Make sure to use single quotes

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'garbas/vim-snipmate'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'haya14busa/vim-easyoperator-phrase'
Plug 'haya14busa/vim-operator-flashy'
Plug 'itchyny/vim-haskell-indent'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-user'
Plug 'majutsushi/tagbar'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mkitt/tabline.vim'
Plug 'neomake/neomake'
Plug 'osyo-manga/vim-over'
Plug 'romainl/flattened'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-haskellFold', { 'for': 'haskell' }

Plug '~/dotfiles/customvimstuff'

call plug#end()

" }}}

" {{{ EASYMOTION

let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys='aoeidtns''.pyfgcrlqjkxbmwvzuh:,'

" }}}

" {{{ NERDTREE

let g:NERDTreeQuitOnOpen = 1

" }}}

" {{{ NERDTREE-GIT-PLUGIN

let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "~",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "≋",
\ "Clean"     : "✔",
\ "Unknown"   : "?"
\ }

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

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '>'
"let g:airline#extensions#tabline#left_alt_sep = '>'

" }}}

" {{{ MAPPINGS

function! OpenSession()
	let bufnr = bufnr('%')
	if filereadable('.session.vim')
		source .session.vim
		if bufloaded(bufnr)
			execute 'buffer ' . bufnr
		endif
	else
		echoerr "No session found"
	endif
	unlet bufnr
endfunction

let s:qfopen = 0

function! QuickfixToggle()
	if s:qfopen
		cclose
		let s:qfopen = 0
	else
		leftabove copen
		wincmd k
		let s:qfopen = 1
	endif
endfunction

function! QuickfixOpen()
	if !s:qfopen
		leftabove copen
		wincmd k
		let s:qfopen = 1
	endif
endfunction

function! QuickfixClose()
	cclose
	if s:qfopen
		let s:qfopen = 0
	endif
endfunction

function! CheckFold()
	if foldclosed(line('.')) != -1
		foldopen!
	endif
endfunction

function! OpenLocalFold()
	if foldclosed(line('.')) != -1
		foldopen!
	else
		execute (line('.') + 1) . 'foldopen!'
	endif
endfunction

nnoremap <silent> <Leader><Leader><Leader>s :call OpenSession()<CR>

nnoremap <Leader>q gwip

vnoremap . :normal .<CR>
vnoremap < <gv
vnoremap > >gv
imap <expr> <Leader><CR> (pumvisible() ? "<C-Y>" : "") . '<Plug>snipMateNextOrTrigger'

vnoremap <Space> I<Space><Esc>gv
map y <Plug>(operator-flashy)
map Y <Plug>(operator-flashy)$
nnoremap :q<CR> :echo "Temporarily disabled"<CR>
nnoremap :w<CR> :echo "Temporarily disabled"<CR>

nnoremap <silent> Q :call QuickfixToggle()<CR>
nnoremap <silent> <Leader>n :cnext<CR>:call CheckFold()<CR>
nnoremap <silent> <Leader>r :cc<CR>:call CheckFold()<CR>
nnoremap <silent> <Leader>j :cprevious<CR>:call CheckFold()<CR>
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>tb :TagbarToggle<CR>

map e <Plug>(easymotion-prefix)
map j <Plug>(easymotion-bd-jk)
" temporarily disable movement key to get used to EasyMotion
map l <nop>
map h <nop>
map k <nop>
map f <nop>
map F <nop>
map t <Plug>(easymotion-bd-t)
map T <nop>
map s <Plug>(easymotion-s)
noremap es s
map w <Plug>(easymotion-bd-w)
map W <Plug>(easymotion-bd-W)
map b <Plug>(easymotion-bd-e)
map B <Plug>(easymotion-bd-E)
map E <Plug>(easymotion-E)
map ge <Plug>(easymotion-ge)
map gE <Plug>(easymotion-gE)
map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map en <Plug>(easymotion-bd-n)

map <silent> <Leader><Leader>s :OverCommandLine<CR>%s/

nnoremap <silent> <Leader>p :CtrlPMixed<CR>

nnoremap <silent> <Leader><Leader>h <C-W>h:bprevious<CR>
nnoremap <silent> <Leader><Leader>n <C-W>h:bnext<CR>
nnoremap <silent> <Leader><Leader>b <C-W>h:bfirst<CR>
nnoremap <C-W>_ <C-W>-
nnoremap <C-W>- <C-W>_
nnoremap <Leader>wm <C-W>h
nnoremap <Leader>wn <C-W>l

" split up so that this doesn't activate the mapping itself
nnoremap <silent> <expr> <Leader>td '/\vTO' . 'DO\|FI' . 'XME\|X' . "XX\<CR>:call CheckFold()\<CR>"

nnoremap <Leader>o <C-O>
nnoremap <Leader>i <C-I>
nnoremap <Leader><Leader>t <C-]>
nnoremap <Leader><Leader>c <C-t>
nnoremap <Leader>l <C-U>
nnoremap <Leader>s <C-D>
nnoremap <silent> <Leader><Leader>f :set foldenable<CR>
nnoremap <silent> <Leader><Leader>g :set nofoldenable<CR>

nnoremap <silent> <Leader><Leader>d :bdelete<CR>
nnoremap <silent> <Leader><Leader>!d :bdelete!<CR>
nnoremap <silent> <Leader><Leader>z :qa<CR>
nnoremap <silent> <Leader><Leader>!z :qa!<CR>
nnoremap <silent> <Leader><Leader>w :w<CR>
inoremap <silent> <Leader><Leader>w <Esc>:w<CR>
nnoremap <silent> <Leader><Leader>!w :wa<CR>:echom "All files written"<CR>

nnoremap p p=']<C-O>
nnoremap P P=']<C-O>

noremap <Leader>+ ;
noremap <Leader>] ,

nnoremap za zA
nnoremap zA za
nnoremap <silent> zo :call OpenLocalFold()<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

noremap g: g;

function! s:NextOrNewLine()
	return (col('.') >= col('$') && getline(line('.') + 1) =~? '\v\s+$') ? "\<Esc>jA" : "\<CR>"
endfunction

function! s:NextOrNewLineNormal()
	return (col('.') >= col('$') && getline(line('.') + 1) =~? '\v\s+$') ? "jA" : "i\<CR>"
endfunction

inoremap <expr> <CR> (pumvisible() ? "<C-Y>" : "") . <SID>NextOrNewLine()

inoremap <expr> <TAB> (pumvisible() ? "<C-N>" : "<TAB>")
inoremap <S-TAB> <C-P>
nnoremap <expr> <CR> <SID>NextOrNewLineNormal()

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
highlight gitGutterChangeDelete ctermfg=3 ctermbg=NONE
highlight LineNr ctermbg=NONE
highlight VertSplit cterm=NONE ctermbg=23
highlight StatusLineNC cterm=NONE ctermbg=23
highlight StatusLine cterm=NONE ctermfg=7 ctermbg=23
highlight TagbarHighlight ctermfg=7 ctermbg=NONE
highlight SpellBad ctermbg=NONE

augroup Highlighting
	autocmd!
	autocmd BufEnter * highlight airline_tabhid ctermbg=29
	autocmd BufEnter * highlight NERDTreeGitStatusDirDirty ctermfg=3
	autocmd BufEnter * highlight NERDTreeGitStatusModified ctermfg=3
	autocmd BufEnter * highlight NERDTreeGitStatusUntracked ctermfg=9
augroup END

" get highlight group of word under cursor
nmap <Leader><Leader><Leader>yi :call <SID>SynStack()<CR>

function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" }}}
