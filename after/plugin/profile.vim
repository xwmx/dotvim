" ============================================================================
" after/plugin/profile.vim
"
" See Also: vim --startuptime vim--startuptime.log file.js
"
" https://stackoverflow.com/a/12216578
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
"
" ============================================================================

function! ProfileStart()
  profile start profile.log
  profile func *
  profile file *
  echom "Profile Started."
endfunction
command! -nargs=0 ProfileStart call ProfileStart()

function! ProfilePause()
  profile pause
  echom "Profile Paused."
endfunction
command! -nargs=0 ProfilePause call ProfilePause()

function! ProfileContinue()
  profile continue
  echom "Profile Continued."
endfunction
command! -nargs=0 ProfileContinue call ProfileContinue()

function! ProfileQuit()
  profile pause
  noautocmd qall!
  echom "Profile Quit."
endfunction
command! -nargs=0 ProfileQuit call ProfileQuit()
