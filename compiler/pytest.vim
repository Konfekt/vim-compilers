" Vim compiler file
" From https://github.com/mgedmin/dotvim/blob/6d9fcc3b18e36513a00ec0c4c2b567012f88e2e9/vimrc#L212-L290
" in https://old.reddit.com/r/vim/comments/1f5jsyf/makeprg_with_pytest/

if exists("current_compiler")
  finish
endif

let current_compiler = "pytest"

let s:cpo_save = &cpo
set cpo&vim
set cpo-=C

if has('unix')
  CompilerSet makeprg=PYTHONWARNINGS=ignore\ pytest\ --tb=short\ -q
elseif has('win32')
  CompilerSet makeprg=set\ PYTHONWARNINGS=ignore\ &&\ pytest\ --tb=short\ -q
endif

" Pytest syntax errors                                          {{{2

" Reset error format so that sourcing .vimrc again and again doesn't grow it
" without bounds
setlocal errorformat&

" For the record, the default errorformat is this:
"
"   %*[^"]"%f"%*\D%l: %m
"   "%f"%*\D%l: %m
"   %-G%f:%l: (Each undeclared identifier is reported only once
"   %-G%f:%l: for each function it appears in.)
"   %-GIn file included from %f:%l:%c:
"   %-GIn file included from %f:%l:%c\,
"   %-GIn file included from %f:%l:%c
"   %-GIn file included from %f:%l
"   %-G%*[ ]from %f:%l:%c
"   %-G%*[ ]from %f:%l:
"   %-G%*[ ]from %f:%l\,
"   %-G%*[ ]from %f:%l
"   %f:%l:%c:%m
"   %f(%l):%m
"   %f:%l:%m
"   "%f"\, line %l%*\D%c%*[^ ] %m
"   %D%*\a[%*\d]: Entering directory %*[`']%f'
"   %X%*\a[%*\d]: Leaving directory %*[`']%f'
"   %D%*\a: Entering directory %*[`']%f'
"   %X%*\a: Leaving directory %*[`']%f'
"   %DMaking %*\a in %f
"   %f|%l| %m
"
" and sometimes it misfires, so let's fix it up a bit
" (TBH I don't even know what compiler produces filename(lineno) so why even
" have it?)
setlocal errorformat-=%f(%l):%m

" Sometimes Vim gets confused about ISO-8601 timestamps and thinks they're
" filenames; this is a big hammer that ignores anything filename-like on lines
" that start with at least two spaces, possibly preceded by a number and
" optional punctuation
setlocal errorformat^=%+G%\\d%#%.%\\=\ \ %.%#

" Similar, but when the entire line starts with a date
setlocal errorformat^=%+G\\d\\d\\d\\d-\\d\\d-\\d\\d\ \\d\\d:\\d\\d%.%#

" make: *** [Makefile:14: target] Error 1
setlocal errorformat^=%+Gmake:\ ***\ %.%#

" FAILED tests.py::test_with_params[YYYY-MM-DD:HH:MM:SS] - Exception: bla bla
setlocal errorformat^=%+GFAILED\ %.%#

" AssertionError: assert ...YYYY-MM-DD:HH:MM:SS...
setlocal errorformat^=%+GAssertionError:\ %.%#

" --- /path/to/file:before  YYYY-MM-DD HH:MM:SS.ssssss
setlocal errorformat^=---%f:%m

" +++ /path/to/file:before  YYYY-MM-DD HH:MM:SS.ssssss
setlocal errorformat^=+++%f:%m

" Sometimes pytest prepends an 'E' marker at the beginning of a traceback line
setlocal errorformat+=E\ %#File\ \"%f\"\\,\ line\ %l%.%#

" Python tracebacks (unittest + doctest output)                 {{{2

" This collapses the entire traceback into just the last file+lineno,
" which is convenient when you want to jump to the line that failed (and not
" the top-level entry point), but it makes it impossible to see the full
" traceback, which sucks.
""setlocal errorformat+=
""            \File\ \"%f\"\\,\ line\ %l%.%#,
""            \%C\ %.%#,
""            \%-A\ \ File\ \"unittest%.py\"\\,\ line\ %.%#,
""            \%-A\ \ File\ \"%f\"\\,\ line\ 0%.%#,
""            \%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,
""            \%Z%[%^\ ]%\\@=%m

setlocal errorformat+=
      \File\ \"%f\"\\,\ line\ %l\\,%#%m
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
