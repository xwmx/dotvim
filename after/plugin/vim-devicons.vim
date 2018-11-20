" ============================================================================
" after/plugin/vim-devicons.vim
"
" Load order:
"   vimrc
"   after/plugin/*  (This file)
"   after/plugin/_.vim
"   gvimrc
"
" NOTE: plugin initialization and configuration in vimrc.
" ============================================================================

" After a re-source, fix syntax matching issues (concealing brackets).
"
" More information:
" https://github.com/ryanoasis/vim-devicons/issues/154#issuecomment-222032236
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
