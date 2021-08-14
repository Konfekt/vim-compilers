if &compatible || exists('g:loaded_compilers')
    finish
endif

if exists(':Make') != 2
  command -bang -nargs=* -complete=file Make  silent make<bang> <args> | silent redraw!
endif
if exists(':LMake') != 2
  command -bang -nargs=* -complete=file LMake silent lmake<bang> <args> | silent redraw!
endif
if exists(':Compiler') != 2
  function! Compiler(bang, compiler, ...)
    silent exe 'compiler'  a:compiler
    silent exe 'Make' a:bang join(a:000)
  endfunction
  command -bang -nargs=+ -complete=compiler Compiler call Compiler(<bang>0 ? '!' : '', <f-args>)
endif
if exists(':LCompiler') != 2
  function! LCompiler(bang, compiler, ...)
    silent exe 'compiler' a:compiler
    silent exe 'LMake' a:bang join(a:000)
  endfunction
  command -bang -nargs=+ -complete=compiler LCompiler call LCompiler(<bang>0 ? '!' : '', <f-args>)
endif

let g:loaded_compilers = 1
