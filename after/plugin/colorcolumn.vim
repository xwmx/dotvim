" ============================================================================
" after/plugin/colorcolumn.vim
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
"
" ===========================================================================

" Highlight the 81st column, to limit line length to 79 columns + 1 column
" for `set listchars` newline character.
"
" More Information:
"   http://programmers.stackexchange.com/a/148729
"   http://www.emacswiki.org/emacs/EightyColumnRule

function! ColorColumnInit()
  if has("gui_macvim") && get(g:, 'colors_name', 'default') != 'dracula'
    " Experimental ColorColumn that tweaks the non-GUI version to make the
    " foreground less glaring (to avoid too much noise from newlines) and make
    " the background match the NonText background.
    "
    " last: hi ColorColumn guifg=#bbbbbb guibg=#1a1a1a gui=NONE
    hi ColorColumn guifg=NONE guibg=#1c1d1e gui=bold
  endif

  if exists('+colorcolumn')
    let &colorcolumn="81"
  else
    " fallback for Vim < v7.3
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
endfunction
call ColorColumnInit()
