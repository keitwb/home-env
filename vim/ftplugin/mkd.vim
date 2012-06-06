" Taken from ./mediawiki.vim to make it easier to navigate long lines of
" markdown. 
"
"
setlocal wrap linebreak
setlocal textwidth=0
setlocal nonumber
 
" No auto-wrap at all.
setlocal formatoptions-=tc formatoptions+=l
if v:version >= 602 | setlocal formatoptions-=a | endif
 
" Make navigation more amenable to the long wrapping lines. 
noremap <buffer> k gk
noremap <buffer> j gj
noremap <buffer> <Up> gk
noremap <buffer> <Down> gj
noremap <buffer> 0 g0
noremap <buffer> ^ g^
noremap <buffer> $ g$
noremap <buffer> D dg$ 
noremap <buffer> C cg$ 
noremap <buffer> A g$a
 
inoremap <buffer> <Up> <C-O>gk
inoremap <buffer> <Down> <C-O>gj

" utf-8 should be set if not already done globally
setlocal fileencoding=utf-8
