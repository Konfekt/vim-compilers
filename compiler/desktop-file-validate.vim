if exists("b:current_compiler") | finish | endif
let b:current_compiler = "desktop-file-validate"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=desktop-file-validate
CompilerSet errorformat=%f:\ %t%*[^:]:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
