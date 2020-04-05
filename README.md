The folder `compilers/` contains compiler files that set up compilers (or linters) for easy use in Vim.
Copy them into your Vim configuration folder (`~/.vim` on Linux and MacOS, `%USERPROFILE%/vimfiles` on Microsoft Windows).
You may also use a plug-in manager such as [vim-plug](https://github.com/junegunn/vim-plug) (in this case, add `Plug 'konfekt/vim-compilers'` to your `vimrc` to use them).

# Usage and Setup

Switch to a compiler by `:compiler ...` and then start it by `:make` or `:lmake`.
For example, first call `:compiler flake8` to switch to `flake8`, and then lint the current (Python) file by `:lmake`.
In one go: `:comp flake8 | lmake`.

## Calling a Linter

For convenience, define in `~/.vim/after/ftplugin/python.vim` a command

```vim
command! -buffer -bang Lint compiler flake8 | lmake<bang>
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

To run a linter or compiler in the background, use a `:Make` command (instead of `:make` or `:lmake`), such as

- that of [vim-dispatch](https://github.com/tpope/vim-dispatch) or,
- with [AsyncRun.vim](https://github.com/skywind3000/asyncrun.vim/) installed, that defined by

    ```vim
    command! -bang -nargs=* -complete=file -bar Make AsyncRun<bang> -auto=make -program=make
    ```

    To avoid empty lines in the quickfix list, add `let g:asyncrun_trim = 1` to your `vimrc`.
    Other [options](https://github.com/skywind3000/asyncrun.vim/wiki/Options), such as `g:asyncrun_save` might be of interest.

# Signpost Locations

The plug-in [vim-markify](https://github.com/dhruvasagar/vim-markify) marks all found locations by text signs at the side of the window.
