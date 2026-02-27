if &compatible || exists('g:loaded_compilers') | finish | endif


if exists(':Make') != 2
  command -bang -nargs=* -complete=file Make  silent exe 'make'<bang> <q-args> | silent redraw!
endif
if exists(':LMake') != 2
  command -bang -nargs=* -complete=file LMake silent exe 'lmake'<bang> <q-args> | silent redraw!
endif

function! s:RestoreMakeState(save) abort
  if a:save.makeprg_l ==# a:save.makeprg_g
    setlocal makeprg<
  else
    let &l:makeprg = a:save.makeprg_l
  endif

  if a:save.errorformat_l ==# a:save.errorformat_g
    setlocal errorformat<
  else
    let &l:errorformat = a:save.errorformat_l
  endif
endfunction

function! Compiler(bang, compiler, local, ...) abort
  let l:save = {
        \ 'had_current_compiler': exists('b:current_compiler'),
        \ 'current_compiler': get(b:, 'current_compiler', ''),
        \ 'makeprg_l': &l:makeprg,
        \ 'makeprg_g': &g:makeprg,
        \ 'errorformat_l': &l:errorformat,
        \ 'errorformat_g': &g:errorformat,
        \ }

  try
    execute 'compiler ' . fnameescape(a:compiler)

    let l:args = map(copy(a:000), 'shellescape(expand(v:val), 1)')
    let l:argstr = join(l:args)
    let l:make_cmd = a:local ?
          \ (exists(':LMake') == 2 ? 'LMake' : 'lmake') : 
          \ (exists(':Make') == 2 ? 'Make' : 'make')
    execute l:make_cmd .. a:bang l:argstr
  finally
    if l:save.had_current_compiler && !empty(l:save.current_compiler)
      try
        execute 'compiler' fnameescape(l:save.current_compiler)
      catch
        call s:RestoreMakeState(l:save)
        echom v:exception
      endtry
    else
      call s:RestoreMakeState(l:save)
      silent! unlet b:current_compiler
    endif
  endtry
endfunction

if exists(':Compiler') != 2
  command! -bang -nargs=+ -complete=compiler Compiler call Compiler(<bang>0 ? '!' : '', <f-args>, 0)
endif
if exists(':LCompiler') != 2
  command! -bang -nargs=+ -complete=compiler LCompiler call Compiler(<bang>0 ? '!' : '', <f-args>, 1)
endif

let g:loaded_compilers = 1
