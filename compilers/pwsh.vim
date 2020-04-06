" Vim compiler plugin file adapted from:
" Language:           Windows PowerShell
" Maintainer:         Jesse Harris <jesse@zigford.org>
" Contibuter:         Enno Nagel
" Version:            3.00
" Project Repository: https://github.com/zigford/vim-powershell
" Vim Script Page:    TBA
" License:
" Copyright 2005-2012 Peter Provost
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
" http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

if exists("current_compiler")
  finish
endif
let current_compiler = "pwsh"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

if !exists("g:ps1_makeprg_cmd")
  if executable('pwsh')
    " pwsh is the future
    let g:ps1_makeprg_cmd = 'pwsh'
  elseif executable('pwsh.exe')
    let g:ps1_makeprg_cmd = 'pwsh.exe'
  elseif executable('powershell.exe')
    let g:ps1_makeprg_cmd = 'powershell.exe'
  else
    let g:ps1_makeprg_cmd = ''
  endif
endif

if !executable(g:ps1_makeprg_cmd)
  echoerr "To use the powershell compiler, please set g:ps1_makeprg_cmd to the powershell executable!"
  finish
endif

let &l:makeprg = g:ps1_makeprg_cmd
" Load Vanilla Shell and show syntax errors
" See https://zigford.org/powershell-syntax-now-supported-by-ale-vim-plugin.html
if has('win32')
setlocal makeprg+=\ -NoProfile\ -NoLogo\ -NonInteractive\ -command\ \"&{
        \trap{$_.tostring();continue}&{
        \[void]$executioncontext.invokecommand.invokescript('%')
        \}
    \}\"
elseif has('unix')
setlocal makeprg+=\ -NoProfile\ -NoLogo\ -NonInteractive\ -command\ "&{
          \trap{\\$_.tostring();continue}&{
          \[void]\\$executioncontext.invokecommand.invokescript('%')
          \}
          \}"
    \}\"
else
  echoerr "To use the powershell compiler, please run it under Microsoft Windows or Unix!"
  finish
endif
" Use absolute path because powershell requires explicit relative paths
" (./file.ps1 is okay, but # expands to file.ps1)
setlocal makeprg+=\ %:p:S
silent CompilerSet makeprg
silent CompilerSet errorformat=%EAt\ %f:%l\ char:%c,%-C+%.%#,%Z%m,%-G\\s%#

