" ============================================================================
"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" ----------------------------------------------------------------------------
"
" vimrc
"
" Startup commands for Vim.
"
" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc
" https://github.com/amix/vimrc
"
" Load order:
"   vimrc (This file)
"   after/plugin/*
"   gvimrc
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
" ----------
" Perfomance
"
" To log startup timing:
"
" vim --startuptime vim-startup.log test.md
"
" Identified slow-loading files:
"
" - `vim-bufkill/plugin/bufkill.vim`
" - `vim-airline/autoload/airline/extensions/default.vim`
" - `/usr/local/Cellar/neovim/0.1.7/share/nvim/runtime/syntax/markdown.vim`
" - `neomake/autoload/neomake.vim`
"
" ---------
" Resources
"
" - https://github.com/mhinz/vim-galore
"   All things Vim!
" - https://github.com/amix/vimrc
"   The ultimate Vim configuration: vimrc
" - https://github.com/carlhuda/janus
" - https://spacevim.org/
"   https://github.com/SpaceVim/SpaceVim
"   A community-driven vim distribution
" - https://github.com/LER0ever/EverVim
"   A Modern, Powerful & Modular Vim Distribution
" - https://vim.spf13.com/
"   https://github.com/spf13/spf13-vim
"   spf13-vim is a distribution of vim plugins and resources for Vim, GVim and
"   MacVim.
" - https://github.com/liangxianzhe/oh-my-vim
"
" ============================================================================

" ============================================================================
" vimrc • begin                                                  begin • vimrc
" -------------                                                  -------------

" ############################################################################
"  ____
" / ___|___  _ __ ___
"| |   / _ \| '__/ _ \
"| |__| (_) | | |  __/
" \____\___/|_|  \___|
"
" ############################################################################

" ============================================================================
" Leader
" ============================================================================

" change the leader from backslash (\) to comma (,)
let mapleader=","

" ============================================================================
" Base Vim Settings
"
" Migrated from:
" janus/vim/core/before/plugin/settings.vim
" ============================================================================

" set nocompatible and hidden
"
" Required by plugins like vim-ctrlspace
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'compatible'
if has('vim_starting') && !has('nvim') && &compatible
  set nocompatible               " Be iMproved
endif

" http://vimdoc.sourceforge.net/htmldoc/options.html#'hidden'
set hidden

" encoding
"
" string (default: 'latin1' or value from $LANG)
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'encoding'
" NOTE: Neovim disallow changing 'enconding' option after initialization
" see https://github.com/neovim/neovim/pull/2929 for more details
if !has('nvim')
  set encoding=UTF-8  " Set default encoding to UTF-8
endif

" Show line numbers
set number

" Show line and column number
set ruler

" Turn on syntax highlighting allowing local overrides
syntax enable

" updatetime
"
" Set to 100ms (default 4000) to reduce the update delay experienced with
" plugins like vim-gitgutter.
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'updatetime'
" https://www.reddit.com/r/vim/comments/3ql651/
" https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100

" formatoptions
"
" r  Automatically insert the current comment leader after hitting <Enter> in
"    Insert mode
set formatoptions+=r

" clipboard
"
" Cross-platform clipboard configuration.
"
" More information: https://stackoverflow.com/a/30691754
set clipboard^=unnamed,unnamedplus

" ============================================================================
" Whitespace
"
" Copied (and edited) from: janus/vim/core/before/plugin/settings.vim
" ============================================================================

set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

" ============================================================================
" Searching
"
" Copied from: janus/vim/core/before/plugin/settings.vim
" ============================================================================

set hlsearch    " highlight matches

set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" ============================================================================
" Wild settings
"
" Copied from: janus/vim/core/before/plugin/settings.vim
" ============================================================================

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" ============================================================================
" Temporary Directories
"
" NOTE: This overrides settings from Janus:
" janus/vim/core/before/plugin/settings.vim#L79
" ============================================================================

" http://vimdoc.sourceforge.net/htmldoc/options.html#'backupdir'
set backupdir^=~/.vim/cache/backup//

" http://vimdoc.sourceforge.net/htmldoc/options.html#'directory'
set directory^=~/.vim/cache/temp//

" =============================================================================
" netrw
"
" Network oriented reading, writing, and browsing.
"
" Commands:
"   https://gist.github.com/danidiaz/37a69305e2ed3319bfff9631175c5d0f
"
" More info:
"   https://github.com/vim/vim/blob/master/runtime/doc/pi_netrw.txt
" =============================================================================

" Display preview in vertical split.
let g:netrw_preview = 1

" =============================================================================
" filetypes.vim
"
" Adapted from:
" https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/filetypes.vim
" =============================================================================

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  if !exists("g:disable_markdown_autostyle")
    au FileType markdown setlocal wrap linebreak textwidth=72 nolist
  endif

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" =============================================================================
" Optional auto-save on focus lost
"
" Adapted from:
" https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/autocmds.vim
"
" See also:
" https://stackoverflow.com/a/15252783
" =============================================================================

if has("autocmd")
  if exists("g:autosave_on_blur")
    au FocusLost * silent! wall
  endif
endif

" ############################################################################
"  ____  _             _
" |  _ \| |_   _  __ _(_)_ __  ___
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/
"
" Resources:
" - https://gist.github.com/manasthakur/ab4cf8d32a28ea38271ac0d07373bb53
" - https://shapeshed.com/vim-packages/#vim-8-brings-native-third-party-package-loading
"
" NOTE: Slow plugins:
" - TagBar
"   - Calling ctags is slow, particularly the initial calls for a buffer.
" - Syntastic
"   - Does not have an async option at this time. Consider Neomake instead.
" - NERDTree
"" ############################################################################

" s:PluginEnabled()
"
" A utility function to test whether a plugin is installed and enabled.
"
" Returns:
"   true   If matching the given name is enabled.
"   false  If not.
"
" More Information:
"   https://vi.stackexchange.com/a/10947
function! PluginEnabled(name)
  return len(
    \ filter(split(execute(':scriptname'), "\n"), 'v:val =~? "' . a:name . '"')
    \ ) != 0
endfunction

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Pathogen
"
" Manage your 'runtimepath' with ease. In practical terms, pathogen.vim makes
" it super easy to install plugins and runtime files in their own private
" directories.
"
" https://github.com/tpope/vim-pathogen
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" ============================================================================
" Disable Pathogen plugins
"
" NOTE: This section must come before `janus#disable_plugin` is called since
" it apparently uses the `g:pathogen_disabled` variable..
" ============================================================================

" To disable a plugin, add its bundle name to the following list
let g:pathogen_disabled = []

" Example disable call:
"
" call add(g:pathogen_disabled, '<plugin_name>')

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-plug (begin)
"
" A minimalist Vim plugin manager.
"
" https://github.com/junegunn/vim-plug
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/vim-plug')

" ============================================================================
" vim-devicons
"
" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more.
"
" https://github.com/ryanoasis/vim-devicons
" https://github.com/ryanoasis/vim-devicons/wiki/Extra-Configuration
"
" NOTE: Load vim-devicons first so it's available when NERDTree and other
" plugins load.
" ============================================================================

function! SetupPluginVimDevicons()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'ryanoasis/vim-devicons'

  " Native Vim init:
  packadd vim-devicons

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Disable g:NERDTreeUpdateOnCursorHold
  "
  " This setting appears to cause ALE warnings in the statusline /
  " command-line / cmdline to show and immediately disappear in some cases.
  " This is confirmed to happen when NERDTree is open and the focus goes from
  " an embedded terminal window to the window with the file that has errors.
  " This does not happen when when focus comes from a normal buffer window.
  "
  " Search for this variable in the devicons project on GitHub:
  " https://git.io/JUlFr
  let g:NERDTreeUpdateOnCursorHold = 0

  " enable folder/directory glyph flag (disabled by default with 0)
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1

  " enable open and close folder/directory glyph flags (disabled by default
  " with 0)
  let g:DevIconsEnableFoldersOpenClose = 1

  " adding to vim-airline's tabline
  let g:webdevicons_enable_airline_tabline = 1

  " ctrlp glyphs
  let g:webdevicons_enable_ctrlp = 1

  if has("gui_macvim") && has("gui_running")
    " specify OS to decide an icon for unix fileformat (not defined by default)
    let g:WebDevIconsOS = 'Darwin'

    " Reduce the amount of space after the glyph character (default ' ').
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
  endif

endfunction

" ============================================================================
" Tab Completion Plugins
"
" Conquer of Completion (CoC)
" ---------------------------
"
" Nodejs extension host for vim & neovim, load extensions like VSCode and host
" language servers.
"
"  https://github.com/neoclide/coc.nvim
"
" deoplete.nvim
" -------------
"
" Dark powered asynchronous completion framework for neovim/Vim8

" https://github.com/Shougo/deoplete.nvim
"
" Supertab
" --------
"
" Perform all your vim insert mode completions with Tab.
"
" https://github.com/ervandew/supertab
"
" VimCompletesMe
" --------------
"
" A super simple, super minimal, super light-weight tab-completion plugin for
" Vim.
"
" NOTE: original repository missing
" TODO: review
"
" https://github.com/ajh17/VimCompletesMe
"
" YouCompleteMe
" -------------
"
" A code-completion engine for Vim
"
" https://valloric.github.io/YouCompleteMe/
" https://github.com/Valloric/YouCompleteMe
"
" See Also
" --------
"
" https://github.com/Shougo/neocomplete.vim
" https://github.com/lifepillar/vim-mucomplete
" ============================================================================

function! SetupTabCompletionPlugins()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  if has("gui_macvim") && has("gui_running")
    let use_conquer_of_completon = 0

    if use_conquer_of_completon
      " ===========================
      " Conquer of Completion (CoC)
      " ===========================

      let coc_init = '
        \ _coc_path="${HOME}/.vim/pack/plugins/opt/coc.nvim"    &&
        \ [   -e "${_coc_path}/package.json"                  ] &&
        \ [ ! -e "${_coc_path}/package-lock.json"             ] &&
        \ [ ! -e "${_coc_path}/yarn.lock"                     ] &&
        \ (cd "${_coc_path}" && yarn install)'

      call system(coc_init)

      let g:coc_global_extensions = [
        \   'coc-css',
        \   'coc-html',
        \   'coc-json',
        \   'coc-pairs',
        \   'coc-highlight',
        \   'coc-rust-analyzer',
        \   'coc-solargraph',
        \   'coc-tsserver'
        \ ]

      packadd coc.nvim
    else
      " =============
      " YouCompleteMe
      " =============

      let you_complete_me_init = '
        \ _ycm_path="${HOME}/.vim/pack/plugins/opt/YouCompleteMe" &&
        \ [   -e "${_ycm_path}"                                 ] &&
        \ [ ! -e "${_ycm_path}/third_party/ycmd/build.py"       ] &&
        \ (cd "${_ycm_path}" && git submodule update --init --recursive)'

      call system(you_complete_me_init)

      " NOTE: To install YouCompleteMe, run the following command. This must be
      " done during at least some upgrades of YouCompleteMe.
      "
      " More Information:
      " https://valloric.github.io/YouCompleteMe/#mac-os-x
      let you_complete_me_install = '
        \ _ycm_path="${HOME}/.vim/pack/plugins/opt/YouCompleteMe" &&
        \ [   -e "${_ycm_path}/third_party/ycmd/build.py"       ] &&
        \ [ ! -e "${_ycm_path}/third_party/ycmd/ycm_core.so"    ] &&
        \ (
        \   cd "${_ycm_path}"                                     &&
        \   ./install.py          \
        \     --clangd-completer  \
        \     --go-completer      \
        \     --rust-completer    \
        \     --ts-completer      \
        \     --java-completer
        \ )'

      call system(you_complete_me_install)

      packadd YouCompleteMe
    endif
  else
    packadd supertab
    " packadd VimCompletesMe
  endif

  " VimCompletesMe
  " --------------
  " packadd VimCompletesMe

  " deoplete.nvim
  " --------------
  " let g:deoplete#enable_at_startup = 1
  " packadd deoplete.nvim

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Turn off YCM auto hover documentation popup.
  "
  " https://www.reddit.com/r/vim/comments/gibavq
  " https://www.reddit.com/r/vim/comments/g9v832
  " https://vimawesome.com/plugin/youcompleteme#the-gycm_auto_hover-option
  let g:ycm_auto_hover = ''

endfunction

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" ============================================================================
" ack.vim
"
" Vim plugin for the Perl module / CLI script 'ack', along with The Silver
" Searcher, `ag`, and RipGrep, `rg`.
"
" https://github.com/mileszs/ack.vim
" ============================================================================

function! SetupPluginAck()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/mileszs/ack.vim'

  " Native Vim init:
  packadd ack.vim

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Use `Ack!` to avoid opening first result (see ack.vim README).
  cnoreabbrev Ack Ack!

  if has("gui_macvim") && has("gui_running")
    " Command-Shift-F on OSX
    map <D-F> :Ack<space>
  else
    " Define <C-F> to a dummy value to see if it would set <C-f> as well.
    map <C-F> :dummy

    if maparg("<C-f>") == ":dummy"
      " <leader>f on systems where <C-f> == <C-F>
      map <leader>f :Ack<space>
    else
      " <C-F> if we can still map <C-f> to <S-Down>
      map <C-F> :Ack<space>
    endif

    map <C-f> <S-Down>
  endif

  " Use ripgrep `rg` if available.
  " http://www.wezm.net/technical/2016/09/ripgrep-with-vim/
  if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading --hidden --glob "!.git/*"'
  " Use The Silver Searcher `ag` if available.
  " https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
  elseif executable('ag')
    let g:ackprg = 'ag --vimgrep --hidden'
  endif

endfunction

" ============================================================================
" ALE (Asynchronous Lint Engine)
"
" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP)
" integration.
"
" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" 0.2.0+ and Vim 8 while you edit your text files, and acts as a Vim Language
" Server Protocol client.
"
" https://github.com/w0rp/ale
" ============================================================================

function! SetupPluginAle()

  " Before: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Only lint on save. More info:
  " https://github.com/dense-analysis/ale/issues/38#issuecomment-251504769
  let g:ale_lint_on_text_changed  = 0
  let g:ale_lint_on_enter         = 0
  let g:ale_lint_on_save          = 1

  " Turn off virtual text.
  " https://github.com/dense-analysis/ale/blob/master/doc/ale.txt#L2291
  let g:ale_virtualtext_cursor    = 0

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd ale

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:airline#extensions#ale#enabled = 1

  " Do not lint or fix minified files.
  let g:ale_pattern_options = {
  \ '\.min\.js$':   {'ale_linters': [], 'ale_fixers': []},
  \ '\.min\.css$':  {'ale_linters': [], 'ale_fixers': []},
  \}

  " Use more subtle symbols.
  "
  " NOTE: Color overrides can be found in the 'colorschemes' section of
  " after/plugin/dotvim.vim
  let g:ale_sign_warning  = '›'
  let g:ale_sign_error    = '›'

  " Only use highlights in MacVim.
  if ! has("gui_macvim")
    let g:ale_set_highlights = 0
  endif

  " Configure Linters
  "
  " golang: revive
  "
  " https://revive.run/docs
  " https://github.com/mgechev/revive
  "
  " More information:
  " https://github.com/golang/go/issues/38968
  " https://github.com/golang/lint/issues/263
  " https://github.com/golangci/golangci-lint/issues/238
  "
  " javascript: ESLint
  "
  " https://eslint.org/
  " https://github.com/eslint/eslint/
  let g:ale_linters = {
  \ 'go':         ['revive'],
  \ 'javascript': ['eslint']
  \}

  " Display additional linter information.
  "
  " https://github.com/w0rp/ale/blob/master/doc/ale.txt#L1085
  let g:ale_echo_msg_format = '[%linter%] %s (%severity%)%(code)%'

endfunction

" ============================================================================
" AsyncRun
"
" Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window
"
" https://github.com/skywind3000/asyncrun.vim
" ============================================================================

function! SetupPluginAsyncRun()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd asyncrun.vim

endfunction

" ============================================================================
" aliou/bats.vim
"
" Syntax files for Bats (Bash Automated Testing System).
"
" https://github.com/aliou/bats.vim
" ============================================================================

function! SetupPluginBatsVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd bats.vim

endfunction

" ============================================================================
" Black
"
" The uncompromising Python code formatter
"
" https://github.com/psf/black
" https://black.readthedocs.io/en/stable/
" https://black.readthedocs.io/en/stable/editor_integration.html
" ============================================================================

function! SetupPluginBlack()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd black

endfunction

" ============================================================================
" buffergator
"
" Vim plugin to list, select and switch between buffers.
"
" https://github.com/jeetsukumaran/vim-buffergator
" ============================================================================

function! SetupPluginBuffergator()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-buffergator

endfunction

" ============================================================================
" csv
"
" A Filetype plugin for csv files
"
" https://github.com/chrisbra/csv.vim
" ============================================================================

function! SetupPluginCsvVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd csv.vim

endfunction

" ============================================================================
" ctrlp.vim
"
" Fuzzy file, buffer, mru, tag, etc finder.
"
" NOTE: Active fork is https://github.com/ctrlpvim/ctrlp.vim
" ============================================================================

function! SetupPluginCtrlp()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/ctrlpvim/ctrlp.vim'

  " Native Vim init:
  packadd ctrlp

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:ctrlp_map = ''
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }

  if has("gui_macvim") && has("gui_running")
    map <D-t> :CtrlP<CR>
    imap <D-t> <ESC>:CtrlP<CR>
  endif

  " Use abbreviation for CtrlP/Command-T cache refresh
  :ca rc ClearCtrlPCache

  " Include hidden files
  let g:ctrlp_show_hidden = 1

  " Include the current file in the file list.
  let g:ctrlp_match_current_file = 1

  " Don't switch to the existing window when the file is already open.
  let g:ctrlp_switch_buffer = 0

  " Default searching order.
  "
  " Ctrl+D:
  " Toggle between full-path search and filename only search.
  " Note: in filename mode, the prompt's base is >d> instead of >>>
  "
  " Ctrl+R:
  " Toggle between the string mode and full regexp mode.
  " Note: in full regexp mode, the prompt's base is r>> instead of >>>
  "
  " https://unix.stackexchange.com/a/144571
  " let g:ctrlp_by_filename = 1
  " let g:ctrlp_regexp = 1

  " Use `rg` or `ag` if available. More information:
  " https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
  if executable('rg')
    set grepprg=rg\ --color=never\ --hidden

    let g:ctrlp_user_command =
      \ 'rg %s --files --color=never --hidden --glob "!.git/*"'

    let g:ctrlp_use_caching = 1
  elseif executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --hidden

    let g:ctrlp_user_command =
      \ 'ag %s -l --nocolor --hidden -g ""'

    let g:ctrlp_use_caching = 1
  endif

  " Ignore local glyph directory in project since it slows down cache building.
  "
  " TODO: remove when this directory no longer exists locally.
  set wildignore+=*system/development/glyphs*

  " CtrlPCacheRefresh
  "
  " Rebuild the CtrlP cache after a delay when the window is unfocused.
  " CtrlP briefly pops open during indexing. The status bar colors are set
  " to the Normal highlight group background colors in order to minimize
  " flashing when this happens.
  "
  " Configure delay:
  "
  "   let g:ctrlp_cache_refresh_timer = 10000
  "
  " TODO: Find or implement a way to refresh the cache without opening CtrlP.
  " The CtrlP ctrlp#files() function is where the indexing appears to occur:
  "
  " https://github.com/ctrlpvim/ctrlp.vim/blob/master/autoload/ctrlp.vim#L381
  "
  " ctrlp#files() appears to rely on initialization that happens during
  " s:Open():
  "
  " https://github.com/ctrlpvim/ctrlp.vim/blob/master/autoload/ctrlp.vim#L309
  "
  " Resources:
  " https://github.com/kien/ctrlp.vim/issues/305#issuecomment-9802791
  " https://vimhelp.org/eval.txt.html#timer_start%28%29
  let g:ctrlp_cache_refresh_is_focused  = 1

  if ! exists('g:ctrlp_cache_refresh_timer')
    let g:ctrlp_cache_refresh_timer = 30000
  endif

  function! CtrlPCacheRefreshFocus(...)
    let g:ctrlp_cache_refresh_is_focused = 1

    call timer_stopall()
  endfunction

  function! CtrlPCacheRefreshUnfocus(...)
    let g:ctrlp_cache_refresh_is_focused = 0

    call timer_stopall()

    call timer_start(g:ctrlp_cache_refresh_timer, function('CtrlPCacheRefreshOnBlur'))
  endfunction

  function! CtrlPCacheRefreshGetHighlightGroup(group)
     return matchstr(execute('hi ' . a:group), '\vxxx\zs(.*)')
  endfunction

  function! CtrlPCacheRefreshGetHighlightTerm(group, term)
     return matchstr(execute('hi ' . a:group), a:term.'=\zs\S*')
  endfunction

  function! CtrlPCacheRefreshOnBlur(...)
    if ! g:ctrlp_cache_refresh_is_focused
      let CtrlPlight_original   = CtrlPCacheRefreshGetHighlightGroup('CtrlPlight')
      let CtrlPdark_original    = CtrlPCacheRefreshGetHighlightGroup('CtrlPdark')
      let CtrlParrow1_original  = CtrlPCacheRefreshGetHighlightGroup('CtrlParrow1')
      let CtrlParrow2_original  = CtrlPCacheRefreshGetHighlightGroup('CtrlParrow2')
      let CtrlParrow3_original  = CtrlPCacheRefreshGetHighlightGroup('CtrlParrow3')

      let normal_ctermbg        = CtrlPCacheRefreshGetHighlightTerm('Normal', 'ctermbg')
      let normal_guibg          = CtrlPCacheRefreshGetHighlightTerm('Normal', 'guibg')

      if empty(normal_ctermbg) | let normal_ctermbg = 0 | endif

      execute printf(
        \ 'highlight CtrlPlight ctermfg=%s ctermbg=%s guifg=%s guibg=%s',
        \ normal_ctermbg, normal_ctermbg, normal_guibg, normal_guibg
        \ )
      execute printf(
        \ 'highlight CtrlPdark ctermfg=%s ctermbg=%s guifg=%s guibg=%s',
        \ normal_ctermbg, normal_ctermbg, normal_guibg, normal_guibg
        \ )
      execute printf(
        \ 'highlight CtrlParrow1 ctermfg=%s ctermbg=%s guifg=%s guibg=%s',
        \ normal_ctermbg, normal_ctermbg, normal_guibg, normal_guibg
        \ )
      execute printf(
        \ 'highlight CtrlParrow2 ctermfg=%s ctermbg=%s guifg=%s guibg=%s',
        \ normal_ctermbg, normal_ctermbg, normal_guibg, normal_guibg
        \ )
      execute printf(
        \ 'highlight CtrlParrow3 ctermfg=%s ctermbg=%s guifg=%s guibg=%s',
        \ normal_ctermbg, normal_ctermbg, normal_guibg, normal_guibg
        \ )

      let g:ctrlp_match_window = 'max:0,results:1'
      CtrlPClearCache
      CtrlP
      exec "normal \<ESC>"
      let g:ctrlp_match_window = 'max:10,results:10'

      execute printf('highlight CtrlPlight  %s', CtrlPlight_original)
      execute printf('highlight CtrlPdark   %s', CtrlPdark_original)
      execute printf('highlight CtrlParrow1 %s', CtrlParrow1_original)
      execute printf('highlight CtrlParrow2 %s', CtrlParrow2_original)
      execute printf('highlight CtrlParrow3 %s', CtrlParrow3_original)
    endif
  endfunction

  function! CtrlPCacheRefreshAutocommands()
    if exists("g:loaded_ctrlp") && g:loaded_ctrlp
      augroup CtrlPExtension
        autocmd!
        autocmd FocusGained * call CtrlPCacheRefreshFocus()
        autocmd FocusLost   * call CtrlPCacheRefreshUnfocus()
      augroup END
    endif
  endfunction

  if has("autocmd")
    autocmd VimEnter * call CtrlPCacheRefreshAutocommands()
  endif

endfunction

" ============================================================================
" ctrlfs.vim
"
" An ack/ag/pt/rg powered code search and view tool, takes advantage of Vim 8's
" power to support asynchronous searching, and lets you edit file in-place with
" Edit Mode.
"
" https://github.com/dyng/ctrlsf.vim
" ============================================================================

function! SetupPluginCtrlSF()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd ctrlsf.vim

endfunction

" ============================================================================
" delimitMate
"
" Vim plugin, provides insert mode auto-completion for quotes, parens,
" brackets, etc.
"
" https://github.com/Raimondi/delimitMate
" ============================================================================

function! SetupPluginDelimitMate()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd delimitMate

endfunction

" ============================================================================
" Denite.nvim
"
" 🐉 Dark powered asynchronous unite all interfaces for Neovim/Vim8
"
" Denite is a dark powered plugin for Neovim/Vim to unite all interfaces. It
" can replace many features or plugins with its interface. It is like a fuzzy
" finder, but is more generic.
"
" https://github.com/Shougo/denite.nvim
" ============================================================================

function! SetupPluginDeniteNVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd denite.nvim

endfunction

" ============================================================================
" Dockerfile.vim
"
" Vim syntax file for Docker's Dockerfile and snippets for snipMate.
"
" https://github.com/ekalinin/Dockerfile.vim
" ============================================================================

function! SetupPluginDockerfileVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd Dockerfile.vim

endfunction

" ============================================================================
" Emmet-vim
"
" emmet-vim is a vim plug-in which provides support for expanding abbreviations
" similar to emmet.io
"
" https://github.com/mattn/emmet-vim
" ============================================================================

function! SetupPluginEmmetVim()

  " Before: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:user_emmet_leader_key = '<C-Z>'

  " See also:
  " https://drivy.engineering/setting-up-vim-for-react/
  " let g:user_emmet_leader_key='<Tab>'
  let g:user_emmet_settings = {
    \   'javascript.jsx' : {
    \     'extends' : 'jsx',
    \   },
    \ }

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd emmet-vim

endfunction

" ============================================================================
" endwise.vim
"
" wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
"
" https://github.com/tpope/vim-endwise
" ============================================================================

function! SetupPluginEndwise()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-endwise

  if match(&runtimepath, 'coc.nvim') != -1
    " Cooperate with Conquer of Completion (CoC). More info:
    " https://github.com/tpope/vim-endwise/issues/125#issuecomment-1076678001
    inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \ :"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>\<c-r>=EndwiseDiscretionary()\<CR>"
  endif

endfunction

" ============================================================================
" fugitive.vim
"
" Git plugin for Vim
"
" https://github.com/tpope/vim-fugitive
" ============================================================================

function! SetupPluginFugitive()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-fugitive

  " After: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Mappings via:
  " https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/fugitive.vim
  nmap <leader>gb :Gblame<CR>
  nmap <leader>gs :Gstatus<CR>
  nmap <leader>gd :Gdiff<CR>
  nmap <leader>gl :Glog<CR>
  nmap <leader>gc :Gcommit<CR>
  nmap <leader>gp :Git push<CR>

endfunction

" ============================================================================
" FZF
"
" 🌸 A command-line fuzzy finder
"
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
" ============================================================================

function! SetupPluginFZF()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " FZF folder location. More Information:
  " https://github.com/junegunn/fzf#as-vim-plugin
  set rtp+=~/.fzf

" Plug init:
  " Plug 'https://github.com/junegunn/fzf.vim'

  " Native Vim init:
  packadd fzf.vim

endfunction

" ============================================================================
" copilot.vim
"
" GitHub Copilot for Neovim and Vim
"
" https://github.com/github/copilot.vim
" ============================================================================

function! SetupPluginGitHubCopilot()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

" Plug init:
  " Plug 'https://github.com/github/copilot.vim'

  " Native Vim init:
  packadd copilot.vim

endfunction

" ============================================================================
" goyo.vim
"
" Distraction-free writing in Vim.
"
" https://github.com/junegunn/goyo.vim
" ============================================================================

function! SetupPluginGoyoVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd goyo.vim

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Add :Zen command, mirroring :Goyo. Derived from:
  " https://github.com/junegunn/goyo.vim/blob/master/plugin/goyo.vim#L24
  command! -nargs=? -bar -bang Zen call goyo#execute(<bang>0, <q-args>)

  " Callbacks. More information:
  " https://github.com/junegunn/goyo.vim#callbacks
  " https://github.com/junegunn/goyo.vim/wiki/Customization
  function! s:goyo_enter()
    if has('gui_macvim')
      " Set larger font size when enabling Goyo.
      set guifont=MesloLGMDZ\ Nerd\ Font:h16
    endif
  endfunction

  function! s:goyo_leave()
    if has('gui_macvim')
      " Reset font size when exiting Goyo.
      call SetGuiFont()
    endif
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()

endfunction

" ============================================================================
" Gundo.vim
"
" Gundo.vim is Vim plugin to visualize your Vim undo tree.
"
" https://github.com/sjl/gundo.vim
" ============================================================================

function! SetupPluginGundoVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd gundo.vim

  " After: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:gundo_prefer_python3 = 1

endfunction

" ============================================================================
" html5.vim
"
" HTML5 omnicomplete and syntax.
"
" https://github.com/othree/html5.vim
" ============================================================================

function! SetupPluginHtml5Vim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd html5.vim

endfunction

" ============================================================================
" image.vim
"
" View images in Vim
"
" https://github.com/ashisha/image.vim
" ============================================================================

function! SetupPluginImageVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  if has("gui_macvim") && has("py3")
    " Native Vim init:
    packadd image.vim
  endif

endfunction

" ============================================================================
" jsonc.vim
"
" Syntax highlighting for CJSON in Vim
"
" https://github.com/neoclide/jsonc.vim
" ============================================================================

function! SetupPluginJSONCVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd jsonc.vim

endfunction

" ============================================================================
" Kwbd.vim
"
" Add a buffer close to vim that doesn't close the window
"
" https://github.com/rgarver/Kwbd.vim
" ============================================================================

function! SetupPluginKwbd()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd Kwbd.vim

endfunction

" ============================================================================
" Neoformat
"
" ✨ A (Neo)vim plugin for formatting code.
"
" https://github.com/sbdchd/neoformat.git
" ============================================================================

function! SetupPluginNeoformat()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

" Plug init:
  " Plug 'https://github.com/sbdchd/neoformat'

  " Native Vim init:
  packadd neoformat

endfunction

" ============================================================================
" Neomake
"
" Asynchronous linting and make framework for Neovim/Vim
"
" https://github.com/neomake/neomake
" ============================================================================

function! SetupPluginNeomake()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/neomake/neomake'

  " Native Vim init:
  packadd neomake

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Set Ruby file type to only use rubocop and mri
  "
  " rubylint returns undesirable warnings, so exclude from list.
  let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']

  " Run Neomake on every file write.
  autocmd! BufWritePost * Neomake

  " Better gutter symbol and highlighting.
  "
  " More information:
  "   https://github.com/neomake/neomake/blob/master/doc/neomake.txt#L305
  let g:neomake_warning_sign = {
    \   'text': '›',
    \   'texthl': 'NeomakeWarningSign',
    \ }

endfunction

" ============================================================================
" NERD Commenter
"
" Comment functions so powerful—no comment necessary.
"
" https://github.com/scrooloose/nerdcommenter
" ============================================================================

function! SetupPluginNERDCommenter()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'scrooloose/nerdcommenter'

  " Native Vim init:
  packadd nerdcommenter

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Add an extra space after the comment delimeter in all languages.
  let g:NERDSpaceDelims = 1

  " Add HTML comment delimeters as alternative for the 'php' file type.
  "
  " Use <leader>ca to swtich between alternates.
  let g:NERDCustomDelimiters = {
    \ 'php': { 'left': '//', 'leftAlt': '<!--', 'rightAlt': '-->' }
    \ }

  " Align comments with left of selection.
  let g:NERDDefaultAlign = 'left'

  " NERDCommenter Mappings
  if has("gui_macvim") && has("gui_running")
    map <D-/> <plug>NERDCommenterToggle<CR>
    imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
  else
    map <leader>/ <plug>NERDCommenterToggle<CR>
  endif

endfunction

" ============================================================================
" NERDTree
"
" The NERDTree is a file system explorer for the Vim editor. Using this plugin,
" users can visually browse complex directory hierarchies, quickly open files
" for reading or editing, and perform basic file system operations.
"
" https://github.com/scrooloose/nerdtree
"
" See Also:
" - https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9
" - https://github.com/tpope/vim-vinegar
" - https://github.com/justinmk/vim-dirvish
"   Directory viewer for Vim
" - https://github.com/Shougo/defx.nvim
"   The dark powered file explorer implementation.
" - https://github.com/Shougo/vimfiler.vim
"   Powerful file explorer implemented by Vim script (Not actively
"   developed. Replaced by defx.nvim.
" ============================================================================

function! SetupPluginNERDTree()

  " Before: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let NERDTreeHijackNetrw = 0

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  " Native Vim init:
  packadd nerdtree

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " ---------------------------------------------------------------------------
  " Derived from:
  " https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/nerdtree.vim
  let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

  " Default mapping, <leader>n
  map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

  " Refresh root node on `VimEnter` and `FocusGained`
  "
  " Alternative, simpler augroup:
  " augroup AuNERDTreeCmd
  " autocmd AuNERDTreeCmd VimEnter * NERDTreeFocus | silent execute 'normal R' | wincmd p
  " autocmd AuNERDTreeCmd FocusGained * NERDTreeFocus | silent execute 'normal R' | wincmd p
  augroup AuNERDTreeCmd
  autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
  autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

  " If the parameter is a directory, cd into it
  function s:CdIfDirectory(directory)
    let explicitDirectory = isdirectory(a:directory)
    let directory = explicitDirectory || empty(a:directory)

    if explicitDirectory
      exe "cd " . fnameescape(a:directory)
    endif

    " Allows reading from stdin
    " ex: git diff | mvim -R -
    if strlen(a:directory) == 0
      return
    endif

    if directory
      NERDTree
      wincmd p
      bd
    endif

    if explicitDirectory
      wincmd p
    endif
  endfunction

  " NERDTree utility function
  function s:UpdateNERDTree(...)
    let stay = 0

    if(exists("a:1"))
      let stay = a:1
    end

    if exists("t:NERDTreeBufName")
      let nr = bufwinnr(t:NERDTreeBufName)
      if nr != -1
        exe nr . "wincmd w"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
        if !stay
          wincmd p
        end
      endif
    endif
  endfunction
  " ---------------------------------------------------------------------------

  " Show NERDTree hidden files
  let g:NERDTreeShowHidden = 1

  " Only automatically open NERDTree in Macvim.
  "
  " The corresponding NERDTree initialization that's being disabled here can be
  " found at .vim/janus/vim/tools/janus/after/plugin/nerdtree.vim#7:9
  if !has("gui_macvim")
    augroup AuNERDTreeCmd
      autocmd!
    augroup end
  endif

  " Set to use single click for node and double click to open file.
  let g:NERDTreeMouseMode = 3

  " Configure NERDTreeIgnore
  "
  " Ignore .DS_Store
  if exists("g:NERDTreeIgnore")
    call add(g:NERDTreeIgnore, '\.DS_Store$')"
  endif

  " Disable the 'Bookmarks' label 'Press ? for help' text. More info:
  " https://github.com/scrooloose/nerdtree/blob/master/doc/NERDTree.txt#L1059
  let g:NERDTreeMinimalUI = 1

  " Map <leader>f to opening the current buffer file in NERDTree.
  map <silent> <leader>f :NERDTreeFind<CR>

  " vim-devicons Settings
  "
  " See also: SetupPluginVimDevicons()
  if exists('g:webdevicons_enable_nerdtree') &&
    \ g:webdevicons_enable_nerdtree == 1
    " Make arrows invisible.
    "
    " https://github.com/scrooloose/nerdtree/issues/904#issuecomment-433415882
    let g:NERDTreeDirArrowExpandable  = "\u00a0" " make arrows invisible
    let g:NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
    let g:NERDTreeNodeDelimiter       = "\u263a" " smiley face

    " <LeftRelease>
    "
    " DirNode
    "
    " Add <LeftRelease> override to call WebDevIconsNERDTreeMapActivateNode on
    " single click with `g:NERDTreeMouseMode = 3`.
    "
    " More information:
    " https://github.com/ryanoasis/vim-devicons/pull/246
    " https://git.io/scrooloose-nerdtree-doc-nerdtree-txt-L906
    "
    " TODO: Remove when the above pull request has been merged.
    call NERDTreeAddKeyMap({
      \ 'key': '<LeftRelease>',
      \ 'callback': 'WebDevIconsNERDTreeMapActivateNode',
      \ 'override': 1,
      \ 'scope': 'DirNode' })
    "
    " FileNode
    "
    " Single click file to open in the last-used split in the current tab when
    " MouseMode is 3.
    "
    " Overrides:
    " https://github.com/preservim/nerdtree/blob/master/autoload/nerdtree/ui_glue.vim#L11
    call NERDTreeAddKeyMap({
      \ 'key': '<LeftRelease>',
      \ 'callback': 'NERDTreeSingleClickOpenHandler',
      \ 'quickhelpText': 'open in current tab',
      \ 'override': 1,
      \ 'scope': 'FileNode' })

    " NERDTreeSingleClickOpenHandler
    "
    " Open in the last-used split in the current tab when MouseMode is 3.
    function! NERDTreeSingleClickOpenHandler(node)
        " Only perform action with NERDTreeMouseMode since otherwise double
        " click is required..
        if g:NERDTreeMouseMode ==# 3
          call a:node.open({'reuse':'', 'where': 'p', 'keepopen': 1})
        endif
    endf

    " <2-LeftMouse>
    "
    " Double click file to open in the last-used split in the current tab when
    " MouseMode is 2.
    "
    " Overrides:
    " https://github.com/preservim/nerdtree/blob/master/autoload/nerdtree/ui_glue.vim#L13
    "
    " Resources:
    " https://superuser.com/a/931083
    " https://stackoverflow.com/a/30022579
    call NERDTreeAddKeyMap({
            \ 'key': '<2-LeftMouse>',
            \ 'callback': 'NERDTreeDoubleClickOpenHandler',
            \ 'quickhelpText': 'open in current tab',
            \ 'scope': 'FileNode',
            \ 'override': 1})

    " NERDTreeDoubleClickOpenHandler
    "
    " Open file in the last-used split in the current tab.
    function! NERDTreeDoubleClickOpenHandler(node)
        call a:node.open({'reuse':'', 'stay': 1, 'where': 'p', 'keepopen': 1})
    endf

    " <CR> Also opens file in the current tab.
    "
    " https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt#L1276
    let g:NERDTreeCustomOpenArgs = {
      \  'file': {'reuse':'', 'where':'p', 'keepopen':1, 'stay':1}
      \ }
  endif

endfunction

" ============================================================================
" nerdtree-git-plugin
"
" Display git status in NERDTree
"
" https://github.com/Xuyuanp/nerdtree-git-plugin
" ============================================================================

function! SetupPluginNERDTreeGitPlugin()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  " packadd nerdtree-git-plugin
  " NOTE: `packadd` isn't working, so `source` the file directly.
  source pack/plugins/opt/nerdtree-git-plugin/nerdtree_plugin/git_status.vim

endfunction

" ============================================================================
" rails.vim
"
" rails.vim: Ruby on Rails power tools
"
" https://github.com/tpope/vim-rails
" ============================================================================

function! SetupPluginRailsVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-rails

endfunction

" ============================================================================
" rust.vim
"
" Vim configuration for Rust.
"
" https://github.com/rust-lang/rust.vim
" ============================================================================

function! SetupPluginRustVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd rust.vim

endfunction

" ============================================================================
" scss-syntax.vim
"
" Vim Syntax File for SCSS (Sassy CSS).
"
" https://github.com/cakebaker/scss-syntax.vim
" ============================================================================

function! SetupPluginScssSyntaxVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd scss-syntax.vim

endfunction

" ============================================================================
" surround.vim
"
" mappings to easily delete, change and add such surroundings in pair
"
" https://github.com/tpope/vim-surround
" ============================================================================

function! SetupPluginSurround()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-surround

endfunction

" ============================================================================
" syntastic
"
" Syntastic is a syntax checking plugin for Vim.
"
" https://github.com/vim-syntastic/syntastic
" ============================================================================

function! SetupPluginSyntastic()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/vim-syntastic/syntastic'

  " Native Vim init:
  " packadd syntastic

endfunction

" ============================================================================
" tagbar
"
" Vim plugin that displays tags in a window, ordered by scope.
"
" https://github.com/majutsushi/tagbar
" ============================================================================

function! SetupPluginTagbar()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/majutsushi/tagbar'

  " Native Vim init:
  packadd tagbar

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Toggle tagbar shortcut
  nmap <leader>ttb :TagbarToggle<CR>

  " Map <leader>m to tagbar to mirror current Atom minimap toggle mapping.
  nmap <leader>m :TagbarToggle<CR>

  " Set default tagbar width
  "
  " With a 1680 px width screen, tagbar fits better with NERDTree and two splits
  " when it's narrower.
  "
  " Default = 40
  let g:tagbar_width = 30

endfunction

" ============================================================================
" vim-airline
"
" lean & mean status/tabline for vim that's light as air
"
" https://github.com/vim-airline/vim-airline
" ============================================================================

function! SetupPluginVimAirline()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'vim-airline/vim-airline'

  " Native Vim init:
  packadd vim-airline

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " enable tabline
  let g:airline#extensions#tabline#enabled = 1

  " Disable tagbar extension.
  "
  " airline ends up running tagbar all the time causing a slowdown when
  " switching buffers and saving files even when tagbar is closed.
  "
  " More information:
  " https://github.com/majutsushi/tagbar/issues/223
  " https://github.com/vim-airline/vim-airline/blob/master/autoload/airline/extensions/tagbar.vim
  " https://github.com/majutsushi/tagbar/issues/215
  let g:airline#extensions#tagbar#enabled = 0

  " Use powerline styling
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1

  " let g:airline_left_sep = ''
  " let g:airline_left_alt_sep = ''
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'

  let g:airline#extensions#tabline#tabs_label = ''
  let g:airline#extensions#tabline#buffers_label = ''

  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

  " Use minimal set of vim-airline extensions for some files.
  "
  " vim-airline extensions can cause startup to be very slow, so only load
  " a minimal set of extensions for file types that are frequently opened
  " and closed.
  "
  " TODO: Determine which extensions have the most impace on performance
  " and disable them in more, if not all, cases.
  if expand('%:t:r') == 'COMMIT_EDITMSG' || expand('%:e') == 'md'
    " let g:airline_extensions = ['branch', 'hunks', 'whitespace']
    let g:airline_extensions = ['branch', 'whitespace']
  endif

endfunction

" ============================================================================
" vim-airline-themes
"
" A collection of themes for vim-airline
"
" https://github.com/vim-airline/vim-airline-themes
" ============================================================================

function! SetupPluginVimAirlineThemes()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-airline-themes

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction

" ============================================================================
" vim-bufkill
"
" In Vim, trying to unload, delete or wipe a buffer without closing the window
" or split? You'll like this.
"
" https://github.com/qpkorr/vim-bufkill
" ============================================================================

function! SetupPluginVimBufkill()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-bufkill

endfunction

" ============================================================================
" vim-coffee-script
"
" CoffeeScript support for vim.
"
" https://github.com/kchmck/vim-coffee-script
" ============================================================================

function! SetupPluginVimCoffeeScript()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-coffee-script

endfunction

" ============================================================================
" vim-css-color
"
" A very fast, multi-syntax context-sensitive color name highlighter.
"
" https://github.com/ap/vim-css-color
" ============================================================================

function! SetupPluginVimCssColor()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-css-color

endfunction

" ============================================================================
" vim-ctrlspace
"
" Vim Space Controller
"
" https://github.com/vim-ctrlspace/vim-ctrlspace
" ============================================================================

function! SetupPluginVimCtrlspace()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-ctrlspace

  " NOTE: The airline / tabline variable normally used for hiding terminal
  " buffers and other special buffers appears to be ignored:
  " `g:airline#extensions#tabline#ignore_bufadd_pat`
  " Terminal buffers are instead removed from the buffer list using an
  " autocmd in `~/.vim/after/plugin/terminal.vim`.

endfunction

" ============================================================================
" vim-fish-syntax
"
" Syntax and ftplugin files for fish shell scripts.
"
" https://github.com/khaveesh/vim-fish-syntax
" ============================================================================

function! SetupPluginVimFishSyntax()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/khaveesh/vim-fish-syntax'

  " Native Vim init:
  packadd vim-fish-syntax

endfunction

" ============================================================================
" vim-gitgutter
"
" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/undoes hunks.
"
" https://github.com/airblade/vim-gitgutter
" ============================================================================

function! SetupPluginVimGitgutter()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/airblade/vim-gitgutter'

  " Native Vim init:
  packadd vim-gitgutter

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:gitgutter_diff_base = 'HEAD'

endfunction

" ============================================================================
" vim-go
"
" Go development plugin for Vim.
"
" https://github.com/fatih/vim-go
" ============================================================================

function! SetupPluginVimGo()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-go

  " Use Revive via ALE instead of golint.
  "
  " More information:
  " https://github.com/golang/go/issues/38968
  " https://github.com/golang/lint/issues/263
  " https://github.com/mgechev/revive
  let g:go_metalinter_enabled = ['errcheck', 'vet']

endfunction

" ============================================================================
" vim-graphql
"
" A Vim plugin that provides GraphQL file detection, syntax highlighting, and
" indentation.
"
" https://github.com/jparise/vim-graphql
" ============================================================================

function! SetupPluginVimGraphQL()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-graphql

endfunction

" ============================================================================
" vim-haml
"
" Vim runtime files for Haml, Sass, and SCSS.
"
" https://github.com/tpope/vim-haml
" ============================================================================

function! SetupPluginVimHaml()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-haml

endfunction

" ============================================================================
" vim-hexokinase
"
" hexokinase.vim - (Neo)Vim plugin for asynchronously displaying the colours
" in the file (#rrggbb, #rgb, rgb(a)? functions, hsl(a)? functions, web
" colours, custom patterns)
"
" https://github.com/RRethy/vim-hexokinase
" ============================================================================

function! SetupPluginVimHexokinase()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let vim_hexokinase_init = '
    \ cd "${HOME}/.vim/pack/plugins/opt/vim-hexokinase" &&
    \ [ ! -f "hexokinase/main.go" ]                     &&
    \ make hexokinase || :
    \ )'

  call system(shellescape(vim_hexokinase_init))

  let g:Hexokinase_highlighters = ['backgroundfull']

  " Native Vim init:
  packadd vim-hexokinase

endfunction

" ============================================================================
" vim-javascript
"
" Vastly improved Javascript indentation and syntax support in Vim.
"
" https://github.com/pangloss/vim-javascript
" ============================================================================

function! SetupPluginVimJavaScript()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-javascript

  " https://github.com/pangloss/vim-javascript/blob/master/README.md#configuration-variables
  let g:javascript_plugin_flow = 1

endfunction

" ============================================================================
" vim-json
"
" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
"
" https://github.com/elzr/vim-json
" ============================================================================

function! SetupPluginVimJson()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/elzr/vim-json'

  " Native Vim init:
  packadd vim-json

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Disable quote concealing
  "
  " Quote concealing is a little disorienting, so disable it.
  let g:vim_json_syntax_conceal = 0

endfunction

" ============================================================================
" vim-jsx-pretty
"
" 🔦 [Vim script] JSX and TSX syntax pretty highlighting for vim.
"
" https://github.com/MaxMEllon/vim-jsx-pretty
" ============================================================================

function! SetupPluginVimJSXPretty()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-jsx-pretty

endfunction

" ============================================================================
" vim-jsx-typescript
"
" React JSX syntax highlighting for vim and Typescript.
"
" https://github.com/peitalin/vim-jsx-typescript
" ============================================================================

function! SetupPluginVimJSXTypescript()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-jsx-typescript

endfunction

" ============================================================================
" vim-markdown
"
" Syntax highlighting, matching rules and mappings for the original Markdown
" and extensions.
"
" https://github.com/plasticboy/vim-markdown
" ============================================================================

function! SetupPluginVimMarkdown()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-markdown

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:vim_markdown_folding_disabled = 1

endfunction

" ============================================================================
" vim-orgmode
"
" Text outlining and task management for Vim based on Emacs' Org-Mode
"
" https://github.com/jceb/vim-orgmode
" ============================================================================

function! SetupPluginVimOrgmode()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-orgmode

endfunction

" ============================================================================
" vim-pandoc
"
" vim-pandoc provides facilities to integrate Vim with the pandoc document
" converter and work with documents written in its markdown variant (although
" textile documents are also supported).
"
" https://github.com/vim-pandoc/vim-pandoc
" ============================================================================

function! SetupPluginVimPandoc()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/vim-pandoc/vim-pandoc'

  " Native Vim init:
  " packadd vim-pandoc

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Disable folding.
  let g:pandoc#modules#disabled = ["folding"]

endfunction

" ============================================================================
" vim-pandoc-syntax
"
" Standalone pandoc syntax module, to be used alongside vim-pandoc.
" Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax'
"
" https://github.com/vim-pandoc/vim-pandoc-syntax
" ============================================================================

function! SetupPluginVimPandocSyntax()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax'

  " Native Vim init:
  packadd vim-pandoc-syntax

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Disable conceal for code blocks and inline code, which can be disorienting
  " in documents that include a lot of code.
  let g:pandoc#syntax#conceal#blacklist = [
        \"codeblock_delim",
        \"codeblock_start",
        \"inlinecode"
        \]

endfunction

" ============================================================================
" vim-polyglot
"
" A collection of language packs for Vim.
"
" https://github.com/sheerun/vim-polyglot
" ============================================================================

function! SetupPluginVimPolyglot()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'sheerun/vim-polyglot'

  " Native Vim init:
  packadd vim-polyglot

endfunction

" ============================================================================
" vim-prettier
"
" A Vim plugin for Prettier
"
" https://github.com/prettier/vim-prettier
"
" Prettier
"
" Prettier is an opinionated code formatter.
"
" https://prettier.io/
" https://github.com/prettier/prettier
" ============================================================================

function! SetupPluginVimPrettier()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init  with post install (yarn install | npm install):
  " Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

  " Native Vim init:
  packadd vim-prettier

  " Run `npm install` if vim-prettier is enabled.
  if PluginEnabled("vim-prettier")
    let vim_prettier_init = '
          \ _vim_prettier_path="${HOME}/.vim/pack/plugins/opt/vim-prettier" &&
          \ [ -e "${_vim_prettier_path}" ] &&
          \ [ ! -e "${_vim_prettier_path}/node_modules" ] &&
          \ (cd "${_vim_prettier_path}" && npm install)
          \ '
    call system(vim_prettier_init)
  endif

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Alias :P to :PrettierAsync
  "
  " More Information:
  " https://stackoverflow.com/a/3879737
  cnoreabbrev P PrettierAsync

endfunction

" ============================================================================
" vim-pug
"
" Vim Pug (formerly Jade) template engine syntax highlighting and indention.
"
" https://github.com/digitaltoad/vim-pug
" ============================================================================

function! SetupPluginVimPug()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-pug

endfunction

" ============================================================================
" vim-ruby
"
" Vim/Ruby Configuration Files.
"
" https://github.com/vim-ruby/vim-ruby
" ============================================================================

function! SetupPluginVimRuby()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-ruby

endfunction

" ============================================================================
" vim-sensible
"
" Think of sensible.vim as one step above 'nocompatible' mode: a universal set
" of defaults that (hopefully) everyone can agree on.
"
" https://github.com/tpope/vim-sensible
" ============================================================================

function! SetupPluginVimSensible()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'tpope/vim-sensible'

  " Native Vim init:
  packadd vim-sensible

endfunction

" ============================================================================
" vim-signify
"
" Show a diff using Vim its sign column.
"
" https://github.com/mhinz/vim-signify
" ============================================================================

function! SetupPluginVimSignify()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/mhinz/vim-signify'

  " Native Vim init:
  " packadd vim-signify

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " " g:signify_vcs_list
  " "
  " " Only use signify for git
  " "
  " " This reduces the number of calls and improves performance.
  " "
  " " https://github.com/mhinz/vim-signify/blob/master/doc/signify.txt#L112
  " let g:signify_vcs_list = [ 'git' ]
  "
  " " Display all changes since last commit, even those that are staged to index.
  " "
  " " NOTE: No documentation on this. TODO: Determine status of this setting.
  " let g:signify_diffoptions = { 'git': 'HEAD' }
  "
  " " g:signify_disable_by_default
  " "
  " " Disable vim-signfiy by default.
  " "
  " " > This loads Sy, but it won't look for changes. You can toggle it anytime
  " " > via :SignifyToggle.
  " "
  " " https://github.com/mhinz/vim-signify/blob/master/doc/signify.txt#L195
  " let g:signify_disable_by_default = 1
  "
  " " Map command-R to :SignifyRefresh in MacVim
  " if has("gui_macvim")
  "   map <D-r> :SignifyRefresh<CR>
  " endif

endfunction

" ============================================================================
" vim-sleuth
"
" sleuth.vim: Heuristically set buffer options.
"
" https://github.com/tpope/vim-sleuth
" ============================================================================

function! SetupPluginVimSleuth()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'tpope/vim-sleuth'

  " Native Vim init:
  packadd vim-sleuth

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " NOTE: vim-sleuth can cause slow load times, particularly with markdown.
  " More information:
  "   https://github.com/tpope/vim-sleuth/issues/4
  " Disable automatic vim-sleuth detection on markdown files to avoid slowdowns.
  autocmd BufRead,BufNewFile *.js,*.jsx,*.json  let b:sleuth_automatic = 0
  autocmd BufRead,BufNewFile *.md,*.markdown    let b:sleuth_automatic = 0
  autocmd BufRead,BufNewFile *.yml,*.yaml       let b:sleuth_automatic = 0

endfunction

" ============================================================================
" vim-speeddating
"
" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
"
" https://github.com/tpope/vim-speeddating
" ============================================================================

function! SetupPluginVimSpeeddating()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-speeddating

endfunction

" ============================================================================
" Vim-Startify
"
" The fancy start screen for Vim.
"
" https://github.com/mhinz/vim-startify
" ============================================================================

function! SetupPluginVimStartify()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-startify

endfunction

" ============================================================================
" vim-styled-components
"
" Vim bundle for http://styled-components.com based javascript files.
"
" https://github.com/styled-components/vim-styled-components
" https://styled-components.com/
" ============================================================================

function! SetupPluginVimStyledComponents()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-styled-components

endfunction

" ============================================================================
" vim-stylus
"
" vim plugin for stylus
"
" https://github.com/iloginow/vim-stylus
" ============================================================================

function! SetupPluginVimStylus()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-stylus

endfunction

" ============================================================================
" vim-svelte
"
" Vim syntax highlighting and indentation for Svelte 3 components.
"
" https://github.com/evanleck/vim-svelte
" ============================================================================

function! SetupPluginVimSvelte()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-svelte

endfunction

" ============================================================================
" vim-textobj-line
"
"  Text objects for the current line.
"
" https://github.com/kana/vim-textobj-line
" https://www.vim.org/scripts/script.php?script_id=3886
" ============================================================================

function! SetupPluginVimTextobjUser()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-textobj-user

endfunction

" ============================================================================
" vim-textobj-user
"
" Create your own text objects.
"
" https://github.com/kana/vim-textobj-user
" ============================================================================

function! SetupPluginVimTextobjUser()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-textobj-user

endfunction

" ============================================================================
" vim-toml
"
" Vim syntax for TOML.
"
" https://github.com/cespare/vim-toml
" ============================================================================

function! SetupPluginVimToml()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-toml

endfunction

" ============================================================================
" vim-trailing-whitespace
"
" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
"
" https://github.com/bronson/vim-trailing-whitespace
" ============================================================================

function! SetupPluginVimTrailingWhitespace()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-trailing-whitespace

endfunction

" ============================================================================
" vim-visual-multi
"
" Multiple cursors plugin for vim/neovim
"
" https://github.com/mg979/vim-visual-multi
" ============================================================================

function! SetupPluginVimVisualMulti()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-visual-multi

endfunction

" ============================================================================
" vim-visual-star-search
"
" Start a * or # search from a visual block
"
" https://github.com/bronson/vim-visual-star-search
" ============================================================================

function! SetupPluginVimVisualStarSearch()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-visual-star-search

endfunction

" ============================================================================
" yats
"
" Yet Another TypeScript Syntax.
"
" The most advanced TypeScript Syntax Highlighting in Vim
"
" https://github.com/HerringtonDarkholme/yats.vim
" ============================================================================

function! SetupPluginYats()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd yats.vim

endfunction

" ············································································
" ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
" Load Plugins
" ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
" ············································································

" Conditionally load plugins.
if expand('%:t:r') == 'COMMIT_EDITMSG'
  " git commit messages.
  call SetupPluginVimAirline()
  set nowrap
else
  call SetupPluginVimDevicons()
  call SetupTabCompletionPlugins()
  call SetupPluginAck()
  call SetupPluginAle()
  " call SetupPluginAsyncRun()
  call SetupPluginBatsVim()
  " call SetupPluginBlack()
  " call SetupPluginBuffergator()
  call SetupPluginCsvVim()
  call SetupPluginCtrlp()
  " call SetupPluginCtrlSF()
  call SetupPluginDelimitMate()
  " NOTE: Don't load denite.nvim due to python version errors.
  " TODO: Configure python versions, particularly with MacVim. More information:
  " https://github.com/macvim-dev/macvim/wiki/Python-2.x-and-Python-3.x
  " call SetupPluginDeniteNVim()
  " call SetupPluginDockerfileVim()
  " call SetupPluginEmmetVim()
  call SetupPluginEndwise()
  " call SetupPluginFugitive()
  call SetupPluginFZF()
  " call SetupPluginGitHubCopilot()
  " call SetupPluginGoyoVim()
  " call SetupPluginGundoVim()
  cal SetupPluginHtml5Vim()
  " call SetupPluginImageVim()
  call SetupPluginJSONCVim()
  call SetupPluginKwbd()
  " NOTE: Disable in favor of ALE
  " call SetupPluginNeoformat()
  " NOTE: Disable in favor of ALE
  " call SetupPluginNeomake()
  call SetupPluginNERDCommenter()
  call SetupPluginNERDTree()
  " NOTE: Disable nerdtree-git-plugin due to lag / performance issues.
  " call SetupPluginNERDTreeGitPlugin()
  call SetupPluginRailsVim()
  call SetupPluginRustVim()
  call SetupPluginScssSyntaxVim()
  call SetupPluginSurround()
  " call SetupPluginSyntastic()
  " call SetupPluginTagbar()
  call SetupPluginVimAirline()
  " call SetupPluginVimAirlineThemes()
  call SetupPluginVimBufkill()
  call SetupPluginVimCoffeeScript()
  " call SetupPluginVimCssColor()
  " call SetupPluginVimCtrlspace()
  call SetupPluginVimFishSyntax()
  call SetupPluginVimGitgutter()
  call SetupPluginVimGo()
  call SetupPluginVimGraphQL()
  call SetupPluginVimHaml()
  call SetupPluginVimHexokinase()
  call SetupPluginVimJavaScript()
  call SetupPluginVimJson()
  call SetupPluginVimJSXPretty()
  " call SetupPluginVimJSXTypescript()
  call SetupPluginVimMarkdown()
  " call SetupPluginVimOrgmode()
  " call SetupPluginVimPandoc()
  " call SetupPluginVimPandocSyntax()
  " call SetupPluginVimPolyglot()
  call SetupPluginVimPrettier()
  call SetupPluginVimPug()
  call SetupPluginVimSensible()
  call SetupPluginVimSignify()
  " NOTE: Disable vim-sleuth to avoid slowdowns.
  " call SetupPluginVimSleuth()
  " call SetupPluginVimSpeeddating()
  call SetupPluginVimStylus()
  call SetupPluginVimStyledComponents()
  call SetupPluginVimSvelte()
  " call SetupPluginVimTextobjUser()
  " call SetupPluginVimTextobjUser()
  call SetupPluginVimToml()
  call SetupPluginVimTrailingWhitespace()
  " call SetupPluginVimVisualMulti()
  call SetupPluginVimVisualStarSearch()
  call SetupPluginYats()
endif

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-plug (end)
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" -----------                                                      -----------
" vimrc • end                                                      end • vimrc
" ============================================================================
