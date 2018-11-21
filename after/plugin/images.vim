" ============================================================================
" after/plugin/images.vim
"
" Displaying and working with images in vim.
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
"
" ----------------------------------------------------------------------------

" Display images using `imagecat` when available.
"
" NOTE: `imagecat` only works in iTerm.
"
" Via:
"   https://til.hashrocket.com/posts/39f85bac84-open-images-in-vim-with-iterm-
if ! has("gui_running") && executable("imagecat")
  autocmd BufEnter *.png,*.jpg,*gif exec "! imagecat ".expand("%") | bw
endif
