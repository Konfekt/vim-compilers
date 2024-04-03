" Vim compiler file
" Compiler: luacheck
" Author: Sean Dewar <https://github.com/seandewar>

if exists('g:current_compiler')
    finish
endif
let g:current_compiler = 'luacheck'

let s:save_cpo = &cpoptions
set cpoptions&vim

CompilerSet makeprg=luacheck\ --no-color
CompilerSet errorformat=%f:%l:%c:\ %m,%-G%.%#

let &cpoptions = s:save_cpo
unlet s:save_cpo
