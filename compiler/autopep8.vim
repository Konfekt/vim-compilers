if exists('current_compiler')
	finish
endif
let current_compiler = 'autopep8'

let s:cpo_save = &cpo
set cpo&vim

let &l:makeprg = 'autopep8 --in-place --aggressive --aggressive'

silent CompilerSet makeprg
silent CompilerSet errorformat=%f:%l:%c:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
