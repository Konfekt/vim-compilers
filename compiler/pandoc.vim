" Vim compiler file
" Compiler:     Pandoc
"
" Expects output file extension, say `:make html` or `:make pdf`.
" Passes additional arguments to pandoc, say `:make html --self-contained`.

if exists("current_compiler")
  finish
endif

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:keepcpo = &cpo
set cpo&vim

let current_compiler = 'pandoc'
execute 'CompilerSet makeprg=pandoc\ --standalone' .
      \ '\ --metadata\ lang=' . matchstr(&spelllang, '^\a\a') .
      \ '\ --metadata\ title=%:t:r:S\ --output\ %:r:S.$*\ %:S'
CompilerSet errorformat="%f",\ line\ %l:\ %m

let &cpo = s:keepcpo
unlet s:keepcpo

