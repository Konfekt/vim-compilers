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

let s:cpo_save = &cpo
set cpo&vim

let g:compiler_ruff_options = get(g:, "compiler_ruff_options", "--preview")
let &makeprg="ruff check " . g:compiler_ruff_options . " --output-format=concise"
setlocal errorformat=%f:%l:%c:\ %m,%f:%l:\ %m,%f:%l:%c\ -\ %m,%f:

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
