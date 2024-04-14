" Maintainer: Peter Benjamin
" Email:      petermbenjamin+vim@gmail.com
"
" This is free and unencumbered software released into the public domain.
"
" Anyone is free to copy, modify, publish, use, compile, sell, or
" distribute this software, either in source code form or as a compiled
" binary, for any purpose, commercial or non-commercial, and by any
" means.

if exists("current_compiler") | finish | endif
let current_compiler = "ruff"

" older Vim always used :setlocal
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal makeprg=ruff\ check
setlocal errorformat=%f:%l:%c:\ %m

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
