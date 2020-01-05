" Maintainer: Enno Nagel
" Email:      enno.nagel+vim@gmail.com
" License:    MIT

if exists("current_compiler") | finish | endif
let current_compiler = "pycodestyle"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal makeprg=pycodestyle\ %:S
setlocal errorformat=%f:%l:%c:\ %t%n\ %m

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
