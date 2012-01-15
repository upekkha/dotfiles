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

highlight Normal	guifg=Grey90	guibg=Black	gui=none	ctermfg=254	ctermbg=0	cterm=none
highlight Visual	guifg=Grey25			gui=bold					cterm=none
highlight Cursor	guifg=Black	guibg=Grey70	gui=bold					cterm=none
highlight Comment	guifg=#00AFFF			gui=none	ctermfg=33			cterm=none
highlight Special	guifg=#FFFFA0			gui=none	ctermfg=228			cterm=none
highlight Statement	guifg=#FFFFA0			gui=none	ctermfg=228			cterm=none
highlight Type		guifg=#60ff60			gui=none	ctermfg=119			cterm=none
highlight Constant	guifg=#FF5F87			gui=none	ctermfg=204			cterm=none
highlight Identifier	guifg=#40FFFF			gui=none	ctermfg=14			cterm=none
highlight Preproc	guifg=#40FFFF			gui=none	ctermfg=14			cterm=none
highlight Todo		guifg=Blue	guibg=#FFFFA0	gui=none			ctermbg=229	cterm=none
highlight RedTodo	guifg=Red	guibg=Black	gui=none	ctermfg=9	ctermbg=0	cterm=none
highlight NonText	guifg=Grey40	guibg=NONE	gui=none					cterm=none
highlight SpecialKey	guifg=#0099DD	guibg=NONE	gui=none	ctermfg=32			cterm=none
highlight Conceal	guifg=#FFFFA0	guibg=Black	gui=none	ctermfg=229			cterm=none
highlight MatchParen	guifg=Blue	guibg=#FFFFA0	gui=none	ctermfg=18	ctermbg=229	cterm=none

highlight CodeSnip	guifg=Red	guibg=#ffdfff	gui=none	ctermfg=9	ctermbg=225	cterm=none

highlight Search	guifg=Black	guibg=Red	gui=bold	ctermfg=0	ctermbg=9	cterm=bold
highlight ExtWhiteSpace	guifg=White	guibg=#df5f00	gui=bold	ctermfg=255	ctermbg=166	cterm=bold
highlight Pmenu		guifg=White	guibg=Blue	gui=none					cterm=none
highlight PmenuSel	guifg=White	guibg=Red	gui=none					cterm=none

highlight DiffAdd	guifg=black	guibg=#5FDF5F	gui=none	ctermfg=0	ctermbg=28	cterm=none
highlight DiffDelete			guibg=#FF0000	gui=none	ctermfg=255	ctermbg=124	cterm=none
highlight DiffChange			guibg=#5f005f	gui=none			ctermbg=90	cterm=none
highlight DiffText			guibg=#af0087	gui=none			ctermbg=19	cterm=none

highlight LineNr	guifg=Grey40	guibg=Grey10	gui=none	ctermfg=237	ctermbg=232	cterm=none
highlight Folded	guifg=Cyan	guibg=#505050	gui=none			ctermbg=239	cterm=none
highlight FoldColumn	guifg=Grey40	guibg=Grey10	gui=none
highlight StatusLine	guifg=Grey75	guibg=#005f87	gui=none	ctermfg=249	ctermbg=24	cterm=none
highlight StatusLineNC	guifg=Black	guibg=#005f87	gui=none	ctermfg=0	ctermbg=24	cterm=none
highlight WildMenu	guifg=Black	guibg=Yellow
highlight ModeMsg	guifg=Grey60

highlight VimwikiHeader1 guifg=#FF0000					ctermfg=9
highlight VimwikiHeader2 guifg=#00FF00					ctermfg=10
highlight VimwikiHeader3 guifg=#0000FF					ctermfg=21
highlight VimwikiHeader4 guifg=#FF00FF					ctermfg=13
highlight VimwikiHeader5 guifg=#00FFFF					ctermfg=14
highlight VimwikiHeader6 guifg=#FFFF00					ctermfg=11

" ignore perlElseIfError
hi link perlElseIfError Normal
