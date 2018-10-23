" Vim color file
" eclips3remix v0.1
 
" eclips3remix -
"     vim version of the eclips3media textmate theme


" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
      syntax reset
    endif
endif

let g:colors_name="eclips3remix"


hi Normal           guifg=#dfdad3   guibg=#101010
hi Cursor           guifg=#6aa09a   guibg=#104550
hi CursorLine       guibg=#2D2D2D
hi Directory        guifg=#bbd0df
hi ErrorMsg            cterm=bold ctermfg=7 ctermbg=1
hi VertSplit        guifg=grey50    guibg=#c2bfa5   gui=none
hi Folded           guifg=#BBDDCC   guibg=#4a4f4d
hi FoldColumn       guifg=#00CCFF   guibg=#3a4a5a
hi IncSearch        guifg=#50606d   guibg=#cddaf0
hi LineNr           guifg=#d0c5c0   guibg=#153040
hi ModeMsg          guifg=#00AACC
hi MoreMsg          guifg=SeaGreen
hi NonText          guifg=#382920
hi Question         guifg=#AABBCC
hi Search           guifg=#bac5d0   guibg=#5a6d7d
" this second search was in the original
" hi Search         guibg=#5a6d7d   guifg=#bac5d0
hi SpecialKey       guifg=#90703B
hi StatusLine       guifg=#102015   guibg=#d0a59a   gui=none
hi StatusLineNC     guifg=#373334   guibg=#937b7a   gui=none
hi Title            guifg=#60b0ea
" hi Visual         guifg=#BFBBB6   guibg=#293133
hi Visual                           guibg=#293133
hi WarningMsg       guifg=salmon
                                    
hi Pmenu            guifg=#05181c   guibg=#99C3CC
hi PmenuSel         guifg=#dfdad3   guibg=#2D2D2D
hi PmenuSbar                        guibg=#dfdad3
hi PmenuThumb                       guifg=#666461


"Syntax hilight groups

hi Comment          guifg=#4D4D4D
hi Constant         guifg=#0069c6
hi String           guifg=#0069c6
" hi Character      guifg=#E9C062
" hi Number         guifg=#96d339
hi Boolean          guifg=#f74b46
" hi Float
hi Identifier       guifg=#6397ee   guibg=#3b3b3b
hi Function         guifg=#fd00aa   guibg=#000      gui=italic,bold
hi Statement        guifg=#f0caba
" hi Conditional
" hi Repeat
" hi Label
" hi Operator
" hi keyword
" hi Exception
hi PreProc          guifg=#6397ee                   gui=none
" hi Include        
" hi Define         
" hi Macro          
" hi PreCondit      
hi Type             guifg=#ffffff
" hi StorageClass   
" hi Structure      
" hi Typedef        
hi Special          guifg=#556065
" hi SpecialChar
" hi Tag
" hi Delimiter
" hi SpecialComment
" hi Debug
hi Underlined       guifg=#80aae0
hi Ignore           guifg=grey40
hi Error            guibg=#e04462
hi Todo             guifg=orangered   guibg=yellow2
