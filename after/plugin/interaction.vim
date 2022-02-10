" ############################################################################
"  ___       _                      _   _
" |_ _|_ __ | |_ ___ _ __ __ _  ___| |_(_) ___  _ __
"  | || '_ \| __/ _ \ '__/ _` |/ __| __| |/ _ \| '_ \
"  | || | | | ||  __/ | | (_| | (__| |_| | (_) | | | |
" |___|_| |_|\__\___|_|  \__,_|\___|\__|_|\___/|_| |_|
" ----------------------------------------------------------------------------
"
" after/plugin/wrapping.vim
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
"
" ############################################################################

" ============================================================================
" <CR>
" ============================================================================

" Use return / enter key to select current list item in YouCompleteMe.
"
" NOTE: g:ycm_key_list_stop_completion conflicts with vim-endwise, so
" custom mappings are needed.
"
" More information:
" https://github.com/Valloric/YouCompleteMe/issues/232
" https://github.com/tpope/vim-endwise/blob/master/plugin/endwise.vim#L91
" https://github.com/Shougo/neocomplcache.vim/issues/215#issuecomment-8861759
if exists("g:loaded_youcompleteme")
  " alternative:
  " let g:ycm_key_list_select_completion    = ['<TAB>']
  " let g:ycm_key_list_previous_completion  = ['<S-TAB>']
  " let g:ycm_key_list_stop_completion      = ['<C-y>', '<CR>']

  let g:endwise_no_mappings = 1

  function! s:my_cr_function()
    return pumvisible() ? "\<C-y>" : "\<CR>\<Plug>DiscretionaryEnd"
  endfunction

  imap <expr><silent> <CR> <SID>my_cr_function()
  imap <C-X><CR> <CR><Plug>AlwaysEnd
endif

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

" mousefocus / nomousefocus
"
" Focus follows mouse. When set to `nomousefocus`, scrolling in a window
" without focus results in unexpected behavior since the
" CustomScrollWheelRight() calculations are performed in the focused
" window.
"
" http://vimdoc.sourceforge.net/htmldoc/options.html#'mousefocus'
set nomousefocus

" ============================================================================
" Navigation and Selection
" ============================================================================

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

" command-[ and command-] for buffer cycling

map <D-[> :bprevious<cr>
map <D-]> :bnext<cr>

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
"
" NOTE: This overrides a mapping from SnipMate and the `noremap` versions of
" of the map commands can not be used, as noted in:
" https://github.com/garbas/vim-snipmate/blob/master/doc/SnipMate.txt#L187
imap <S-Tab> <C-V><Tab>

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
