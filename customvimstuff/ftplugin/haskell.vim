" {{{ ghc-mod mappings

nnoremap <silent> <LocalLeader>gl :w<CR>:GhcModType<CR>
nnoremap <silent> <LocalLeader>gs :GhcModType<CR>
nnoremap <silent> <LocalLeader>gr :GhcModTypeClear<CR>
nnoremap <silent> <LocalLeader>gc :GhcModTypeClear<CR>:w<CR>:GhcModSplitFunCase<CR>w
nnoremap <silent> <LocalLeader>gg :w<CR>:GhcModSigCodegen<CR>j0w
inoremap <silent> <LocalLeader>gg <Esc>:w<CR>:GhcModSigCodegen<CR>j0w

" }}}

" {{{ compilation stuff

autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" }}}

" {{{ necoghc

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

" }}}

" {{{ Assorted settings

setlocal textwidth=79
setlocal smartindent
setlocal autoindent
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

" }}}

" {{{ Assorted mappings

function! NextOrNewLine()
	return (getline(line('.') + 1) =~? '\v^\s+$') ? "\<ESC>jA" : "\<CR>"
endfunction

inoremap <expr> <CR> (pumvisible() ? "<C-E>" : "") . NextOrNewLine()
nnoremap ,s. vip:EasyAlign<CR><C-X>-><CR>
vnoremap ,s. :EasyAlign<CR><C-X>-><CR>

" }}}

" {{{ Colorstuff

highlight hsModuleName cterm=NONE

" }}}
