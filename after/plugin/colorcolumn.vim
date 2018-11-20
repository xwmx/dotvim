" ============================================================================
" after/plugin/colorcolumn.vim
"
" Load order:
"   vimrc
"   after/plugin/*  (This file)
"   after/plugin/_.vim
"   gvimrc
" ============================================================================

" Highlight the 81st column, to limit line length to 80 columns.
"
" More Information:
"   http://programmers.stackexchange.com/a/148729
"   http://www.emacswiki.org/emacs/EightyColumnRule

function! ColorColumnInit()
  if has("gui_macvim")
    " Experimental ColorColumn that tweaks the non-GUI version to make the
    " foreground less glaring (to avoid too much noise from newlines) and make
    " the background match the NonText background.
    "
    " last: hi ColorColumn guifg=#bbbbbb guibg=#1a1a1a gui=NONE
    hi ColorColumn guifg=NONE guibg=#1c1d1e gui=bold
  else
    hi ColorColumn guifg=#f8f8f8 guibg=#161616 gui=NONE
  endif

  if exists('+colorcolumn')
    " In Vim >= 7.3, also highlight columns 120+
    "
    " (120-320 because you have to provide an upper bound and 320 just
    "  covers a 1080p GVim window in Ubuntu Mono 11 font.)
    let &colorcolumn="81,".join(range(120,320),",")
  else
    " fallback for Vim < v7.3
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
endfunction
call ColorColumnInit()
