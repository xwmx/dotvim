" ============================================================================
" after/plugin/cursor.vim
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
"
" ============================================================================

" cursorcolumn
"
" Enable cursorcolumn.
if has("gui_macvim") && has("gui_running")
  set cursorcolumn
endif

" FlashCursorLineAndColumn()
"
" Double flash the cursor line and column in yellow.
"
" Original CursorLine color settings:
"   https://github.com/xwmx/seti.vim/blob/master/colors/seti.vim#L15
"
" Additional Information:
"   https://vi.stackexchange.com/a/3481
function! FlashCursorLineAndColumn()
  " set cursorcolumn
  hi CursorLine   ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow   gui=bold
  hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow   gui=bold
  redraw
  sleep 100m
  hi CursorLine   ctermfg=NONE  ctermbg=235  cterm=NONE  guifg=NONE  guibg=#1b2021  gui=NONE
  hi CursorColumn ctermfg=NONE  ctermbg=235  cterm=NONE  guifg=NONE  guibg=#16191a  gui=NONE
  redraw
  sleep 100m
  hi CursorLine   ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow   gui=bold
  hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow   gui=bold
  redraw
  sleep 100m
  hi CursorLine   ctermfg=NONE  ctermbg=235  cterm=NONE  guifg=NONE  guibg=#1b2021  gui=NONE
  hi CursorColumn ctermfg=NONE  ctermbg=235  cterm=NONE  guifg=NONE  guibg=#16191a  gui=NONE
  " set nocursorcolumn
endfunction

map <Leader>; :call FlashCursorLineAndColumn()<CR>

" Cursor Line Highlighting
set cursorline

" Cursor Blink Rate
set guicursor=n:blinkwait1400-blinkon800-blinkoff500
set guicursor=v:blinkwait1400-blinkon800-blinkoff500
