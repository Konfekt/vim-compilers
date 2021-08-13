" Vim compiler file
" Compiler: luacp

if exists('g:current_compiler')
    finish
endif
let g:current_compiler = 'luacp'

let s:save_cpo = &cpoptions
set cpoptions&vim

if exists(':CompilerSet') != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=luac\ -p
CompilerSet errorformat=luac:\ %f:%l:\ %m,%-G%.%#

let &cpoptions = s:save_cpo
unlet s:save_cpo
