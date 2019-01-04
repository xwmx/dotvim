" ============================================================================
" after/plugin/terminal.vim
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
" ============================================================================

" NVim Documentation:
" https://neovim.io/doc/user/nvim_terminal_emulator.html
if has('nvim')
    " Override global `bufhidden` setting to avoid unloading terminal.
  autocmd TermOpen * if &buftype == 'terminal' |
    \   setlocal bufhidden=hide notimeout nowrap ttimeout timeoutlen=100 |
    \ endif

  " Map <Esc> to switch to Terminal-Normal mode.
  tnoremap <Esc> <C-\><C-n>
else
  " Override global `bufhidden` setting to avoid unloading terminal.
  autocmd TerminalOpen * if &buftype == 'terminal' |
    \   setlocal bufhidden=hide notimeout nowrap ttimeout timeoutlen=100 |
    \ endif

  nmap <leader>tn :vert terminal<CR>
  nmap <leader>tv :vert terminal<CR>
  nmap <leader>ts :terminal<CR>
  nmap <leader>th :terminal<CR>

  " Map <Esc> to switch to Terminal-Normal mode.
  " NOTE: depends on `set notimeout ttimeout timeoutlen=100`
  tnoremap <Esc> <C-W>N
endif

" Enter Normal mode on ScrollWheelUp in terminal.
"
" Source:
" https://github.com/vim/vim/issues/2490#issuecomment-393973253
function! EnterNormalMode()
  if &buftype == 'terminal' && mode('') == 't'
    call feedkeys("\<c-w>N")
    call feedkeys("\<c-y>")
  endif
endfunction

tmap <silent> <ScrollWheelUp> <c-w>:call EnterNormalMode()<CR>
