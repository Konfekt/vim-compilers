" Maintainer: Peter Benjamin

if exists('current_compiler') | finish | endif
let current_compiler = 'tflint'

let s:save_cpo = &cpo
set cpo-=C

let &l:makeprg = 'tflint --format compact'

setlocal errorformat=%f:%l:%c:\ %tarning\ -\ %m
setlocal errorformat+=%f:%l:%c:\ %trror\ -\ %m

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
