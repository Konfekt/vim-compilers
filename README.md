The folder `compiler/` contains compiler files that set up compilers (or linters, that is, syntax checkers) for easy use in Vim.
Copy them into your Vim configuration folder (`~/.vim` on Linux and MacOS, `%USERPROFILE%/vimfiles` on Microsoft Windows).
You may also use a plug-in manager such as [vim-plug](https://github.com/junegunn/vim-plug) (in this case, add `Plug 'konfekt/vim-compilers'` to your `vimrc` to use them).

# Usage and Setup

Switch to a compiler by `:compiler ...` and then start it by `:make` or `:lmake`.
For example, first call `:compiler flake8` to switch to `flake8`, and then lint the current (Python) file by `:lmake`.
In one go: `:comp flake8 | lmake`.

## Calling a Linter

For convenience, define in `~/.vim/after/ftplugin/python.vim` a command

```vim
command! -buffer -bang Lint compiler flake8 | lmake %:S<bang>
```

It can then be called to lint the main file by `:Lint`.

The location-list window that lists all compiler messages can then be opened by `:lwindow`;
their locations can be jumped to by `:ln` respectively `:lp` (or use [vim-unimpaired](https://github.com/tpope/vim-unimpaired)'s mappings `]l` and `[l`.)

To automatically open the location-list window after linting has finished, add `autocmd QuickFixCmdPost lmake lwindow` to your `vimrc`.

To automatically run `:Lint` after saving the modifications to a source code file, say `Python`, add to `~/.vim/after/ftplugin/python.vim`:

```vim
    autocmd BufWrite <buffer=abuf> Lint
```

## Calling a Compiler

For a compiler command, such as `python`, define in `~/.vim/after/ftplugin/python.vim` a command

```vim
command! -buffer -bang Compile compiler python | make<bang>.
```

that can then be called to compile the main file.
For example, if it is the one of the currently open buffer, then `:Compile %:S` suffices.

The (quickfix) window that lists all compiler messages can then be opened by `:cwindow`;
their locations can be jumped to by `:cn` respectively `:cp` (or use [vim-unimpaired](https://github.com/tpope/vim-unimpaired)'s mappings `]q` and `[q`.).

To automatically open the quickfix window after compilation has finished, add `autocmd QuickFixCmdPost make cwindow` to your `vimrc`.

# Run as Jobs

To run a linter or compiler in the background, use an `:(L)Make` command (instead of `:make` or `:lmake`), such as

- that of [tasks.vim](https://github.com/mg979/tasks.vim), or
- that of [vim-dispatch](https://github.com/tpope/vim-dispatch), or
- that defined by

    ```vim
    command! -bang -nargs=* -complete=file Make AsyncRun<bang> -auto=make -program=make -strip <args>
    ```

    with [AsyncRun.vim](https://github.com/skywind3000/asyncrun.vim/) installed.
    To avoid empty lines in the quickfix list, add `let g:asyncrun_trim = 1` to your `vimrc`.
    Other [options](https://github.com/skywind3000/asyncrun.vim/wiki/Options), such as `g:asyncrun_save` might be of interest.

# Signpost Locations

The plug-in [vim-markify](https://github.com/dhruvasagar/vim-markify) marks all found locations by text signs at the side of the window.

# Additional Compilers

Vim already comes with many compiler files, see `:e $VIMRUNTIME/compiler`.

Googling for `GitHub Vim compilers` yielded compiler files for

- [Python](https://github.com/aliev/vim-compiler-python/), [Pytest](https://github.com/tartansandal/vim-compiler-pytest), [Flake8, pylint and mypy](https://github.com/drgarcia1986/python-compilers.vim)
- [Go](https://github.com/rjohnsondev/vim-compiler-go)
- [C#](https://github.com/Chiel92/vim-csharp-compiler-plugin)
- [Bash](https://github.com/congma/vim-compiler-checkbashisms)
- [LanguageTool](https://github.com/Konfekt/vim-langtool) ...

A [search request on GitHub itself](https://github.com/search?p=2&q=current_compiler++NOT+Maintainer+extension%3Avim+path%3Acompiler%2F+language%3A%22Vim+script%22&type=Code) yields compiler files for

- [minitest](https://github.com/dmcinnes/vimfiles/blob/master/compiler/minitest.vim)
- [ESlint, Jenkins, node.vim, npm and TypeScript](https://github.com/zhoudaxia2016/vim-profile/tree/master/compiler)
- [Gradle, JSlint, Maven, pychecker and pyflakes](https://github.com/niklasl/vimheap/tree/master/compiler)
- [LiveScript](https://github.com/determin1st/vim-lsx/blob/master/compiler/ls.vim)
- [Scala, Maven and JShint](https://github.com/salomvary/vimfiles/tree/master/compiler)
- [Clang and xCodebuild](https://github.com/zokeefe/vim/tree/master/compiler)
- [Go](https://github.com/arp242/gopher.vim/blob/master/compiler)
- [Fish](https://github.com/dag/vim-fish/blob/master/compiler/fish.vim)
- [Haskell Stack](https://github.com/pbrisbin/vim-compiler-stack)
- [GnuPlot](https://github.com/gagbo/vim-gnuplot/tree/master/compiler)
- [AutoHotKey](https://github.com/valacar/vimfiles/blob/master/compiler/autohotkey.vim) ...

