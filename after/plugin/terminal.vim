" ============================================================================
" after/plugin/terminal.vim
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
" ============================================================================

" Override global `bufhidden` setting to avoid unloading terminal.
autocmd TerminalOpen * if &buftype == 'terminal' |
  \   setlocal bufhidden=hide notimeout ttimeout timeoutlen=100 |
  \ endif

nmap <leader>tn :vert terminal<CR>
nmap <leader>tv :vert terminal<CR>
nmap <leader>ts :terminal<CR>
nmap <leader>th :terminal<CR>

" Map <Esc> to switch to Terminal-Normal mode.
" NOTE: depends on `set notimeout ttimeout timeoutlen=100`
tnoremap <Esc> <C-W>N
