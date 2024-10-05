" Vim compiler file
" Compiler: Autohotkey

if exists("current_compiler")
  finish
endif
let current_compiler = "autohotkey"

let s:cpo_save = &cpo
set cpo&vim

if !exists('g:ahk_executable')
  if executable('autohotkey.exe')
    let g:ahk_executable = 'autohotkey.exe'
  else
    let g:ahk_executable = $ProgramFiles . '\Autohotkey\autohotkey.exe'
  endif
endif

if !(executable(g:ahk_executable) || filereadable(g:ahk_executable))
  echoerr 'To use the Autohotkey linter, please set g:ahk_executable to the path of the autohotkey.exe executable!'
endif

let &l:makeprg = shellescape(g:ahk_executable) . ' /ErrorStdOut'
silent CompilerSet makeprg

" Note: or make sure to add Autohotkey.exe's path to $PATH env. var.
silent CompilerSet errorformat=%E%f\ (%l)\ :\ ==>\ %m,%E\\s%#%m,%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
