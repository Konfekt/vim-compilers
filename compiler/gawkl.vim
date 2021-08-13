" From https://github.com/vim/vim/blob/master/runtime/compiler/gawk.vim
" by Doug Kearns
" Vim compiler file
" Compiler: gawkl

if exists('g:current_compiler')
    finish
endif
let g:current_compiler = 'gawkl'

let s:save_cpo = &cpoptions
set cpoptions&vim

if exists(':CompilerSet') != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" From https://stackoverflow.com/questions/7165167/are-there-any-awk-syntax-checkers/7212314#7212314
silent CompilerSet makeprg=gawk\ --lint\ --source\ 'BEGIN{exit(0)}END{exit(0)}'\ --file=
silent CompilerSet errorformat=%Z%.awk:\ %f:%l:\ %p^\ %m,
		       \%Eg%\\=awk:\ %f:%l:\ fatal:\ %m,
		       \%Egawk:\ %f:%l:\ error:\ %m,
		       \%Wgawk:\ %f:%l:\ warning:\ %m,
		       \%Egawk:\ %f:%l:\ %.%#,
		       \gawk:\ %f:%l:\ %tatal:\ %m,
		       \gawk:\ %f:%l:\ %trror:\ %m,
		       \gawk:\ %f:%l:\ %tarning:\ %m,
		       \gawk:\ %tatal:\ %m,
		       \gawk:\ %trror:\ %m,
		       \gawk:\ %tarning:\ %m,
		       \%+C%.%#,
		       \%-G%.%#

let &cpoptions = s:save_cpo
unlet s:save_cpo
