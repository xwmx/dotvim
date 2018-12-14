" ============================================================================
" after/plugin/wrapping.vim
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
"
" " NOTE: Additional wrappping settings in gvimrc
" ============================================================================

" wrap / nowrap
set wrap

" linebreak / nolinebreak
"
" Wrap long lines at a character in 'breakat' rather than at the last
" character.
set linebreak

" breakat
"
" Characters that wrapping will break on when linebreak is set.
"
" (default ' ^I!@*-+;:,./?')
set breakat-=:

" breakindent
"
" Every wrapped line will continue visually indented (same amount of
" space as the beginning of that line), thus preserving horizontal blocks
" of text.
set breakindent

" showbreak
"
" String to put at the start of lines that have been wrapped.
set showbreak=└\ 

" cpo
"
" Vi-compatible options.
"
" Options:
"   n   When included, the column used for 'number' and
"       'relativenumber' will also be used for text of wrapped
""      lines.
"
" https://stackoverflow.com/a/5748653
set cpo+=n

" SetWrappingByFileType
"
" Specify FileType-specific wrap settings.
augroup SetWrappingByFileType
    autocmd!
    autocmd FileType log setlocal nowrap
augroup END

" ToggleWrap()
"
" Toggle between wrap and no wrap. Similar to `:set wrap!`
function! ToggleWrap()
  if &wrap == 0
    set wrap
    echo 'Line wrapping on. (set wrap)'
  else
    set nowrap
    echo 'Line wrapping off. (set nowrap)'
  endif
endfunction

" :W, :Wrap, :WrapToggle, :ToggleWrap commands.
"
" NOTE: :W Overrides :W / :Wall
" https://github.com/tpope/vim-eunuch/blob/master/doc/eunuch.txt#L87
command! -nargs=0 W call ToggleWrap()
command! -nargs=0 Wrap call ToggleWrap()
command! -nargs=0 WrapToggle call ToggleWrap()
command! -nargs=0 ToggleWrap call ToggleWrap()

" NOTE: This mapping overwrites a mapping from Vimwiki:
" https://github.com/vimwiki/vimwiki
nmap <leader>w :Wrap<CR>
