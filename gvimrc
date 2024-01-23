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
"   after/plugin/*
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
function! SetGuiFont()
  " let screenwidth = system("cscreen | awk '{print $4}' | head -2 | tail -1")
  let screenwidth = system("
        \ if hash system_profiler 2>/dev/null
        \ then
        \   system_profiler SPDisplaysDataType | awk '/Resolution/{print $4}'
        \ fi")
  if screenwidth < "1919\n"
    set guifont=MesloLGMDZ\ Nerd\ Font:h11
    " Fallbacks
    set guifont+=Meslo\ LG\ M\ DZ\ for\ Powerline:h11
    set guifont+=Menlo\ for\ Powerline:h11
    set guifont+=Menlo:h11
  else
    set guifont=MesloLGMDZ\ Nerd\ Font:h13
    " Fallbacks
    set guifont+=Meslo\ LG\ M\ DZ\ for\ Powerline:h13
    set guifont+=Menlo\ for\ Powerline:h13
    set guifont+=Menlo:h13
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
" Turn off 'u' (undo) and 'q' (recording) key mappings
" ============================================================================

if has("gui_macvim")
  nmap q <Nop>
  " Turn off the 'u' (undo) key mapping in favor of macOS-standard <D-z>.
  nmap u <Nop>
endif

" ============================================================================
" Disable 'cmd-w' (close window) mapping
" ============================================================================

" Disable the 'cmd-w' (close window) and only use :q
" if has("gui_macvim")
"   # https://stackoverflow.com/a/8103117
"   macm File.Close key=<nop>
" endif

" ============================================================================
" MacVim macmenu
"
" Set Mac-specific properties for {menu}
" ============================================================================

" Remap new tap to command-shift-t (instead of command-t). This works better
" wit CtlrP
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

" ============================================================================
" Mouse and Scrolling
" ============================================================================

" sidescrolloff
"
" The minimal number of screen columns to keep to the left and to the
" right of the cursor if 'nowrap' is set.
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'sidescrolloff'
if !&sidescrolloff
  set sidescrolloff=1
endif

" Set `nowrap` and `MMScrollOneDirectionOnly` on MacVim with vim 9.1.0+.
if has("gui_macvim") && v:version >= 901
  let scrollOneDirectionOnlyStatus =
    \ system("defaults read org.vim.MacVim MMScrollOneDirectionOnly 2>/dev/null")

  if scrollOneDirectionOnlyStatus != "1\n"
    call system("defaults write org.vim.MacVim MMScrollOneDirectionOnly 1")
  endif

  set nowrap
endif

" CustomScrollWheelRight()
"
" Only right scroll until all of the longest line is visible in the window.
" When the cursor is not on the longest line and needs to be moved to keep
" scrolling, move it to the longest line, replicating the behavior of
" guioptions-=h
"
" Only works in normal mode.
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'guioptions'
function! CustomScrollWheelRight()
  " Return early if wrap is enabled.
  if &wrap
    return 0
  endif

  let l:cursor_column = col(".")
  let l:scroll_column = col(".") - wincol() - &fdc + &number * &numberwidth
  let l:window_width = winwidth(0) - &fdc - &number * &numberwidth

  let l:line_lengths = map(range(1, line('$')), "virtcol([v:val, '$'])")

  let l:longest_line_length = max(l:line_lengths)
  let l:longest_line_number = index(l:line_lengths , l:longest_line_length) + 1

  " Return early if the longest line length is less than the window.
  if l:longest_line_length <= l:window_width
    return 0
  endif

  let l:scroll_distance_from_end_of_longest_line =
    \ l:longest_line_length - l:window_width - l:scroll_column + 1

  let l:current_line_length = strlen(getline("."))
  let l:current_line_number = line('$')

  let l:distance_to_end_of_current_line =
    \ l:current_line_length - l:cursor_column

  " Return early if already scrolled to the end of the line.
  if l:scroll_distance_from_end_of_longest_line <= 0
    return 0
  endif

  " Move the cursor to the longest line when the end of the current line has
  " been reached.
  if l:current_line_number != l:longest_line_number
    if l:distance_to_end_of_current_line <= 0
      call cursor(l:longest_line_number , l:cursor_column)
    endif
  endif

  if l:scroll_distance_from_end_of_longest_line > 6
    normal 6zl
  else
    for i in range(1, l:scroll_distance_from_end_of_longest_line)
      normal zl
    endfor
  endif
endfunction

" ToggleCustomScrollWheelRight()
"
" Initialize CustomScrollWheelRight
"
" NOTE: Additional wrappping settings in after/plugin/dotvim.vim
function! ToggleCustomScrollWheelRight()
  if empty(maparg('<ScrollWheelRight>', 'n'))
    set nowrap
    " NOTE: When set to `nomousefocus`, scrolling in a window  without focus
    " results in unexpected behavior since the CustomScrollWheelRight()
    " calculations are performed in the focused window.
    set mousefocus
    map <ScrollWheelRight> :call CustomScrollWheelRight()<CR>
  else
    set wrap
    set nomousefocus
    unmap <ScrollWheelRight>
  endif
endfunction
" call ToggleCustomScrollWheelRight()

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
    " Reenable MacVim system default mappings.
    unlet macvim_skip_cmd_opt_movement
    " Enable MacVIm HIG shift movement related settings. These are not enabled
    " by default, but are enabled as a fallback. More info:
    " https://git.io/b4winckler-macvim-gvimrc-L71
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

  " ##################
  " Command-Left Arrow
  " ##################

  no   <D-Left>       <Home>
  no!  <D-Left>       <Home>

  " #################
  " Option-Left Arrow
  " #################

  no   <M-Left>       <C-Left>
  no!  <M-Left>       <C-Left>

  " ##################
  " Control-Left Arrow
  " ##################

  no   <C-Left>       <C-Left>
  no!  <C-Left>       <C-Left>

  " ###################
  " Command-Right Arrow
  " ###################

  no   <D-Right>      <End>
  no!  <D-Right>      <End>

  " ##################
  " Option-Right Arrow
  " ##################

  " These mappings:
  "   Move to end of current word.
  "
  " Overrides MacVim default mappings:
  "   Move to beginning of next word.
  no   <M-Right>      e
  no!  <M-Right>      e
  ino  <M-Right>      <C-O>e<Right>

  " ###################
  " Control-Right Arrow
  " ###################

  " These mappings:
  "   Move to end of current word.
  no   <C-Right>      e
  no!  <C-Right>      e
  ino  <C-Right>      <C-O>e<Right>

  " ################
  " Command-Up Arrow
  " ################

  no   <D-Up>         <C-Home>
  ino  <D-Up>         <C-Home>

  " ###############
  " Option-Up Arrow
  " ###############

  no   <M-Up>         {
  ino  <M-Up>         <C-o>{

  " ################
  " Control-Up Arrow
  " ################

  no   <C-Up>         {
  ino  <C-Up>         <C-o>{

  " ##################
  " Command-Down Arrow
  " ##################

  no   <D-Down>       <C-End>
  ino  <D-Down>       <C-End>

  " #################
  " Option-Down Arrow
  " #################

  no   <M-Down>       }
  ino  <M-Down>       <C-o>}

  " ##################
  " Control-Down Arrow
  " ##################

  no   <C-Down>       }
  ino  <C-Down>       <C-o>}

  " ##########################################################################
  " Backspace / Delete Mappings
  " ##########################################################################

  " ##################
  " Backspace
  " ##################

  " DeleteNormalWithoutCopyingToClipboard()
  "
  " Description:
  "   Delete in normal mode without copying text to clipboard.
  function! DeleteNormalWithoutCopyingToClipboard()
    set clipboard=
    normal x
    set clipboard=unnamed,unnamedplus
  endfunction

  " DeleteVisualWithoutCopyingToClipboard
  "
  " Description:
  "   Delete in visual model without copying to clipboard.
  function! DeleteVisualWithoutCopyingToClipboard()
    set clipboard=
    normal gvx
    set clipboard=unnamed,unnamedplus
  endfunction

  " Original (copies deleted text to clipboard)
  " nno <BS>            hx
  " vno <BS>            x
  "
  " Updated (does not copy deleted text to clipboard)
  nno <BS> h:<C-u>call DeleteNormalWithoutCopyingToClipboard()<CR>
  vno <BS> :<C-u>call DeleteVisualWithoutCopyingToClipboard()<CR>

  " ##################
  " Option-Backspace
  " ##################

  ino  <M-BS>         <C-w>

  " ##################
  " Command-Backspace
  " ##################

  ino  <D-BS>         <C-u>

  " ##########################################################################
  " Shift Movement and Selection Mappings
  " ##########################################################################

  " NOTE: selectmode and keymodel settings from original MacVim settings are
  " not used here since they enable select mode and this configuration prefers
  " visual mode for everything.

  " #########################
  " Command-Shift-Left Arrow
  " #########################

  nn   <S-D-Left>     v0
  vn   <S-D-Left>     0
  " NOTE: Use `<ESC>` for more natural selection behavior.
  " - `<ESC>`:
  "   Always select the character before the cursor.
  " - `<C-O>` (ctrl-O):
  "   Cursor is at end of line: select character before cursor.
  "   Cursor is not at end of line: select character after cursor.
  ino  <S-D-Left>     <ESC>v0

  " ###################################################
  " Option-Shift-Left Arrow / Control-Shift-Right Arrow
  " ###################################################

  " OnlyWhiteSpaceBeforeCursor()
  "
  " Returns:
  "   1   If there is only whitespace before the current cursor position.
  "   0   If there are non-whitespace characters before the current cursor
  "       position.
  function! OnlyWhiteSpaceBeforeCursor()
    return ! match(
      \ strpart(getline('.'), 0, col('.') - 1),
      \ "^[[:space:]][[:space:]]*$"
      \ )
  endfunction

  " ShiftLeftArrowMovement()
  "
  " Description:
  "   Move the cursor back.
  "
  " Returns:
  "   'b$'  When the cursor is in the first column, select just the newline
  "         on the preceeding line.
  "   'o'   When there is only whitespace before the cursor, move the cursor to
  "         the beginning of the current line.
  "   'b'   Move the cursor to the beginning of the preceeding word.
  function! ShiftLeftArrowMovement()
    if col('.') == 1
      return 'b$'
    elseif OnlyWhiteSpaceBeforeCursor()
      return '0'
    else
      return 'b'
    endif
  endfunction

  " Option-Shift-Left Arrow

  " These mappings:
  "   Enter visual mode and move the cursor left.
  nn   <expr> <S-M-Left> 'v'      . ShiftLeftArrowMovement()
  vn   <expr> <S-M-Left>            ShiftLeftArrowMovement()
  " NOTE: Use `<ESC>` for more natural selection behavior.
  " - `<ESC>`:
  "   Always select the character before the cursor.
  " - `<C-O>` (ctrl-O):
  "   Cursor is at end of line: select character before cursor.
  "   Cursor is not at end of line: select character after cursor.
  ino  <expr> <S-M-Left> '<ESC>v' . ShiftLeftArrowMovement()

  " Control-Shift-Right Arrow

  " These mappings:
  "   Enter visual mode and move the cursor left.
  nn   <expr> <S-C-Left> 'v'      . ShiftLeftArrowMovement()
  vn   <expr> <S-C-Left>            ShiftLeftArrowMovement()
  " NOTE: Use `<ESC>` for more natural selection behavior.
  " - `<ESC>`:
  "   Always select the character before the cursor.
  " - `<C-O>` (ctrl-O):
  "   Cursor is at end of line: select character before cursor.
  "   Cursor is not at end of line: select character after cursor.
  ino  <expr> <S-C-Left> '<ESC>v' . ShiftLeftArrowMovement()

  " ######################
  " Command-Shift-Up Arrow
  " ######################

  nn   <S-D-Up>       vgg
  vn   <S-D-Up>       gg
  ino  <S-D-Up>       <C-O>vgg

  " #####################
  " Option-Shift-Up Arrow
  " #####################

  no   <S-M-Up>         v{
  vm   <S-M-Up>         {
  ino  <S-M-Up>         <ESC>v{

  " ######################
  " Control-Shift-Up Arrow
  " ######################

  no   <S-C-Up>         v{
  vm   <S-C-Up>         {
  ino  <S-C-Up>         <ESC>v{

  " ########################
  " Command-Shift-Down Arrow
  " ########################

  nn   <S-D-Down>     vG
  vn   <S-D-Down>     G
  ino  <S-D-Down>     <C-O>vG

  " #######################
  " Option-Shift-Down Arrow
  " #######################

  no   <S-M-Down>       v}
  vn   <S-M-Down>       }
  ino  <S-M-Down>       <ESC>v}

  " ########################
  " Control-Shift-Down Arrow
  " ########################

  no   <S-C-Down>       v}
  vn   <S-C-Down>       }
  ino  <S-C-Down>       <ESC>v}

  " #########################
  " Command-Shift-Right Arrow
  " #########################

  " These mappings:
  "   Enter visual mode and select rest of line without newline.
  "
  " Overrides MacVim Default mappings:
  "   Enter select mode and select to end of line with newline.
  nn   <S-D-Right>    vg_
  vn   <S-D-Right>    g_
  ino  <S-D-Right>    <C-O>vg_

  " ####################################################
  " Option-Shift-Right Arrow / Control-Shift-Right Arrow
  " ####################################################

  " OnlyWhiteSpaceAfterCursor()
  "
  " Returns:
  "   1   If there is only whitespace after the current cursor position.
  "   0   If there are non-whitespace characters after the current cursor
  "       position.
  function! OnlyWhiteSpaceAfterCursor()
    let l:line = getline('.')
    let l:column = col('.')
    let l:line_length = strwidth(l:line)
    return (! match(
      \ strpart(l:line, l:column, l:line_length),
      \ "^[[:space:]]*$"
      \ )) && l:column <= l:line_length
  endfunction

  " ShiftRightArrowMovement()
  "
  " Description:
  "   Move the cursor forward.
  "
  " Returns:
  "   '$'   When there is only whitespace after the cursor, move the cursor to
  "         the end of the line.
  "   'e'   Move the cursor to the end of the next word.
  function! ShiftRightArrowMovement()
    if OnlyWhiteSpaceAfterCursor()
      return '$'
    else
      return 'e'
    endif
  endfunction

  " These mappings:
  "   Enter visual mode and move the cursor right.
  "
  " Overrides MacVim Default mappings:
  "   Enter select mode and select to beginning of next word.

  " Option-Shift-Right Arrow

  nn   <expr> <S-M-Right> 'v'       . ShiftRightArrowMovement()
  vn   <expr> <S-M-Right>             ShiftRightArrowMovement()
  ino  <expr> <S-M-Right> '<C-O>v'  . ShiftRightArrowMovement()

  " Control-Shift-Right Arrow

  nn   <expr> <S-C-Right> 'v'       . ShiftRightArrowMovement()
  vn   <expr> <S-C-Right>             ShiftRightArrowMovement()
  ino  <expr> <S-C-Right> '<C-O>v'  . ShiftRightArrowMovement()

endif " exists("custom_macvim_hig_movement")
