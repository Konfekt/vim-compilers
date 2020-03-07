if exists("current_compiler") | finish | endif
let current_compiler = "diction"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

let &l:makeprg = 'diction --suggest --beginner --language ' . matchstr(&l:spelllang, '^\a\a') . ' %:S'
setlocal errorformat=
setlocal errorformat=%f:%l:\ %m
setlocal errorformat+=%-G%.%#

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
