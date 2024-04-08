if exists("current_compiler") | finish | endif
let current_compiler = "lacheck"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=lacheck
CompilerSet errorformat="%f",\ line\ %l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
