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
  " colorscheme base16-default
  " colorscheme dracula
  colorscheme seti
  " colorscheme vwilight
  " colorscheme Tomorrow-Night

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

else
  " colorscheme dracula
  " 'hybrid' is a good default to return to if necessary.
  " colorscheme hybrid
  colorscheme snazzy
endif
