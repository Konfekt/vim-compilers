" Maintainer: Enno Nagel
" Email:      enno.nagel+vim@gmail.com
" License:    MIT

if exists("current_compiler") | finish | endif
let current_compiler = "python"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal makeprg=python
setlocal errorformat=%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
      \%C\ \ \ \ %.%#,
      \%+Z%.%#Error\:\ %.%#,
      \%A\ \ File\ \"%f\"\\\,\ line\ %l,
      \%+C\ \ %.%#,
      \%-C%p^,
      \%Z%m,
      \%-G%.%#

silent CompilerSet makeprg
silent CompilerSet errorformat
