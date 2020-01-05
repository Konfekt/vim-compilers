" From https://github.com/itspriddle/vim-shellcheck/blob/a9c2dd4ecfb73da4fbd953ca00cd4660ff11cee5/compiler/shellcheck.vim

" MIT License
"
" Copyright (c) 2018 Joshua Priddle <jpriddle@me.com>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

if exists("current_compiler")
  finish
endif
let current_compiler = "shellcheck"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=shellcheck\ -f\ gcc\ %:S
" CompilerSet makeprg=shellcheck\ -s\ bash\ -f\ gcc\ --\ %:S

CompilerSet errorformat=
      \%f:%l:%c:\ %trror:\ %m,
      \%f:%l:%c:\ %tarning:\ %m,
      \%I%f:%l:%c:\ note:\ %m
" CompilerSet errorformat=%f:%l:%c:\ %m\ [SC%n]

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:ft=vim:ts=2:sw=2:sts=2:et
