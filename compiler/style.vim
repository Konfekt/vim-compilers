" Maintainer: Enno Nagel
" Email:      enno.nagel+vim@gmail.com
"
" This is free and unencumbered software released into the public domain.
"
" Anyone is free to copy, modify, publish, use, compile, sell, or
" distribute this software, either in source code form or as a compiled
" binary, for any purpose, commercial or non-commercial, and by any
" means.

if exists("current_compiler") | finish | endif
let current_compiler = "style"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

if !exists('g:style_length')
  let g:style_length = 25
endif
if !exists('g:style_ari')
  " 1  = Kindergarten
  " 2  = First/Second Grade
  " 3  = Third Grade
  " 4  = Fourth Grade
  " 5  = Fifth Grade
  " 6  = Sixth Grade
  " 7  = Seventh Grade
  " 8  = Eighth Grade
  " 9  = Ninth Grade
  " 10 = Tenth Grade
  " 11 = Eleventh Grade
  " 12 = Twelfth grade
  " 13 = College student
  " 14 = Professor 
  let g:style_ari = 12
endif

let &l:makeprg = 'style --print-long ' . g:style_length . ' --print-ari ' . g:style_ari . ' --print-nom --language ' . matchstr(&l:spelllang, '^\a\a') . ' %:S'
setlocal errorformat=
setlocal errorformat=%f:%l:\ %m
setlocal errorformat+=%-G%.%#

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
