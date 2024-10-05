" From vimtex - the LaTeX plugin for Vim 
" https://github.com/lervag/vimtex/blob/020206fbe1f6981855a3fe2f96ef893db782d4b8/compiler/latexmk.vim
" Maintainer: Karl Yngve Lervåg
" Email:      karl.yngve@gmail.com
" License:    MIT

if exists("current_compiler") | finish | endif
let current_compiler = "pulp"

let s:cpo_save = &cpo
set cpo&vim

setlocal makeprg=pulp

silent CompilerSet errorformat=
                      \%-G%*[^\ ])\ %.%#
                      \%-G%.%#For\ some\ reason%.%#
                      \%W%f:%l-%*[0-9?]:\ %*[^\ ]\ warning:\ %m
                      \%E%f:%l-%*[0-9?]:\ %*[^\ ]\ error:\ %m
                      \%W%f:%l-%*[0-9?]:\ %m
                      \%W%l-%*[0-9?]:\ %m
                      \%-G%.%#

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
