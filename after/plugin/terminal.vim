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

" Hide terminal in buffer lists to avoid getting stuck in them when using
" `:bn` / `:bp`. More info: https://www.reddit.com/r/vim/comments/8njgul
autocmd TerminalOpen * if bufwinnr('') > 0 | setlocal nobuflisted | endif
