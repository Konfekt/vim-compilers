if exists('current_compiler')
	finish
endif
let current_compiler = 'clang-tidy'

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=clang-tidy\ -quiet
CompilerSet errorformat=%f:%l:%c:\ %t%s:\ %m
" CompilerSet errorformat=
" 	\%f:%l%c:{%*[^}]}{%*[^}]}:\ %trror:\ %m,
" 	\%f:%l%c:{%*[^}]}{%*[^}]}:\ %tarning:\ %m,
" 	\%f:%l:%c:\ %trror:\ %m,
" 	\%f:%l:%c:\ %tarning:\ %m,
" 	\%f(%l,%c)\ :\ %trror:\ %m,
" 	\%f(%l,%c)\ :\ %tarning:\ %m,
" 	\%f\ +%l%c:\ %trror:\ %m,
" 	\%f\ +%l%c:\ %tarning:\ %m,
" 	\%f:%l:\ %trror:\ %m,
" 	\%f:%l:\ %tarning:\ %m,
" 	\%D%*\\a[%*\\d]:\ Entering\ directory\ %*[`']%f',
" 	\%D%*\\a:\ Entering\ directory\ %*[`']%f',
" 	\%X%*\\a[%*\\d]:\ Leaving\ directory\ %*[`']%f',
" 	\%X%*\\a:\ Leaving\ directory\ %*[`']%f',
" 	\%DMaking\ %*\\a\ in\ %f


let &cpo = s:cpo_save
unlet s:cpo_save
