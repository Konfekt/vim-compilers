" From vimtex - the LaTeX plugin for Vim 
" https://github.com/lervag/vimtex/blob/98327bfe0e599bf580e61cfaa6216c8d4177b23d/compiler/latexmk.vim
" Maintainer: Karl Yngve Lervåg
" Email:      karl.yngve@gmail.com
" License:    MIT

if exists('current_compiler') | finish | endif
let current_compiler = 'latexmk'

CompilerSet makeprg=latexmk\ -latex=pdflatex

" Note: The errorformat assumes we're using the -file-line-error with
"       [pdf]latex. For more info, see |errorformat-LaTeX|.

" Push file to file stack
CompilerSet errorformat=%-P**%f
CompilerSet errorformat+=%-P**\"%f\"

" Match errors
CompilerSet errorformat+=%E!\ LaTeX\ %trror:\ %m
CompilerSet errorformat+=%E%f:%l:\ %m
CompilerSet errorformat+=%E!\ %m

" More info for undefined control sequences
CompilerSet errorformat+=%Z<argument>\ %m

" More info for some errors
CompilerSet errorformat+=%Cl.%l\ %m

" Warnings

CompilerSet errorformat+=%+WLaTeX\ Font\ Warning:\ %.%#line\ %l%.%#
CompilerSet errorformat+=%-CLaTeX\ Font\ Warning:\ %m
CompilerSet errorformat+=%-C(Font)%m

CompilerSet errorformat+=%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#
CompilerSet errorformat+=%+WLaTeX\ %.%#Warning:\ %m

CompilerSet errorformat+=%+WOverfull\ %\\%\\hbox%.%#\ at\ lines\ %l--%*\\d

CompilerSet errorformat+=%+WUnderfull\ %\\%\\hbox%.%#\ at\ lines\ %l--%*\\d

" natbib
CompilerSet errorformat+=%+WPackage\ natbib\ Warning:\ %m\ on\ input\ line\ %l%.

" biblatex
CompilerSet errorformat+=%+WPackage\ biblatex\ Warning:\ %m
CompilerSet errorformat+=%-C(biblatex)%.%#in\ t%.%#
CompilerSet errorformat+=%-C(biblatex)%.%#Please\ v%.%#
CompilerSet errorformat+=%-C(biblatex)%.%#LaTeX\ a%.%#
CompilerSet errorformat+=%-C(biblatex)%m

" babel
CompilerSet errorformat+=%-Z(babel)%.%#input\ line\ %l.
CompilerSet errorformat+=%-C(babel)%m

" hyperref
CompilerSet errorformat+=%+WPackage\ hyperref\ Warning:\ %m
CompilerSet errorformat+=%-C(hyperref)%.%#on\ input\ line\ %l.
CompilerSet errorformat+=%-C(hyperref)%m

" scrreprt
CompilerSet errorformat+=%+WPackage\ scrreprt\ Warning:\ %m
CompilerSet errorformat+=%-C(scrreprt)%m

" fixltx2e
CompilerSet errorformat+=%+WPackage\ fixltx2e\ Warning:\ %m
CompilerSet errorformat+=%-C(fixltx2e)%m

" titlesec
CompilerSet errorformat+=%+WPackage\ titlesec\ Warning:\ %m
CompilerSet errorformat+=%-C(titlesec)%m

" Ignore unmatched lines
CompilerSet errorformat+=%-G%.%#
