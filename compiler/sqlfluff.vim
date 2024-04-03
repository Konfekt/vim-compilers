" Vim compiler file
" Compiler: sqlfluff

if exists("current_compiler")
  finish
endif
let current_compiler = "sqlfluff"

let s:cpo_save = &cpo
set cpo&vim

let &l:makeprg = 'sqlfluff lint --ignore parsing'
let &l:errorformat =
      \ '%WL: %l \| P: %c \| %m,' .
      \ '%+C | %m' .
      \ '%-G%.%#'

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
