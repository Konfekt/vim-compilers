" The MIT License (MIT)
"
" Copyright (c) 2017 Pedro Ferrari
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

if exists("current_compiler") | finish | endif
let current_compiler = "chktex"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

" From https://github.com/petobens/dotfiles/blob/02a3307c5ab48fd57545043600968656e69433e5/vim/ftplugin/tex/latex_settings.vim
let s:compiler = 'chktex'
let g:chktex_parameters = get(g:, 'chktex_parameters', '--localrc ~/.chktexrc --inputfiles --quiet -v6')
let g:chktex_ignore_warnings = get(g:, 'chktex_ignore_warnings', '-n1 -n3 -n8 -n25 -n36')
let &l:makeprg = s:compiler . ' ' . g:chktex_parameters . ' ' . g:chktex_ignore_warnings
let &l:errorformat = '%EError %n in %f line %l: %m,' .
      \ '%WWarning %n in %f line %l: %m,' .
      \ '%WMessage %n in %f line %l: %m,' .
      \ '%Z%p^,' .
      \ '%-G%.%#'
silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
