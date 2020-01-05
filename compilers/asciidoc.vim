" Maintainer: Enno Nagel
" Email:      enno.nagel+vim@gmail.com
" License:    MIT

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
