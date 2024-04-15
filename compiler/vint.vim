let s:cpo_save = &cpo
set cpo&vim

if exists('current_compiler') | finish | endif
let current_compiler = 'vint'

CompilerSet makeprg=vint\ --no-color\ -s\ %
CompilerSet errorformat=%f:%l:%c:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
