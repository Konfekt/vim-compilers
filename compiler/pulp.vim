" From vimtex - the LaTeX plugin for Vim 
" https://github.com/lervag/vimtex/blob/020206fbe1f6981855a3fe2f96ef893db782d4b8/compiler/latexmk.vim
" Maintainer: Karl Yngve Lervåg
" Email:      karl.yngve@gmail.com
" License:    MIT

if exists("current_compiler") | finish | endif
let current_compiler = "pulp"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal makeprg=pulp

setlocal errorformat=
setlocal errorformat+=%-G%*[^\ ])\ %.%#
setlocal errorformat+=%-G%.%#For\ some\ reason%.%#
setlocal errorformat+=%W%f:%l-%*[0-9?]:\ %*[^\ ]\ warning:\ %m
setlocal errorformat+=%E%f:%l-%*[0-9?]:\ %*[^\ ]\ error:\ %m
setlocal errorformat+=%W%f:%l-%*[0-9?]:\ %m
setlocal errorformat+=%W%l-%*[0-9?]:\ %m
setlocal errorformat+=%-G%.%#

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
