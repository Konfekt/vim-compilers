" From https://github.com/AndrewRadev/Vimfiles/blob/053f1cd90f74df1ad875e7622734444bdcde3d65/compiler/markdownlint.vim

if exists("current_compiler") | finish | endif
let current_compiler = "markdownlint"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

silent CompilerSet makeprg=markdownlint
setlocal errorformat=%f:%l:%c\ MD0%n/%m
setlocal errorformat+=%f:%l\ MD0%n/%m
setlocal errorformat+=%-G%.%#
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
