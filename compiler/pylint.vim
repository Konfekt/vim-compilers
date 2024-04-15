if exists("current_compiler") | finish | endif
let current_compiler = "pylint"

let s:cpo_save = &cpo
set cpo&vim

" if has('unix')
"   silent let s:cpu_cores = system('getconf _NPROCESSORS_ONLN')
"   let s:jobs = (v:shell_error == 0 && cpu_cores > 1) ? s:cpu_cores - 1 : 0
"   unlet s:cpu_cores
" endif

let &l:makeprg = 'pylint' . 
      \ ' --jobs=0' .
      \ ' --output-format=text --msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}" --reports=no'
let &l:errorformat =
      \ '%A%f:%l:%c:%t: %m,' .
      \ '%A%f:%l: %m,' .
      \ '%A%f:(%l): %m,' .
      \ '%-Z%p^%.%#,' .
      \ '%-G%.%#'
silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
