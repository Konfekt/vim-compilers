if exists("current_compiler") | finish | endif
let current_compiler = "lacheck"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=lacheck
CompilerSet errorformat="%f",\ line\ %l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
