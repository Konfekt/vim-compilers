" Maintainer: Enno Nagel
" Email:      enno.nagel+vim@gmail.com
" License:    MIT

if exists("current_compiler") | finish | endif
let current_compiler = "proselint"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=proselint\ %:S
CompilerSet errorformat=%f:%l:%c:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
