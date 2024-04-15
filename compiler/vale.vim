" Maintainer: Peter Benjamin

if exists('current_compiler') | finish | endif
let current_compiler = 'vale'

let s:save_cpo = &cpo
set cpo-=C

let &l:makeprg = 'vale --output=line %:S'
let &l:errorformat = '%f:%l:%c:%m'

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
