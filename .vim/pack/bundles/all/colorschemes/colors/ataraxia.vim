" Ataraxia Colorscheme
" -- based on torte --
" --  < Ataraxia >  --
"
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "Ataraxia"

" #80A0FF = Light blue
" #505050 = Dark Grey
" #3C00FF = Blue
" #FFFFA0 = Light Yellow
" #CC0000 = Red Brown
" #0099DD = Dark Cyan
" #DF005F = Fancy Red

highlight Normal        guifg=Grey90    guibg=Black     gui=none   ctermfg=254   ctermbg=0     cterm=none
highlight Visual        guifg=Grey25                    gui=bold                               cterm=none
highlight Cursor        guifg=Black     guibg=Grey70    gui=bold                               cterm=none
highlight Comment       guifg=#00AFFF                   gui=none   ctermfg=33                  cterm=none
highlight Special       guifg=#FFFF87                   gui=none   ctermfg=228                 cterm=none
highlight Statement     guifg=#FFFF87                   gui=none   ctermfg=228                 cterm=none
highlight Type          guifg=#60FF60                   gui=none   ctermfg=119                 cterm=none
highlight Constant      guifg=#FF5F87                   gui=none   ctermfg=204                 cterm=none
highlight Identifier    guifg=#40FFFF                   gui=none   ctermfg=14                  cterm=none
highlight Preproc       guifg=#40FFFF                   gui=none   ctermfg=14                  cterm=none
highlight Todo          guifg=Blue      guibg=#FFFFA0   gui=none                 ctermbg=229   cterm=none
highlight RedTodo       guifg=Red       guibg=Black     gui=none   ctermfg=9     ctermbg=0     cterm=none
highlight NonText       guifg=Grey40    guibg=NONE      gui=none                               cterm=none
highlight SpecialKey    guifg=#0099DD   guibg=NONE      gui=none   ctermfg=32                  cterm=none
highlight Conceal       guifg=#FFFFA0   guibg=Black     gui=none   ctermfg=229                 cterm=none
highlight MatchParen    guifg=Blue      guibg=#FFFFA0   gui=none   ctermfg=18    ctermbg=229   cterm=none
highlight Underlined    guifg=#80A0FF                   gui=none   ctermfg=81                  cterm=none

highlight CodeSnip      guifg=Red       guibg=#FFDFFF   gui=none   ctermfg=9     ctermbg=225   cterm=none

highlight Search        guifg=Black     guibg=#FFFFA0   gui=none   ctermfg=0     ctermbg=229   cterm=none
highlight ExtWhiteSpace guifg=White     guibg=#DF5F00   gui=bold   ctermfg=255   ctermbg=166   cterm=bold
highlight Pmenu         guifg=White     guibg=Blue      gui=none                               cterm=none
highlight PmenuSel      guifg=White     guibg=Red       gui=none                               cterm=none

highlight DiffAdd       guifg=black     guibg=#5FDF5F   gui=none   ctermfg=0     ctermbg=28    cterm=none
highlight DiffDelete                    guibg=#FF0000   gui=none   ctermfg=255   ctermbg=124   cterm=none
highlight DiffChange                    guibg=#5F005F   gui=none                 ctermbg=90    cterm=none
highlight DiffText                      guibg=#AF0087   gui=none                 ctermbg=19    cterm=none

highlight LineNr        guifg=Grey40    guibg=Grey10    gui=none   ctermfg=237   ctermbg=232   cterm=none
highlight Folded        guifg=Cyan      guibg=#505050   gui=none                 ctermbg=239   cterm=none
highlight FoldColumn    guifg=Grey40    guibg=Grey10    gui=none
highlight WildMenu      guifg=Black     guibg=Yellow
highlight ModeMsg       guifg=Grey60

highlight StatusLine    guifg=#B2B2B2   guibg=#005F87   gui=none   ctermfg=249   ctermbg=24    cterm=none
highlight StatusLineNC  guifg=Black     guibg=#005F87   gui=none   ctermfg=0     ctermbg=24    cterm=none
highlight User1         guifg=#FFFF87   guibg=#005F87   gui=none   ctermfg=228   ctermbg=24    cterm=none
highlight User2         guifg=#FF0000   guibg=#005F87   gui=none   ctermfg=196   ctermbg=24    cterm=none
highlight User3         guifg=black     guibg=#DF005F   gui=none   ctermfg=0     ctermbg=161   cterm=none

hi VimwikiHeader1       guifg=#FF0000                              ctermfg=9
hi VimwikiHeader2       guifg=#00FF00                              ctermfg=10
hi VimwikiHeader3       guifg=#0000FF                              ctermfg=21
hi VimwikiHeader4       guifg=#FF00FF                              ctermfg=13
hi VimwikiHeader5       guifg=#00FFFF                              ctermfg=14
hi VimwikiHeader6       guifg=#FFFF00                              ctermfg=11

hi IndentGuidesOdd                      guibg=#303030                           ctermbg=236
hi IndentGuidesEven                     guibg=#1C1C1C                           ctermbg=234

" ignore perlElseIfError
hi link perlElseIfError Normal
