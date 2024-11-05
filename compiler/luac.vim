" Vim compiler file
" Compiler: luac

if exists('g:current_compiler')
    finish
endif
let g:current_compiler = 'luac'

let s:save_cpo = &cpoptions
set cpoptions&vim

CompilerSet makeprg=luac\ -p
CompilerSet errorformat=luac:\ %f:%l:\ %m,%-G%.%#

let &cpoptions = s:save_cpo
unlet s:save_cpo
