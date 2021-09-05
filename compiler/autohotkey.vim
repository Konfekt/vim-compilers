" Vim compiler file
" Compiler: Autohotkey

if exists("current_compiler")
  finish
endif
let current_compiler = "autohotkey"

if exists(":CompilerSet") != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

" Note: or make sure to add Autohotkey.exe's path to $PATH env. var.
let &l:makeprg = shellescape($ProgramFiles . '\Autohotkey\autohotkey.exe') . ' /ErrorStdOut'
setlocal errorformat=%E%f\ (%l)\ :\ ==>\ %m,%E\\s%#%m,%-G%.%#
silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
