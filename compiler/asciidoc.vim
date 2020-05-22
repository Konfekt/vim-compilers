" Maintainer: Enno Nagel
" Email:      enno.nagel+vim@gmail.com
"
" This is free and unencumbered software released into the public domain.
"
" Anyone is free to copy, modify, publish, use, compile, sell, or
" distribute this software, either in source code form or as a compiled
" binary, for any purpose, commercial or non-commercial, and by any
" means.

if exists("b:current_compiler") | finish | endif
let b:current_compiler = "asciidoc"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=asciidoc\ $*
CompilerSet errorformat=FAILED:\ %f:\ line\ %l:\ %m,%tRROR:\ %f:\ line\ %l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
