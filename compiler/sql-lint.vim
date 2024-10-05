" Vim compiler file
" Compiler: sql-lint

if exists("current_compiler")
  finish
endif
let current_compiler = "sql-lint"

let s:cpo_save = &cpo
set cpo&vim

let &l:makeprg = 'sql-lint'
silent CompilerSet makeprg

" test/test-files/test.sql:22 [sql-lint: invalid-drop-option] Option 'thing' is not a valid option
" setlocal errorformat=%f:%l%\ [%*[^%]]]\ %m,%-G%.%#
" "  See https://github.com/joereynolds/sql-lint#output
" let &l:errorformat =
"       \ . '%E{,'
"       \ . '%C%*\\sline: %l,'
"       \   '%C%*\\s%trror:%m,'
"       \ . '%+C%*\\ssource %m,'
"       \ . '%+C%*\\sadditionalInformation: %m,'
"       \ . '%Z},'
" 	    \ . '%-G\\s%#'

silent CompilerSet errorformat=%f:%l\ %m,
      \sql-lint\ was\ unable\ to\ lint\ the\ following query\ %s,
      \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
