The folder `compilers/` contains compiler files.
Copy them into your Vim configuration folder (`~/.vim` on Linux and MacOS, `%USERPROFILE/vimfiles` on Microsoft Windows).
You may also use a plug-in manager such as [vim-plug](https://github.com/junegunn/vim-plug) (in this case, add `Plug konfekt/vim-compilers` to use them).

# Usage and Setup

Use them by `:compiler`.
For example, `:compiler flake8` to lint the current (Python) file by `flake8`.

## Linter

For convenience, define in `~/.vim/after/ftplugin/python.vim` a command

```vim
command! -buffer -bang Lint compiler flake8 | lmake<bang>
```

It can then be called to lint the main file by `:Lint`.

The location-list window that lists the compiler messages can then be opened by `:lwindow` and they can be jumped to by `:lN` respectively `:lp`.

To automatically open the location-list window after linting has finished, add `autocmd QuickFixCmdPost lmake lwindow`.

To automatically run `:Lint` after saving the modifications to a source code file, say `Python`, add to `~/.vim/after/ftplugin/python.vim`:

```vim
    autocmd BufWrite <buffer=abuf> Lint
```

## Compiler

For a compiler command, such as `python`, define in `~/.vim/after/ftplugin/python.vim` a command

```vim
command! -buffer -bang Compile compiler python | make<bang>.
```

that can then be called to compile the main file.
For example, if it is the one of the currently open buffer, then `:Compile %:S` suffices.

The (quickfix) window that lists the compiler messages can then be opened by `:cwindow` and they can be jumped to by `:cN` respectively `:cp`.

To automatically open the quickfix window after compilation has finished, add `autocmd QuickFixCmdPost make cwindow`.

# Jobs

To run a linter or compiler in the background, use a `:Make` command (instead of `:make` or `:lmake`), such as

- that of [vim-dispatch](https://github.com/tpope/vim-dispatch) or,
- with [AsyncRun.vim](https://github.com/skywind3000/asyncrun.vim/) installed (see also [Hints](#hints) below), that defined by

    ```vim
    command! -bang -nargs=* -complete=file -bar Make AsyncRun<bang> -auto=make -program=make
    ```

