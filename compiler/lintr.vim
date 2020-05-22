" Originally from https://github.com/jimhester/lintr/blob/980e5cd6c37d85582a48d7721a0ce9eff28c9941/inst/syntastic/lintr.vim 

" Original Author:
" Maintainer:  Jim Hester <james.f.hester at gmail dot com>
" License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.

" Maintainer: Enno Nagel
" Email:      enno.nagel+vim@gmail.com

if exists("current_compiler") | finish | endif
let current_compiler = "lintr"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

" " From SYNTASTIC:
" let g:syntastic_r_lintr_cache = 'FALSE'
" let g:syntastic_r_lintr_linters = 'default_linters'
" let makeprg = self.getExecEscaped() . ' --slave --no-restore --no-save' .
"     \ ' -e ' . syntastic#util#shescape(setwd . 'suppressPackageStartupMessages(library(lintr)); ' .
"     \       'lint(cache = ' . g:syntastic_r_lintr_cache . ', commandArgs(TRUE), ' . g:syntastic_r_lintr_linters . ')') .
"     \ ' --args ' . syntastic#util#shexpand('%')

let &l:makeprg = 'Rscript --slave --no-restore --no-save -e '
  \ . shellescape('suppressPackageStartupMessages(library(lintr));'
  \ . ' lint(cache = FALSE, commandArgs(TRUE), default_linters)')
  \ . '%:S'
let &l:errorformat =
  \ '%W%f:%l:%c: style: %m,' .
  \ '%W%f:%l:%c: warning: %m,' .
  \ '%E%f:%l:%c: error: %m,'
silent CompilerSet makeprg
" CompilerSet errorformat="%f",\ line\ %l:\ %m
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
