" Maintainer: Enno Nagel
" Email:      enno.nagel+vim@gmail.com
" License:    MIT

if exists("current_compiler") | finish | endif
let current_compiler = "mypy"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal makeprg=mypy\ --show-column-numbers\ %:S
setlocal errorformat=%f:%l:%c:\ %t%*[^:]:\ %m

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
