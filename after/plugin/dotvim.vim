" ============================================================================
"      _       _         _                 _
"   __| | ___ | |___   _(_)_ __ ___ __   _(_)_ __ ___
"  / _` |/ _ \| __\ \ / / | '_ ` _ \\ \ / / | '_ ` _ \
" | (_| | (_) | |_ \ V /| | | | | | |\ V /| | | | | | |
"  \__,_|\___/ \__| \_/ |_|_| |_| |_(_)_/ |_|_| |_| |_|
"
" ----------------------------------------------------------------------------
"
" after/plugin/dotvim.vim
"
" Startup commands for Vim, to be run after plugin initialization.
"
" http://learnvimscriptthehardway.stevelosh.com/chapters/42.html#vimafter
" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc
" https://github.com/amix/vimrc
"
" ---------
" About Vim
"
" Vim is a highly configurable text editor for efficiently creating and
" changing any kind of text. It is included as `vi` with most UNIX systems and
" with Apple OS X.
"
" https://www.vim.org/
"
" -----------
" About Janus
"
" Janus is a distribution of plug-ins and mappings for Vim, Gvim and MacVim.
"
" https://github.com/carlhuda/janus
" ============================================================================

" ============================================================================
"            _                _
"   ___ ___ | | ___  _ __ ___| |__   ___ _ __ ___   ___  ___
"  / __/ _ \| |/ _ \| '__/ __| '_ \ / _ \ '_ ` _ \ / _ \/ __|
" | (_| (_) | | (_) | |  \__ \ | | |  __/ | | | | |  __/\__ \
"  \___\___/|_|\___/|_|  |___/_| |_|\___|_| |_| |_|\___||___/
" ============================================================================

" ============================================================================
" anderson.vim
"
" Dark vim colorscheme based on colors from Wes Anderson films.
"
" https://github.com/tlhr/anderson.vim
" ============================================================================

function! SetupPluginAnderson()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  " packadd anderson

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginAnderson()

" ============================================================================
" dracula-theme-vim
"
" Dracula for Vim.
"
" https://draculatheme.com/vim/
"
" NOTE: using fork with customizations:
" https://github.com/alphabetum/dracula-theme-vim
" ============================================================================

function! SetupPluginDraculaThemeVim()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd dracula-theme-vim

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginDraculaThemeVim()

" ============================================================================
" seti.vim
"
" The Seti colorscheme for vim.
"
" https://github.com/trusktr/seti.vim
" https://github.com/alphabetum/seti.vim
" ============================================================================

function! SetupPluginSetiVim()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd seti.vim

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginSetiVim()

" ============================================================================
" eclm_wombat.vim
"
" Colour scheme based on ECLM and wombat schemes
"
" https://github.com/vim-scripts/eclm_wombat.vim
" https://www.vim.org/scripts/script.php?script_id=2490
" ============================================================================

function! SetupPluginECLMWombatVim()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd eclm_wombat.vim

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginECLMWombatVim()

" ============================================================================
" vim-eclipse3remix
" ============================================================================

function! SetupPluginVimEclipse3Remix()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-eclipse3remix

endfunction
call SetupPluginVimEclipse3Remix()

" ============================================================================
" vim-hybrid
"
" A dark colour scheme for Vim.
"
" https://github.com/w0ng/vim-hybrid
" ============================================================================

function! SetupPluginVimHybrid()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  " packadd vim-hybrid

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVimHybrid()

" ============================================================================
" vim-monochrome
"
" A dark Vim color scheme for your focused hacking sessions.
"
" https://github.com/fxn/vim-monochrome
" ============================================================================

function! SetupPluginVimMonochrome()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-monochrome

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVimMonochrome()

" ============================================================================
" vim-vwilight
"
" https://github.com/alphabetum/vim-vwilight
" https://github.com/jaywilliams/vim-vwilight
" ============================================================================

function! SetupPluginVimVwilight()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-vwilight

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVimVwilight()

" ============================================================================
" vwilight-original
" ============================================================================

function! SetupPluginVwilightOriginal()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vwilight-original

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVwilightOriginal()

" ============================================================================
" Set Colorscheme
" ============================================================================

"colorscheme base16-chalk
"colorscheme base16-default
"colorscheme base16-flat
"colorscheme base16-google
"colorscheme base16-grayscale
"colorscheme base16-greenscreen
"colorscheme base16-ocean
"colorscheme base16-solarized
"colorscheme tomorrow
"colorscheme eclips3remix
"colorscheme eclm_wombat
"colorscheme darkburn
"colorscheme deepblue
"colorscheme hybrid
"colorscheme seti
"colorscheme vwilight
"colorscheme Tomorrow-Night-Blue
"colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night

set background=dark
if has("gui_macvim")
  "colorscheme base16-default
  " colorscheme dracula
  "colorscheme seti
  colorscheme vwilight
  " colorscheme Tomorrow-Night

  " Custom ALE colors.
  "
  " More information:
  " https://github.com/w0rp/ale
  " ~/.vimrc
  highlight ALEWarningSign ctermfg=245 ctermbg=235  cterm=NONE guifg=#868686 guibg=#2b2b2b gui=NONE
  highlight ALEErrorSign   ctermfg=245 ctermbg=235  cterm=NONE guifg=#cf6a4c guibg=#2b2b2b gui=NONE
else
  colorscheme dracula
  " 'hybrid' is a good default to return to if necessary.
  " colorscheme hybrid
endif

" ############################################################################
"  ____  _           _
" |  _ \(_)___ _ __ | | __ _ _   _
" | | | | / __| '_ \| |/ _` | | | |
" | |_| | \__ \ |_) | | (_| | |_| |
" |____/|_|___/ .__/|_|\__,_|\__, |
"             |_|            |___/
"
" ############################################################################

" ============================================================================
" ColorColumn
" ============================================================================

" Highlight the 81st column, to limit line length to 80 columns.
"
" More Information:
"   http://programmers.stackexchange.com/a/148729
"   http://www.emacswiki.org/emacs/EightyColumnRule
"
if has("gui_macvim")
  " Experimental ColorColumn that tweaks the non-GUI version to make the
  " foreground less glaring (to avoid too much noise from newlines) and make
  " the background match the NonText background.
  "
  " last: hi ColorColumn guifg=#bbbbbb guibg=#1a1a1a gui=NONE
  hi ColorColumn guifg=NONE guibg=#1c1d1e gui=bold
else
  hi ColorColumn guifg=#f8f8f8 guibg=#161616 gui=NONE
endif

if exists('+colorcolumn')
  " In Vim >= 7.3, also highlight columns 120+
  "
  " (120-320 because you have to provide an upper bound and 320 just
  "  covers a 1080p GVim window in Ubuntu Mono 11 font.)
  let &colorcolumn="81,".join(range(120,320),",")
else
  " fallback for Vim < v7.3
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" ============================================================================
" Cursor
" ============================================================================

" FlashCursorLineAndColumn()
"
" Double flash the cursor line and column in yellow.
"
" Original CursorLine color settings:
"   https://github.com/alphabetum/seti.vim/blob/master/colors/seti.vim#L15
"
" Additional Information:
"   https://vi.stackexchange.com/a/3481
function! FlashCursorLineAndColumn()
  set cursorcolumn
  hi CursorLine   ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow   gui=bold
  hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow   gui=bold
  redraw
  sleep 100m
  hi CursorLine   ctermfg=NONE  ctermbg=235  cterm=NONE  guifg=NONE  guibg=#282a2b  gui=NONE
  hi CursorColumn ctermfg=NONE  ctermbg=235  cterm=NONE  guifg=NONE  guibg=#282a2b  gui=NONE
  redraw
  sleep 100m
  hi CursorLine   ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow   gui=bold
  hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow   gui=bold
  redraw
  sleep 100m
  hi CursorLine   ctermfg=NONE  ctermbg=235  cterm=NONE  guifg=NONE  guibg=#282a2b  gui=NONE
  hi CursorColumn ctermfg=NONE  ctermbg=235  cterm=NONE  guifg=NONE  guibg=#282a2b  gui=NONE
  set nocursorcolumn
endfunction

" `map ;` to `FlashCursorLine()`
map ; :call FlashCursorLineAndColumn()<CR>

" Cursor Line Highlighting
set cursorline

" Cursor Blink Rate
set guicursor=n:blinkwait1400-blinkon800-blinkoff500
set guicursor=v:blinkwait1400-blinkon800-blinkoff500

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
" GUI options
" ============================================================================

" disable right scrollbar
set guioptions-=r
" disable left scrollbar
set guioptions-=L
" Only scroll to the end of the current line.
" set guioptions+=h

" ============================================================================
" showcmd
" ============================================================================

" Show (partial) command in the last line of the screen.  Set this
" option off if your terminal is slow.
" In Visual mode the size of the selected area is shown:
" - When selecting characters within a line, the number of characters.
"   If the number of bytes is different it is also displayed: '2-6'
"  means two characters and six bytes.
" - When selecting more than one line, the number of lines.
" - When selecting a block, the size in screen characters:
"   {lines}x{columns}.
"
" This option is also notably useful for displaying the timeout for the leader
" key.
set showcmd

" ============================================================================
" Wrap
"
" Toggle wrapping. Similar to `:set wrap!`
" ============================================================================

fun! ToggleWrap()
  if &wrap == 0
    if (&ft == '' || &ft == 'txt' || &ft == 'md' || &ft == 'markdown')
      set wrap linebreak
      echo 'Line wrapping on. (set wrap linebreak)'
    else
      set wrap nolinebreak
      echo 'Line wrapping on. (set wrap nolinebreak)'
    endif
  else
    set nowrap
    echo 'Line wrapping off. (set nowrap)'
  endif
endfun

command! -nargs=0 Wrap call ToggleWrap()
command! -nargs=0 WrapToggle call ToggleWrap()
command! -nargs=0 ToggleWrap call ToggleWrap()

" NOTE: This mapping overwrites a mapping from Vimwiki:
" https://github.com/vimwiki/vimwiki
nmap <leader>w :Wrap<CR>

" ############################################################################
"  _____ _ _        _____
" |  ___(_) | ___  |_   _|   _ _ __   ___  ___
" | |_  | | |/ _ \   | || | | | '_ \ / _ \/ __|
" |  _| | | |  __/   | || |_| | |_) |  __/\__ \
" |_|   |_|_|\___|   |_| \__, | .__/ \___||___/
"                        |___/|_|
"
" ############################################################################

" ============================================================================
" FileType settings
" ============================================================================

 " Turn off balloons in ruby.  See:
 "   http://stackoverflow.com/a/1111363
 "   http://vimdoc.sourceforge.net/htmldoc/debugger.html#balloon-eval
if has("gui_running")
  autocmd FileType ruby,eruby set noballooneval
endif

" Ensure indent is on
filetype plugin indent on

" Associate the .es6 file extension with JavaScript
"
" The `.es6` is used by 6to5 (and, by extension, Sprockets) which turns ES6+
" code into ES5.
"
" https://6to5.org/
" https://github.com/josh/sprockets-es6
"
" Setting via:
"   http://robots.thoughtbot.com/replace-coffeescript-with-es6
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" Associate Baskfile with bash
"
" Files with this name are expected to be bash files without a shebang since
" they are sourced and run from `bask`.
autocmd BufRead,BufNewFile Baskfile let b:is_bash=1
autocmd BufRead,BufNewFile Baskfile set filetype=sh
" Why `dist#ft#`? More info:
" https://www.mail-archive.com/cygwin@cygwin.com/msg155510.html
autocmd BufRead,BufNewFile Baskfile call dist#ft#SetFileTypeSH("bash")

" Associate the .spacemacs dotfile with lisp
"
" Spacemacs is an Emacs advanced Kit focused on Evil, and .spacemacs is a
" configuration file for it.
"
" https://github.com/syl20bnr/spacemacs
autocmd BufRead,BufNewFile .spacemacs setfiletype lisp

" Associate the .sshconfig file extension with the sshconfig file type.
"
" In the current dotfile configuration, .sshconfig files (not an official
" extenssion and only used in this dotfile configuration for convenience) can
" be added to the .ssh/config.d directory and subsequently compiled into one
" larger ssh configuration file.
autocmd BufRead,BufNewFile *.sshconfig set filetype=sshconfig

" Associate .cson files with CoffeeScript.
autocmd BufRead,BufNewFile *.cson set filetype=coffee

" Always use 2-space tabstop with php.
autocmd Filetype php setlocal ts=2

" ============================================================================
" SH / shell default syntax config
" ============================================================================

" g:is_posix
"
" Setting this variable prevents errors from being displayed in sh shell
" scripts. For example, without this setting, $() command substitution is
" displayed as an error, typically with a red background (specified by either
" the Error or ErrorMsg highlight group), because pre-POSIX
" shells only supported the backtick syntax (`..`) which is now discouraged.
" (see: https://github.com/koalaman/shellcheck/wiki/SC2006). With this
" setting, however, the default is set to KornShell (ksh), which is
" POSIX-compliant and supports the $() syntax.
"
" More information:
"
" https://github.com/b4winckler/vim/blob/master/runtime/doc/syntax.txt#L2802
" http://stackoverflow.com/a/5423808
let g:is_posix = 1

" ############################################################################
"  ___       _                      _   _
" |_ _|_ __ | |_ ___ _ __ __ _  ___| |_(_) ___  _ __
"  | || '_ \| __/ _ \ '__/ _` |/ __| __| |/ _ \| '_ \
"  | || | | | ||  __/ | | (_| | (__| |_| | (_) | | | |
" |___|_| |_|\__\___|_|  \__,_|\___|\__|_|\___/|_| |_|
"
" ############################################################################

" ============================================================================
" ESC / Ctrl-C / Ctrl-[
" ============================================================================

" Make C-c trigger the InsertLeave autocommand and otherwise behave
" identically to C-[ and Esc
"
" http://stackoverflow.com/a/80761
" http://vimdoc.sourceforge.net/htmldoc/insert.html#i_CTRL-C
inoremap <C-c> <Esc><Esc>

" ============================================================================
" Fullscreen
" ============================================================================

" Cmd-Enter: Toggle Fullscreen
nmap <d-cr> :set invfu<cr>
vmap <d-cr> <Esc>:set invfu<cr>gv

" ============================================================================
" Mouse
" ============================================================================

" Enable mouse in terminal vim
set mouse=a

" ============================================================================
" Navigation and Selection
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

  " If the above custom setting disabled, fall back to the MacVim
  " defaults.
  if !exists("custom_macvim_hig_movement")
    " Reenable MacVim system default mappings
    unlet macvim_skip_cmd_opt_movement
    let macvim_hig_shift_movement = 1
  endif
endif

" Fix arrow keys in normal and visual modes in terminal vim.
"
" More information:
" http://vim.wikia.com/wiki/Fix_arrow_keys_that_display_A_B_C_D_on_remote_shell
nmap <ESC>oA <ESC>ki
nmap <ESC>oB <ESC>ji
nmap <ESC>oC <ESC>li
nmap <ESC>oD <ESC>hi

vmap <ESC>oA <ESC>ki
vmap <ESC>oB <ESC>ji
vmap <ESC>oC <ESC>li
vmap <ESC>oD <ESC>hi

" ============================================================================
" Run Current File
" ============================================================================

" When in MacVim, use control-R to save and run the current file.
if has("gui_macvim")
  map <C-r> :w<CR>:!./%<CR>
endif

" ============================================================================
" Search
" ============================================================================

" Remap control-esc in normal mode to clear search highlights.
nnoremap <C-esc> :noh<return><esc>

" ============================================================================
" sidescroll
" ============================================================================

" Scroll horizontally one character at a time.
"
" More information:
" http://ddrscott.github.io/blog/2016/sidescroll/
set sidescroll=1

" ============================================================================
" Splits, Tabs, and Buffers
" ============================================================================

" Extra split navigation shortcuts
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" More natural split behavior by placing cursor in the bottom or right split
set splitbelow
set splitright

" Buffer cycling mapping
"
" Use ctrl-tab to close the current buffer without closing the split / window
"map <C-Tab> :Kwbd<cr>
map <C-Tab> :BD<cr>

" Use ctrl-[[ and ctrl-]] to cycle buffers
"
" NOTE: because C-[ is the same as escape, this mapping also results in
" <Esc><Esc> inheriting the same behavior. This is also why a single C-[
" doesn't work properly, since it maps a single Esc to buffer cycling, which
" is less desirable.
map <C-[><C-[> :bprevious<cr>
map <C-]><C-]> :bnext<cr>

" alt / option key buffer management mappings.
"
" Specify alt / option key combinations by setting to the character generated
" by the key combination.
if exists(':CtrlSpaceGoUp')
  " vim-ctrlspace mappings.
  "
  " If vim-ctrlspace is installed, the buffer list is in alpha ordering, so
  " :bprevious and :bnext jump all over rather than cycle in the displayed
  " order. Use use vim-ctrlspace commands for better cycling.
  "
  " alt-[
  nnoremap “ :CtrlSpaceGoUp<cr>
  vnoremap “ :CtrlSpaceGoUp<cr>
  " alt-shift-[
  nnoremap ” :CtrlSpaceGoUp<cr>
  vnoremap ” :CtrlSpaceGoUp<cr>
  " alt-]
  nnoremap ‘ :CtrlSpaceGoDown<cr>
  vnoremap ‘ :CtrlSpaceGoDown<cr>
  " alt-shift-]
  nnoremap ’ :CtrlSpaceGoDown<cr>
  vnoremap ’ :CtrlSpaceGoDown<cr>
else
  " alt-[
  nnoremap “ :bprevious<cr>
  vnoremap “ :bprevious<cr>
  " alt-shift-[
  nnoremap ” :bprevious<cr>
  vnoremap ” :bprevious<cr>
  " alt-]
  nnoremap ‘ :bnext<cr>
  vnoremap ‘ :bnext<cr>
  " alt-shift-]
  nnoremap ’ :bnext<cr>
  vnoremap ’ :bnext<cr>
endif
" alt-W
nnoremap ∑ :BD<cr>
vnoremap ∑ :BD<cr>
" alt-shift-W
nnoremap „ :BD<cr>
vnoremap „ :BD<cr>
" alt-n and alt-shift-n
"
" NOTE: Mapping to the character created with alt-shift-N appears to also work
" for alt-N.
nnoremap ˜ :enew<cr>
vnoremap ˜ :enew<cr>

" ============================================================================
" Tab Character
" ============================================================================

" Use shift-tab to enter a tab character.
"
" More information:
" http://stackoverflow.com/a/4781099
inoremap <S-Tab> <C-V><Tab>

" ============================================================================
" virtualedit
"
" Virtual editing means that the cursor can be positioned where there is
" no actual character.
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'virtualedit'
" ============================================================================

" A comma separated list of these words:
"   block    Allow virtual editing in Visual block mode.
"   insert   Allow virtual editing in Insert mode.
"   all      Allow virtual editing in all modes.
"   onemore  Allow the cursor to move just past the end of the line
set virtualedit=block

" ############################################################################
"  ____            _
" / ___| _   _ ___| |_ ___ _ __ ___
" \___ \| | | / __| __/ _ \ '_ ` _ \
"  ___) | |_| \__ \ ||  __/ | | | | |
" |____/ \__, |___/\__\___|_| |_| |_|
"        |___/
"
" ############################################################################

" ============================================================================
" Profiler and debugging.
" ============================================================================

" Mappings for running profile
"
" source: https://github.com/bling/minivimrc/
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

