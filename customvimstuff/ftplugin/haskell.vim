" {{{ necoghc

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

" }}}

" {{{ neomake

augroup Neomake
	autocmd!
	autocmd BufWritePost *.hs call QuickfixOpen()
	autocmd BufWritePost *.hs Neomake!
	autocmd BufWritePost *.hs call jobstart(['bash', '-O', 'globstar', '-c', 'hothasktags ./**/*.hs > tags'])
	autocmd BufWritePost *.hs AirlineRefresh
augroup END

let &makeprg = 'stack build --exec "hlint src"'

" }}}

" {{{ Assorted settings

augroup Session
	autocmd BufCreate *.hs mksession! .session.vim
	autocmd BufLeave *.hs mksession! .session.vim
	autocmd BufEnter *.hs mksession! .session.vim
	autocmd QuitPre * TagbarClose
	autocmd QuitPre * NERDTreeClose
	autocmd QuitPre * call QuickfixClose()
	autocmd VimLeavePre *.hs mksession! .session.vim
augroup END

setlocal textwidth=79
setlocal smartindent
setlocal autoindent
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

" }}}

" {{{ Assorted mappings

nnoremap ,s. vip:EasyAlign<CR><C-X>-><CR>
vnoremap ,s. :EasyAlign<CR><C-X>-><CR>

inoremap <LocalLeader>: <ESC>yypA<Space><ESC>kA<Space>::<Space>
inoremap -. <Space>-><Space>
inoremap :: <Space>::<Space>

" }}}

" {{{ Colorstuff

highlight Special cterm=italic
highlight hsModuleName ctermfg=6 cterm=italic
highlight hsImportLabel ctermfg=5
highlight hsModuleStartLabel ctermfg=2
highlight hsStructure ctermfg=2
highlight hsStatement ctermfg=2
highlight hsVarSym ctermfg=2
highlight hsString ctermfg=9 cterm=italic
highlight hsNumber ctermfg=6 cterm=italic
highlight hsFloat ctermfg=6 cterm=italic
highlight hs_DeclareFunction ctermfg=2
highlight hsDelimiter ctermfg=1
highlight hsCharacter ctermfg=6 cterm=italic
highlight QuickFixLine ctermbg=NONE ctermfg=7

" }}}
