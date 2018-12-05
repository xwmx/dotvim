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
" -----------------------
" TODO: Perfomance Issues
"
" Startup can slow, depending on the settings. To log startup timing:
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
" Janus - vimrc (1) (begin)                          Janus - vimrc (1) (begin)
" -------------------------                          -------------------------
"
" A distribution of plug-ins and mappings for Vim, Gvim and MacVim.
"
" https://github.com/carlhuda/janus
"
" NOTES:
"
" .vim/janus is the primary directory for the Janus distribution. Currently it
" links to .vim/vendor/github.com/carlhuda/janus/janus
"
" The Janus submodule contains plugins as submodules, which need to be loaded
" and updated either manually or using the `rake` command.
"
" ~/.janus is a [pathogen](https://github.com/tpope/vim-pathogen) directory.
" -------------------------                          -------------------------
"
" Janus is a distribution of plug-ins and mappings for Vim, Gvim and MacVim.
"
" https://github.com/carlhuda/janus

" Define paths
let g:janus_path = escape(expand("~/.vim/janus/vim"), ' ')
let g:janus_vim_path = escape(expand("~/.vim/janus/vim"), ' ')
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

" -----------------------                              -----------------------
" Janus - vimrc (1) (end)                              Janus - vimrc (1) (end)
" ============================================================================

" ############################################################################
"  ____
" / ___|___  _ __ ___
"| |   / _ \| '__/ _ \
"| |__| (_) | | |  __/
" \____\___/|_|  \___|
"
" ############################################################################

" ============================================================================
" Base Vim Settings
" ============================================================================

" set nocompatible and hidden
"
" Required by plugins like vim-ctrlspace
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'compatible'
set nocompatible
" http://vimdoc.sourceforge.net/htmldoc/options.html#'hidden'
set hidden

" encoding
"
" string (default: 'latin1' or value from $LANG)
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'encoding'
set encoding=UTF-8

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

" ============================================================================
" Leader
" ============================================================================

" change the leader from backslash (\) to comma (,)
let mapleader=","

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
""""""""""""""""""""""""""""""""""""""""""""""""

" ============================================================================
" Disable Janus plugins
" ============================================================================

" Example disable call:
"
" call janus#disable_plugin('<plugin_name>')

" Candidates for disabling
"
" These are currently not being used and can be disabled without problems:
"
"call janus#disable_plugin('buffergator')
"call janus#disable_plugin('dispatch')
"call janus#disable_plugin('fugitive')
"call janus#disable_plugin('gist')
"call janus#disable_plugin('gundo')
"call janus#disable_plugin('narrowregion')
"call janus#disable_plugin('vimwiki')
"call janus#disable_plugin('vroom')

" ============================================================================
" Conditional Plugin Settings
" ============================================================================

" git commit messages.
if expand('%:t:r') == 'COMMIT_EDITMSG'
  call add(g:pathogen_disabled, 'vim-bufkill')
  call add(g:pathogen_disabled, 'vim-ctrlspace')
  set nowrap
endif

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
  " TODO: Re-enable when fonts are installed.
  packadd vim-devicons

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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
call SetupPluginVimDevicons()

" ============================================================================
" Tab Completion Plugins
"
" YouCompleteMe
" -------------
"
" A code-completion engine for Vim
"
" https://valloric.github.io/YouCompleteMe/
" https://github.com/Valloric/YouCompleteMe
"
" Supertab
" --------
"
" Perform all your vim insert mode completions with Tab.
"
" https://github.com/ervandew/supertab
"
" See also:
" https://github.com/Shougo/neocomplete.vim
" https://github.com/Shougo/deoplete.nvim
" https://github.com/ajh17/VimCompletesMe
" ============================================================================

function! SetupTabCompletionPlugins()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed version.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'supertab')
  call janus#disable_plugin('supertab')

  " Native Vim init:
  if has("gui_macvim")
    let you_complete_me_init = '
      \ _ycm_path="${HOME}/.vim/pack/plugins/opt/YouCompleteMe" &&
      \ [ -e "${_ycm_path}" ] &&
      \ [ ! -e "${_ycm_path}/third_party/ycmd/build.py" ] &&
      \ (
      \   cd "${_ycm_path}" &&
      \   git submodule update --init --recursive
      \ )'
    call system(you_complete_me_init)

    " NOTE: To install YouCompleteMe, run the following command. This must be
    " done during at least some upgrades of YouCompleteMe.
    "
    " More Information:
    " https://valloric.github.io/YouCompleteMe/#mac-os-x
    let you_complete_me_install = '
      \ _ycm_path="${HOME}/.vim/pack/plugins/opt/YouCompleteMe" &&
      \ [ -e "${_ycm_path}/third_party/ycmd/build.py" ] &&
      \ [ ! -e "${_ycm_path}/third_party/ycmd/ycm_core.so" ] &&
      \ (
      \   cd "${_ycm_path}" &&
      \   ./install.py --clang-completer
      \ )'
    call system(you_complete_me_install)

    packadd YouCompleteMe
  else
    packadd supertab
  endif

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupTabCompletionPlugins()

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

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed version.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'ack')
  call janus#disable_plugin('ack')

  " Plug init:
  " Plug 'https://github.com/mileszs/ack.vim'

  " Native Vim init:
  packadd ack.vim

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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
call SetupPluginAck()

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

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd ale

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:airline#extensions#ale#enabled = 1

  " Do not lint or fix minified files.
  let g:ale_pattern_options = {
  \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
  \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
  \}

  " Use more subtle symbols.
  "
  " NOTE: Color overrides can be found in the 'colorschemes' section of
  " after/plugin/dotvim.vim
  let g:ale_sign_warning = '›'
  let g:ale_sign_error = '›'

  " Only use highlights in MacVim.
  if ! has("gui_macvim")
    let g:ale_set_highlights = 0
  endif

  " Use ESLint for JavaScript
  "
  " https://eslint.org/
  " https://github.com/eslint/eslint/
  let g:ale_linters = {'javascript': ['eslint']}

  " Display additional linter information.
  "
  " https://github.com/w0rp/ale/blob/master/doc/ale.txt#L1085
  let g:ale_echo_msg_format = '[%linter%] %s (%severity%)%(code)%'

endfunction
call SetupPluginAle()

" ============================================================================
" ctrlp.vim
"
" Fuzzy file, buffer, mru, tag, etc finder.
"
" NOTE: Active fork is https://github.com/ctrlpvim/ctrlp.vim
" ============================================================================

function! SetupPluginCtrlp()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed vim-polyglot.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'ctrlp')
  call janus#disable_plugin('ctrlp')

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

  " Ignore version control directories.
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

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
  let g:ctrlp_regexp = 1

  " Use `rg` or `ag` if available. More information:
  " https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
  if executable('rg')
    set grepprg=rg\ --color=never\ --hidden
    let g:ctrlp_user_command =
      \ 'rg %s --files --color=never --hidden --glob "!.git/*"'
    let g:ctrlp_use_caching = 1
  elseif executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --hidden
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_caching = 0
  endif

  " CtrlP auto cache clearing.
  "
  " More information:
  " https://github.com/kien/ctrlp.vim/issues/305#issuecomment-9802791
  function! CustomClearCtrlPCache()
    if exists("g:loaded_ctrlp") && g:loaded_ctrlp
      augroup CtrlPExtension
        autocmd!
        autocmd FocusGained  * CtrlPClearCache
        autocmd BufWritePost * CtrlPClearCache
      augroup END
    endif
  endfunction
  if has("autocmd")
    autocmd VimEnter * :call CustomClearCtrlPCache()
  endif

  " Ignore local glyph directory in project since it slows down cache building.
  "
  " TODO: remove when this directory no longer exists locally.
  set wildignore+=*system/development/glyphs*

endfunction
call SetupPluginCtrlp()

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

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginDelimitMate()

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

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginDockerfileVim()

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

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginFZF()

" ============================================================================
" image.vim
"
" View images in Vim
"
" https://github.com/ashisha/image.vim
" ============================================================================

function! SetupPluginImageVim()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  if has("gui_macvim")
    " Native Vim init:
    packadd image.vim
  endif

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginImageVim()

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

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
" NOTE: Disable in favor of ALE
" call SetupPluginNeoformat()

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
" NOTE: Disable in favor of ALE
" call SetupPluginNeomake()

" ============================================================================
" NERD Commenter
"
" Comment functions so powerful—no comment necessary.
"
" https://github.com/scrooloose/nerdcommenter
" ============================================================================

function! SetupPluginNERDCommenter()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  "
  " NOTE: Disable Janus pathogen-installed nerdcommenter.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'nerdcommenter')
  call janus#disable_plugin('nerdcommenter')

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
call SetupPluginNERDCommenter()

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

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed nerdcommenter.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'nerdtree')
  call janus#disable_plugin('nerdtree')

  " Plug init:
  " Plug 'https://github.com/scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  " Native Vim init:
  packadd nerdtree

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " ---------------------------------------------------------------------------
  " Source:
  " https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/nerdtree.vim
  let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

  " Default mapping, <leader>n
  map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

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
        exe substitute(mapcheck("R"), "<CR>", "", "")
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

  " Set to use single mouse click to open node or file.
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
  endif

endfunction
call SetupPluginNERDTree()

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
" NOTE: Disable nerdtree-git-plugin due to lag / performance issues.
" call SetupPluginNERDTreeGitPlugin()

" ============================================================================
" syntastic
"
" Syntastic is a syntax checking plugin for Vim.
"
" https://github.com/vim-syntastic/syntastic
" ============================================================================

function! SetupPluginSyntastic()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Syntastic can be very slow and is not async, so experiement with
  " Neomake, ALE, and other options instead. More information:
  " https://github.com/vim-syntastic/syntastic/issues/699
  " TODO: Remove when Janus is removed.
  call add(g:pathogen_disabled, 'syntastic')
  call janus#disable_plugin('syntastic')

  " Plug init:
  " Plug 'https://github.com/vim-syntastic/syntastic'

  " Native Vim init:
  " packadd syntastic

endfunction
call SetupPluginSyntastic()

" ============================================================================
" tagbar
"
" Vim plugin that displays tags in a window, ordered by scope.
"
" https://github.com/majutsushi/tagbar
" ============================================================================

function! SetupPluginTagbar()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed tagbar.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'tagbar')
  " call janus#disable_plugin('tagbar')

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
call SetupPluginTagbar()

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
  " ---
  " Try with straight separators on tab / buffer side.
  " let g:airline_left_sep = ''
  " let g:airline_left_alt_sep = ''
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  " ---
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
    let g:airline_extensions = ['branch', 'hunks', 'whitespace']
  endif

endfunction
call SetupPluginVimAirline()

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
call SetupPluginVimBufkill()

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

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVimCtrlspace()

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

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed vim-gitgutter.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'vim-gitgutter')
  " call janus#disable_plugin('vim-gitgutter')

  " Plug init:
  " Plug 'https://github.com/airblade/vim-gitgutter'

  " Native Vim init:
  packadd vim-gitgutter

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:gitgutter_diff_base = 'HEAD'

endfunction
call SetupPluginVimGitgutter()

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

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVimGo()

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
call SetupPluginGoyoVim()

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
call SetupPluginVimJson()

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

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVimOrgmode()

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
call SetupPluginVimPandoc()


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
  " packadd vim-pandoc-syntax

  " After: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Disable conceal for code blocks and inline code, which can be disorienting
  " in documents that include a lot of code.
  let g:pandoc#syntax#conceal#blacklist = [
        \"codeblock_delim",
        \"codeblock_start",
        \"inlinecode"
        \]

endfunction
call SetupPluginVimPandocSyntax()

" ============================================================================
" vim-polyglot
"
" A collection of language packs for Vim.
"
" https://github.com/sheerun/vim-polyglot
" ============================================================================

function! SetupPluginVimPolyglot()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathodgen init:
  " NOTE: Disable Janus pathogen-installed vim-polyglot.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'vim-polyglot')
  " call janus#disable_plugin('vim-polyglot')

  " Plug init:
  " Plug 'sheerun/vim-polyglot'

  " Native Vim init:
  packadd vim-polyglot

endfunction
call SetupPluginVimPolyglot()

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
call SetupPluginVimPrettier()

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
call SetupPluginVimSensible()

" ============================================================================
" vim-signify
"
" Show a diff using Vim its sign column.
"
" https://github.com/mhinz/vim-signify
" ============================================================================

function! SetupPluginVimSignify()

  " Init: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  "Pathogen init:
  " NOTE: Disable vim-signify and use vim-gitgutter instead.
  " TODO: Remove this section when Janus is removed.
  call add(g:pathogen_disabled, 'vim-signify')
  call janus#disable_plugin('vim-signify')

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
call SetupPluginVimSignify()

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
  More information:
  "   https://github.com/tpope/vim-sleuth/issues/4
  " Disable automatic vim-sleuth detection on markdown files to avoid slowdowns.
  autocmd BufRead,BufNewFile *.md,*.markdown let b:sleuth_automatic = 0
  autocmd BufRead,BufNewFile *.js,*.jsx,*.json let b:sleuth_automatic = 0
  autocmd BufRead,BufNewFile *.yml,*.yaml let b:sleuth_automatic = 0

endfunction
" NOTE: Disable vim-sleuth to avoid slowdowns.
" call SetupPluginVimSleuth()

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
call SetupPluginVimSpeeddating()

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
call SetupPluginVimTextobjUser()

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
call SetupPluginVimTextobjUser()

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-plug (end)
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ============================================================================
" Janus - vimrc (2) (begin)                          Janus - vimrc (2) (begin)
" -------------------------                          -------------------------

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

" .vimrc.after is loaded after the plugins have loaded

" -----------------------                              -----------------------
" Janus - vimrc (2) (end)                              Janus - vimrc (2) (end)
" ============================================================================
