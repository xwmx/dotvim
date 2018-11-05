" ============================================================================
"              _
"   __ ___   _(_)_ __ ___  _ __ ___
"  / _` \ \ / / | '_ ` _ \| '__/ __|
" | (_| |\ V /| | | | | | | | | (__
"  \__, | \_/ |_|_| |_| |_|_|  \___|
"  |___/
"
" ----------------------------------------------------------------------------
"
" gvimrc
"
" GUI-specific startup commands for Vim.
"
" http://vimdoc.sourceforge.net/htmldoc/gui.html#gvimrc
"
" Load order:
"   vimrc
"   gvimrc (This file)
"
" ---------
" About Vim
"
" Vim is a highly configurable text editor for efficiently creating and
" changing any kind of text. It is included as `vi` with most UNIX systems and
" with Apple OS X.
"
" https://www.vim.org/
" ============================================================================

" ============================================================================
" Janus - gvimrc (begin)                                Janus - gvimrc (begin)
" ----------------------                               -----------------------

"
" Janus is a distribution of plug-ins and mappings for Vim, Gvim and MacVim.
"
" https://github.com/carlhuda/janus

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

" --------------------                                    --------------------
" Janus - gvimrc (end)                                    Janus - gvimrc (end)
" ============================================================================

" ============================================================================
" Encoding
" ============================================================================

scriptencoding utf-8
set encoding=utf-8

" ============================================================================
" Visual Bell
" ============================================================================

" Disable visual bell in MacVim.
"
" More information:
"   http://unix.stackexchange.com/q/5310
"   http://stackoverflow.com/q/16047146
"   http://stackoverflow.com/q/18589352
if has("gui_macvim")
  set noerrorbells
  set vb t_vb=
endif

" ============================================================================
" GUI options
" ============================================================================

" disable right scrollbar
set guioptions-=r
" disable left scrollbar
set guioptions-=L
" Only scroll to the end of the current line.
" set guioptions+=h

" ============================================================================
" Font
" ============================================================================

" SetGuiFont()
"
" Set the GUI font with a font size determined by the screen width.
"
" Fonts must be installed from here:
" https://github.com/abertsch/Menlo-for-Powerline
"
" Depends on (but does not require) cscreen:
" http://www.pyehouse.com/cscreen/
function! SetGuiFont()
  let screenwidth = system("cscreen | awk '{print $4}' | head -2 | tail -1")
  if screenwidth > "1919\n"
    set guifont=Menlo\ for\ Powerline:h13
  else
    set guifont=Menlo\ for\ Powerline:h11
  endif
endfunction
call SetGuiFont()

" ============================================================================
" Whitespace Display
" ============================================================================

" Whitespace settings are also performed elsewhere in the config process, such
" as in plugins.
"
" Some Janus listchars settings can be found here:
"   ~/.vim/core/before/plugin/settings.vim#L26
" Or on github:
"   http://git.io/janus-vim-core-before-plugin-settings-vim-L26

" Set end of line character.
"
" Common characters for eol: ¬ $ ~ ¤ ×
" ¬ is used in some other editors, such as Atom.
set listchars+=eol:¬

" Set tab character. Must be a two character string.
"
" Common characters for tabs: ▸ »
" » is used in some other editors, such as Atom.
set listchars+=tab:»\  " trailing space is intended.

" Set space to middle dot.
set listchars+=space:·

" ============================================================================
" Custom MacVim HIG Shift Movement Mappings
" ============================================================================

" Enable custom HIG movement and selection settings when running MacVim
"
" Custom mapping location:
"   .gvimrc.after
" Original system mappings:
"   https://github.com/b4winckler/macvim/blob/master/src/MacVim/gvimrc
"
if has("gui_macvim")
  " Disable MacVim system default mappings
  let macvim_skip_cmd_opt_movement = 1

  " Enable custom MacVim HIG movement mappings.
  let custom_macvim_hig_movement = 1

  " If the above custom setting is not enabled, fall back to the MacVim
  " defaults.
  if !exists("custom_macvim_hig_movement")
    " Reenable MacVim system default mappings
    unlet macvim_skip_cmd_opt_movement
    let macvim_hig_shift_movement = 1
  endif
endif

" MacVim default mappings can be found in the default gvimrc:
"
" https://github.com/b4winckler/macvim/blob/master/src/MacVim/gvimrc
if exists("custom_macvim_hig_movement")

  " Notable changes from defaults:
  "
  " ------------------------------------
  " Use Visual mode rather than Select
  " ------------------------------------
  "
  " Visual mode has more predictable behavior than select mode and is
  " generally eaiser to work with.
  "
  " ------------------------------------
  " Override MacVim right arrow movement
  " ------------------------------------
  "
  " MacVim right arrow movement seems to deviate from expected default OS X
  " cursor movement. These mappings make it behave more closely to other OS X
  " applications.

  " ##########################################################################
  " Command / Option Movement Mappings
  " ##########################################################################
  "
  " ##################
  " Command-Left Arrow
  " ##################
  "
  no   <D-Left>       <Home>
  no!  <D-Left>       <Home>
  "
  " ##################
  " Option-Left Arrow
  " ##################
  "
  no   <M-Left>       <C-Left>
  no!  <M-Left>       <C-Left>
  "
  " ##################
  " Command-Right Arrow
  " ##################
  "
  no   <D-Right>      <End>
  no!  <D-Right>      <End>
  "
  " ##################
  " Option-Right Arrow
  " ##################
  "
  " These mappings:
  "   Move to end of current word.
  "
  " Overrides MacVim default mappings:
  "   Move to beginning of next word.
  no   <M-Right>      e
  no!  <M-Right>      e
  ino  <M-Right>      <C-O>e<Right>
  "
  " ##################
  " Command-Up Arrow
  " ##################
  "
  no   <D-Up>         <C-Home>
  ino  <D-Up>         <C-Home>
  "
  " ##################
  " Option-Up Arrow
  " ##################
  "
  no   <M-Up>         {
  ino  <M-Up>         <C-o>{
  "
  " ##################
  " Command-Down Arrow
  " ##################
  "
  no   <D-Down>       <C-End>
  ino  <D-Down>       <C-End>
  "
  " ##################
  " Option-Down Arrow
  " ##################
  "
  no   <M-Down>       }
  ino  <M-Down>       <C-o>}
  "
  " ##################
  " Option-Backspace
  " ##################
  "
  ino  <M-BS>         <C-w>
  "
  " ##################
  " Command-Backspace
  " ##################
  "
  ino  <D-BS>         <C-u>


  " ##########################################################################
  " Shift Movement and Selection Mappings
  " ##########################################################################
  "
  " Note - selectmode and keymodel settings from original MacVim settings are
  " not used here since they enable select mode and this configuration prefers
  " visual mode for everything.
  "
  " #########################
  " Command-Shift-Left Arrow
  " #########################
  "
  nn   <S-D-Left>     v0
  vn   <S-D-Left>     0
  " NOTE: Use `<ESC>` for more natural selection behavior.
  " - `<ESC>`:
  "   Always select the character before the cursor.
  " - `<C-O>` (ctrl-O):
  "   Cursor is at end of line: select character before cursor.
  "   Cursor is not at end of line: select character after cursor.
  ino  <S-D-Left>     <ESC>v0
  "
  " #########################
  " Option-Shift-Left Arrow
  " #########################
  "
  nn   <S-M-Left>     vb
  vn   <S-M-Left>     b
  " NOTE: Use `<ESC>` for more natural selection behavior.
  " - `<ESC>`:
  "   Always select the character before the cursor.
  " - `<C-O>` (ctrl-O):
  "   Cursor is at end of line: select character before cursor.
  "   Cursor is not at end of line: select character after cursor.
  ino  <S-M-Left>     <ESC>vb
  "
  " #########################
  " Command-Shift-Up Arrow
  " #########################
  "
  nn   <S-D-Up>       vgg
  vn   <S-D-Up>       gg
  ino  <S-D-Up>       <C-O>vgg
  "
  " #########################
  " Command-Shift-Down Arrow
  " #########################
  "
  nn   <S-D-Down>     vG
  vn   <S-D-Down>     G
  ino  <S-D-Down>     <C-O>vG
  "
  " #########################
  " Command-Shift-Right Arrow
  " #########################
  "
  " These mappings:
  "   Enter visual mode and select rest of line without newline.
  "
  " Overrides MacVim Default mappings:
  "   Enter select mode and select to end of line with newline.
  "
  nn   <S-D-Right>    vg_
  vn   <S-D-Right>    g_
  ino  <S-D-Right>    <C-O>vg_
  "
  " ########################
  " Option-Shift-Right Arrow
  " ########################
  "
  " These mappings:
  "   Enter visual mode and select to end of current word.
  "
  " Overrides MacVim Default mappings:
  "   Enter select mode and select to beginning of next word.
  "
  nn   <S-M-Right>    ve
  vn   <S-M-Right>    e
  ino  <S-M-Right>    <C-O>ve

endif " exists("custom_macvim_hig_movement")

