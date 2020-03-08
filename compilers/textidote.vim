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
let current_compiler = "textidote"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

if exists('g:textidote_jar') && filereadable(fnamemodify(g:textidote_jar, ':p'))
  let s:textidote_cmd = 'java -jar ' . shellescape(fnamemodify(g:textidote_jar, ':p'))
else
  echoerr "To use the textidote compiler, please set g:textidote_jar to the path of textidote.jar!"
  finish
endif

let &l:makeprg = s:textidote_cmd . ' --no-color --output singleline --check ' . matchstr(&l:spelllang, '^\a\a')

setlocal errorformat=
setlocal errorformat=%f(L%lC%c-L%\\d%\\+C%\\d%\\+):\ %m
setlocal errorformat+=%-G%.%#

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
