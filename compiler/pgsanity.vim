" Vim compiler file
" Compiler: pgsanity

if exists("current_compiler")
  finish
endif
let current_compiler = "pgsanity"

let s:cpo_save = &cpo
set cpo&vim

let &l:makeprg = 'pgsanity'
let errorformat =
      \ '%Eline %l: %tRROR: %m,' .
      \ '%C %m'

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
