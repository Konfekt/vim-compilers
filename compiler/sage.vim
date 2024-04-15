" Author: Franco Saliola <saliola@gmail.com>
"
" From https://github.com/saliola/vim-sage/blob/master/compiler/sage.vim
" All its license restrictions fully apply.

if exists("current_compiler") | finish | endif
let current_compiler = "sage"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=sage\ \-b\ \&\&\ sage\ \-t
CompilerSet errorformat=File\ \"%f\"\\,\ line\ %l:%.%#

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
