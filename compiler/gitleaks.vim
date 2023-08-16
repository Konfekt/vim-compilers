" Vim compiler plugin for gitleaks.
" Compiler: gitleaks
" Maintainer: Peter Benjamin
" Last Change: 2023-08-15T18:11:31-07:00

if exists('current_compiler')
  finish
endif
let current_compiler = 'gitleaks'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

let &l:makeprg = 'gitleaks detect --verbose --no-git --no-color --no-banner --redact'
let &l:errorformat = '%-C%.%#,%AFingerprint: %f:%m:%l,%-Z%.%#'

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
