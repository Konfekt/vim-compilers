" vim compiler file
" Compiler:		cppcheck (C++ static checker)
" Maintainer:   Vincent B. (twinside@free.fr)
" Last Change:  2010 mars 14

if exists("cppcheck")
  finish
endif
let current_compiler = "cppcheck"

let s:cpo_save = &cpo
set cpo-=C

" silent CompilerSet makeprg=cppcheck\ --enable=all\ --quiet
silent CompilerSet makeprg=cppcheck\ --enable=style,information,performance,portability,missingInclude,unusedFunction\ --std=c++03\ --force\ --quiet
" " Use clang if available:
" exe 'silent CompilerSet'
"       \ ..' makeprg=cppcheck\ --enable=style,information,performance,portability,missingInclude,unusedFunction\ --std=c++03\ --force\ --quiet'
"       \ .. executable('clang') ? ' --clang=/usr/bin/clang' : ''

" silent CompilerSet errorformat=\[%f:%l\]:\ (%t%s)\ %m
silent CompilerSet errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

let &cpo = s:cpo_save
unlet s:cpo_save
