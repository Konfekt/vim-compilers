" Vim compiler plugin for GitHub Actions Workflows
" Compiler: actionlint
" Maintainer: Peter Benjamin
" Last Change: 2023-08-15T17:42:19-07:00

if exists('current_compiler')
  finish
endif
let current_compiler = 'actionlint'

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=actionlint\ -no-color\ -oneline
CompilerSet errorformat=%f:%l:%c:\ %m

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
