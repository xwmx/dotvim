" ============================================================================
"            _                     _
"   ___ ___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___  ___
"  / __/ _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \/ __|
" | (_| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/\__ \
"  \___\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___||___/
" ----------------------------------------------------------------------------
"
" after/plugin/0_colorschemes.vim
"
" Load order:
"   vimrc
"   after/plugin/* (This file)
"   gvimrc
"
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
" call SetupPluginAnderson()

" ============================================================================
" dracula-theme-vim
"
" https://github.com/catppuccin/nvim
" ============================================================================

function! SetupPluginCatppuccin()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd catppuccin

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginCatppuccin()

" ============================================================================
" dracula-theme-vim
"
" Dracula for Vim.
"
" https://draculatheme.com/vim/
"
" NOTE: using fork with customizations:
" https://github.com/xwmx/dracula-theme-vim
" ============================================================================

function! SetupPluginDraculaThemeVim()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd dracula-theme-vim

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginDraculaThemeVim()

" ============================================================================
" onedark.vim
"
" A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
"
" https://github.com/joshdick/onedark.vim
" ============================================================================

function! SetupPluginOneDarkVim()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd onedark.vim

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginOneDarkVim()

" ============================================================================
" seti.vim
"
" The Seti colorscheme for vim.
"
" https://github.com/trusktr/seti.vim
" https://github.com/xwmx/seti.vim
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
" call SetupPluginECLMWombatVim()

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
" call SetupPluginVimHybrid()

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
" call SetupPluginVimMonochrome()

" ============================================================================
" onedark.vim
"
" Adaptation of one-light and one-dark colorschemes for Vim.
"
" https://github.com/rakr/vim-one
" ============================================================================

function! SetupPluginVimOne()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-one

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVimOne()

" ============================================================================
" vim-snazzy
"
" Elegant vim theme with bright colors.
"
" https://github.com/connorholyday/vim-snazzy
" ============================================================================

function! SetupPluginVimSnazzy()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-snazzy

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
call SetupPluginVimSnazzy()

" ============================================================================
" vim-vwilight
"
" https://github.com/xwmx/vim-vwilight
" https://github.com/jaywilliams/vim-vwilight
" ============================================================================

function! SetupPluginVimVwilight()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vim-vwilight

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
" call SetupPluginVimVwilight()

" ============================================================================
" vwilight-original
" ============================================================================

function! SetupPluginVwilightOriginal()

  " Initialization: ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

  " Native Vim init:
  packadd vwilight-original

  " Configuration: •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

endfunction
" call SetupPluginVwilightOriginal()

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
if has('gui_running') && has('gui_macvim') || has('gui_vimr')
  " colorscheme base16-default
  " colorscheme dracula
  colorscheme seti
  " colorscheme onedark
  " colorscheme vwilight
  " colorscheme Tomorrow-Night

  highlight Terminal guibg=#111213 ctermbg=235

  let current_scheme = get(g:, 'colors_name', 'default')

  if current_scheme == 'dracula'
    hi ColorColumn  guibg=#2e303d
    hi CursorLine   guibg=#2e303d
    " hi CursorColumn guibg=#2e303d
    hi CursorColumn guibg=#2b2b2b
    hi FoldColmun   guibg=#2e303d
    hi htmlTagName  guifg=#f1fa8c
    hi LineNr       guibg=#262626
    hi Folded       guibg=#262626
    hi Normal       guibg=#262626
    hi PmenuSel     guibg=#2e303d
    hi SignColumn   guibg=#2e303d
    hi String       guifg=#8897FC
    hi TabLineFill  guibg=#262626
    hi TabLine      guibg=#262626
    hi TabLineSel   guibg=#262626
  elseif current_scheme == 'seti'
    " Custom ALE colors.
    "
    " More information:
    " https://github.com/w0rp/ale
    " ~/.vimrc
    hi ALEWarningSign ctermfg=245 ctermbg=235  cterm=NONE guifg=#868686 guibg=#2b2b2b gui=NONE
    hi ALEErrorSign   ctermfg=245 ctermbg=235  cterm=NONE guifg=#cf6a4c guibg=#2b2b2b gui=NONE

    " Improve SpellCap undercurl (underline) color.
    "
    " ALEWarning is linked to SpellCap. (485880)
    hi SpellCap term=reverse ctermbg=9 gui=undercurl guisp=#364464

    " Flag / devicon color in NERDTree.
    "
    " Original:
    " hi def link NERDTreeFlags Number
    " Source:
    " https://github.com/scrooloose/nerdtree/blob/master/syntax/nerdtree.vim#L89
    hi def link NERDTreeFlags Directory

    " Directory & Folder name color in NERDTree.
    "
    " Original:
    " hi Directory                    ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
    hi Directory                    ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#7F7F7F   guibg=NONE      gui=NONE

    " Link color in NERDTree
    "
    " Original:
    hi PreProc                      ctermfg=197   ctermbg=NONE  cterm=NONE          guifg=#ff026a   guibg=NONE      gui=NONE

    " Set GitGutter colors
    "
    " More Information:
    " https://github.com/airblade/vim-gitgutter/commit/fd834e48eed21cc3c3ab66779a2296a16f41cbca
    " https://github.com/airblade/vim-gitgutter/commit/fd834e48eed21cc3c3ab66779a2296a16f41cbca
    hi GitGutterAdd                      ctermfg=188   ctermbg=64    cterm=bold          guifg=#009900   guibg=#2b2b2b   gui=bold
    hi GitGutterDelete                   ctermfg=88    ctermbg=NONE  cterm=NONE          guifg=#ff2222   guibg=#2b2b2b   gui=NONE
    hi GitGutterChange                   ctermfg=188   ctermbg=23    cterm=NONE          guifg=#bbbb00   guibg=#2b2b2b   gui=NONE

    " Set Seti Pmenu colors.
    " Original:
    " hi Pmenu                        ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
    " hi PmenuSel                     ctermfg=NONE  ctermbg=74    cterm=NONE          guifg=NONE      guibg=#4fa5c7   gui=NONE
    hi Pmenu                        ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=#282a2b   gui=NONE
    hi PmenuSel                     ctermfg=NONE  ctermbg=74    cterm=NONE          guifg=#5eebb8   guibg=#4c4f4f   gui=NONE
  endif " if g:colors_name == 'seti'

  " Set `:terminal` colors.
  "
  " More information:
  " https://github.com/macvim-dev/macvim/issues/626
  let g:terminal_ansi_colors = [
    \   '#262626',
    \   '#EA51B2',
    \   '#00F769',
    \   '#EBFC87',
    \   '#62D6E8',
    \   '#B45BCF',
    \   '#A1EFE4',
    \   '#E9E9F4',
    \   '#626483',
    \   '#EA51B2',
    \   '#00F769',
    \   '#EBFC87',
    \   '#62D6E8',
    \   '#B45BCF',
    \   '#A1EFE4',
    \   '#F7F7FB'
    \ ]

else
  colorscheme dracula

  " TODO: dracula customizations
  if get(g:, 'colors_name', 'default') == 'dracula'
    hi DiffAdd    ctermfg=79  ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=#5fd7af gui=bold
    hi DiffDelete ctermfg=127 ctermbg=NONE cterm=NONE guifg=#af00af guibg=NONE    gui=NONE
  endif

  " 'hybrid' is a good default to return to if necessary.
  " colorscheme hybrid

  " vim-snazzy with adjustments.
  " colorscheme snazzy
  " Match background to shell theme background.
  hi Normal guibg=#262626

  " Remove VertSplit line characters.
  set fillchars+=vert:\ 

  " Avoid color conflicts in Terminal.app
  if $TERM_PROGRAM == 'Apple_Terminal'
    hi LineNr guifg=NONE guibg=#262626
  endif

endif
