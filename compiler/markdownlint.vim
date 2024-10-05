" From https://github.com/AndrewRadev/Vimfiles/blob/053f1cd90f74df1ad875e7622734444bdcde3d65/compiler/markdownlint.vim

if exists("current_compiler") | finish | endif
let current_compiler = "markdownlint"

let s:cpo_save = &cpo
set cpo&vim

silent CompilerSet makeprg=markdownlint\ --config\ $XDG_CONFIG_HOME/markdownlint
silent CompilerSet errorformat=%f:%l:%c\ MD0%n/%m,%f:%l\ MD0%n/%m,%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
