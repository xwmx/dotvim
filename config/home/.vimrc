" ============================================================================
" .vimrc
"
" Startup commands for Vim.
"
" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc
" https://github.com/amix/vimrc
"
" Load order:
"   .vimrc (This file)
"   .gvimrc
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
" Janus - .vimrc (1) (begin)                        Janus - .vimrc (1) (begin)
" --------------------------                        --------------------------
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

" ------------------------                            ------------------------
" Janus - .vimrc (1) (end)                            Janus - .vimrc (1) (end)
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
set nocompatible
set hidden
set encoding=UTF-8

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

" Disable vim-devicons
"
" TODO: Re-enable when fonts are installed.
"
" https://github.com/ryanoasis/vim-devicons
call add(g:pathogen_disabled, 'vim-devicons')

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
" Disable plugins conditionally.
" ============================================================================

" git commit messages.
if expand('%:t:r') == 'COMMIT_EDITMSG'
  call add(g:pathogen_disabled, 'vim-bufkill')
  call add(g:pathogen_disabled, 'vim-ctrlspace')
endif

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-plug (begin)
"
" A minimalist Vim plugin manager.
"
" https://github.com/junegunn/vim-plug
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/vim-plug-plugins')

" ============================================================================
" ack.vim
"
" Vim plugin for the Perl module / CLI script 'ack', along with The Silver
" Searcher, `ag`, and RipGrep, `rg`.
"
" https://github.com/mileszs/ack.vim
" ============================================================================

function! SetupPluginAck()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed version.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'ack')

  " Plug init:
  " Plug 'https://github.com/mileszs/ack.vim'

  " Native Vim init:
  packadd ack.vim

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Use ripgrep `rg` if available.
  " http://www.wezm.net/technical/2016/09/ripgrep-with-vim/
  if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
  " Use The Silver Searcher `ag` if available.
  " https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
  elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
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

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  " NOTE: Currently using Neomake.
  " packadd ale

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " highlight ALEWarning ctermbg=DarkMagenta

  let g:airline#extensions#ale#enabled = 1

  " Do not lint or fix minified files.
  let g:ale_pattern_options = {
  \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
  \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
  \}

  let g:ale_sign_warning = '•'

  highlight ALEWarningSign ctermfg=245 ctermbg=235  cterm=NONE guifg=#868686 guibg=#2b2b2b gui=NONE

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

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed vim-polyglot.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'ctrlp')

  " Plug init:
  " Plug 'https://github.com/ctrlpvim/ctrlp.vim'

  " Native Vim init:
  packadd ctrlp

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Use abbreviation for CtrlP/Command-T cache refresh
  :ca rc ClearCtrlPCache
  " Include hidden files
  let g:ctrlp_show_hidden = 1

  " Use `rg` or `ag` if available. More information:
  " https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
  if executable('rg')
    set grepprg=rg\ --color=never\ --hidden
    let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --glob ""'
    let g:ctrlp_use_caching = 0
  elseif executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --hidden
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_caching = 0
  endif

  " CtrlP auto cache clearing.
  "
  " More information:
  " https://github.com/kien/ctrlp.vim/issues/305#issuecomment-9802791
  " function! ClearCtrlPCacheOnFileSave()
  "   if exists("g:loaded_ctrlp") && g:loaded_ctrlp
  "     augroup CtrlPExtension
  "       autocmd!
  "       autocmd FocusGained  * CtrlPClearCache
  "       autocmd BufWritePost * CtrlPClearCache
  "     augroup END
  "   endif
  " endfunction
  " if has("autocmd")
  "   autocmd VimEnter * :call ClearCtrlPCacheOnFileSave()
  " endif

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

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd delimitMate

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginDelimitMate()

" ============================================================================
" FZF
"
" 🌸 A command-line fuzzy finder
"
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
" ============================================================================

function! SetupPluginFZF()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " FZF folder location. More Information:
  " https://github.com/junegunn/fzf#as-vim-plugin
  set rtp+=~/.fzf

" Plug init:
  " Plug 'https://github.com/junegunn/fzf.vim'

  " Native Vim init:
  packadd fzf.vim

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginFZF()

" ============================================================================
" Neomake
"
" Asynchronous linting and make framework for Neovim/Vim
" ============================================================================

function! SetupPluginNeomake()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/neomake/neomake'

  " Native Vim init:
  packadd neomake

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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
call SetupPluginNeomake()

" ============================================================================
" NERD Commenter
"
" Comment functions so powerful—no comment necessary.
"
" https://github.com/scrooloose/nerdcommenter
" ============================================================================

function! SetupPluginNERDCommenter()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  "
  " NOTE: Disable Janus pathogen-installed nerdcommenter.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'nerdcommenter')

  " Plug init:
  " Plug 'scrooloose/nerdcommenter'

  " Native Vim init:
  packadd nerdcommenter

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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

endfunction
call SetupPluginNERDCommenter()

" ============================================================================
" NERDTree
"
" The NERDTree is a file system explorer for the Vim editor. Using this plugin,
" users can visually browse complex directory hierarchies, quickly open files
" for reading or editing, and perform basic file system operations.
" ============================================================================

function! SetupPluginNERDTree()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed nerdcommenter.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'nerdtree')

  " Plug init:
  " Plug 'https://github.com/scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  " Native Vim init:
  packadd nerdtree

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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

endfunction
call SetupPluginNERDTree()

" ============================================================================
" syntastic
"
" Syntastic is a syntax checking plugin for Vim.
" ============================================================================

function! SetupPluginSyntastic()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Syntastic can be very slow and is not async, so experiement with
  " Neomake, ALE, and other options instead. More information:
  " https://github.com/vim-syntastic/syntastic/issues/699
  " TODO: Remove when Janus is removed.
  call add(g:pathogen_disabled, 'syntastic')

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
" ============================================================================

function! SetupPluginTagbar()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed tagbar.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'tagbar')

  " Plug init:
  " Plug 'https://github.com/majutsushi/tagbar'

  " Native Vim init:
  packadd tagbar

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'vim-airline/vim-airline'

  " Native Vim init:
  packadd vim-airline

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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
" vim-gitgutter
"
" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/undoes hunks.
" ============================================================================

function! SetupPluginVimGitgutter()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathogen init:
  " NOTE: Disable Janus pathogen-installed vim-gitgutter.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'vim-gitgutter')

  " Plug init:
  " Plug 'https://github.com/airblade/vim-gitgutter'

  " Native Vim init:
  packadd vim-gitgutter

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  let g:gitgutter_diff_base = 'HEAD'

endfunction
call SetupPluginVimGitgutter()

" ============================================================================
" vim-json
"
" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
" ============================================================================

function! SetupPluginVimJson()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/elzr/vim-json'

  " Native Vim init:
  packadd vim-json

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Disable quote concealing
  "
  " Quote concealing is a little disorienting, so disable it.
  let g:vim_json_syntax_conceal = 0

endfunction
call SetupPluginVimJson()

" ============================================================================
" vim-pandoc
"
" vim-pandoc provides facilities to integrate Vim with the pandoc document
" converter and work with documents written in its markdown variant (although
" textile documents are also supported).
" ============================================================================

function! SetupPluginVimPandoc()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/vim-pandoc/vim-pandoc'

  " Native Vim init:
  " packadd vim-pandoc

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Disable folding.
  let g:pandoc#modules#disabled = ["folding"]

endfunction
call SetupPluginVimPandoc()


" ============================================================================
" vim-pandoc-syntax
"
" Standalone pandoc syntax module, to be used alongside vim-pandoc.
" Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax'
" ============================================================================

function! SetupPluginVimPandocSyntax()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax'

  " Native Vim init:
  " packadd vim-pandoc-syntax

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Pathodgen init:
  " NOTE: Disable Janus pathogen-installed vim-polyglot.
  " TODO: Remove this call when Janus has been removed.
  call add(g:pathogen_disabled, 'vim-polyglot')

  " Plug init:
  " Plug 'sheerun/vim-polyglot'

  " Native Vim init:
  packadd vim-polyglot

endfunction
call SetupPluginVimPolyglot()

" ============================================================================
" vim-sensible
"
" Think of sensible.vim as one step above 'nocompatible' mode: a universal set
" of defaults that (hopefully) everyone can agree on.
" ============================================================================

function! SetupPluginVimSensible()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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
" ============================================================================

function! SetupPluginVimSignify()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  "Pathogen init:
  " NOTE: Disable vim-signify and use vim-gitgutter instead.
  " TODO: Remove this section when Janus is removed.
  call add(g:pathogen_disabled, 'vim-signify')

  " Plug init:
  " Plug 'https://github.com/mhinz/vim-signify'

  " Native Vim init:
  " packadd vim-signify

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

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
" sleuth.vim: Heuristically set buffer options
" ============================================================================

function! SetupPluginVimSleuth()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Plug init:
  " Plug 'tpope/vim-sleuth'

  " Native Vim init:
  packadd vim-sleuth

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " NOTE: vim-sleuth can cause slow load times, particularly with markdown.
  " More information:
  "   https://github.com/tpope/vim-sleuth/issues/4
  " Disable automatic vim-sleuth detection on markdown files to avoid slowdowns.
  autocmd BufRead,BufNewFile *.md,*.markdown let b:sleuth_automatic = 0

endfunction
call SetupPluginVimSleuth()

" ============================================================================
"  _____ _
" |_   _| |__   ___ _ __ ___   ___  ___
"   | | | '_ \ / _ \ '_ ` _ \ / _ \/ __|
"   | | | | | |  __/ | | | | |  __/\__ \
"   |_| |_| |_|\___|_| |_| |_|\___||___/
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

  " Plug inif:
  " Plug 'tlhr/anderson.vim'

  " Native Vim init:
  " packadd anderson

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginAnderson()

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-plug (end)
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ============================================================================
" Janus - .vimrc (2) (begin)                        Janus - .vimrc (2) (begin)
" ----------------------                            --------------------------

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

" ------------------------                            ------------------------
" Janus - .vimrc (2) (end)                            Janus - .vimrc (2) (end)
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
" colorschemes
"
" Leaving favorites commented out for easy switching
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
else
  colorscheme dracula
  " 'hybrid' is a good default to return to if necessary.
  " colorscheme hybrid
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

