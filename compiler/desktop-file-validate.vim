if exists("b:current_compiler") | finish | endif
let b:current_compiler = "desktop-file-validate"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=desktop-file-validate
CompilerSet errorformat=%f:\ %t%*[^:]:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
