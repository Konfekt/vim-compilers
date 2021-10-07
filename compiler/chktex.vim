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
