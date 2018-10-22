" ============================================================================
" .gvimrc
"
" GUI-specific startup commands for Vim.
"
" http://vimdoc.sourceforge.net/htmldoc/gui.html#gvimrc
"
" Load order:
"   .vimrc
"   .gvimrc (This file)
"
" ---------
" About Vim
"
" Vim is a highly configurable text editor for efficiently creating and
" changing any kind of text. It is included as `vi` with most UNIX systems and
" with Apple OS X.
"
" https://www.vim.org/
" " ============================================================================

if filereadable(expand("~/.gvimrc.before"))
  source ~/.gvimrc.before
endif

" CtrlP OS-X Menu remapping
if janus#is_plugin_enabled('ctrlp') && has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif

