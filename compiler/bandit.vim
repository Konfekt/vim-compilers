" Vim compiler plugin for bandit.
" Compiler: bandit
" See https://github.com/PyCQA/bandit

if exists('current_compiler')
  finish
endif
let current_compiler = 'bandit'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

let &l:makeprg = 'bandit -r .'
let &l:errorformat = '%E>> Issue: %m,%+CLocation: %f:%l:%c,%-Z%\s%#'

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
