" ============================================================================
"         __ _
"   __ _ / _| |_ ___ _ __
"  / _` | |_| __/ _ \ '__|
" | (_| |  _| ||  __/ |
"  \__,_|_|  \__\___|_|
" ----------------------------------------------------------------------------
"
" after/plugin/zz_after.vim
"
" Startup commands for Vim, to be run after plugin initialization and all
" other files in after/plugin/.
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
"
" ---------
" Resources
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

" Set .zsh-theme files as zsh.
autocmd BufRead,BufNewFile *.zsh-theme setfiletype zsh

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
