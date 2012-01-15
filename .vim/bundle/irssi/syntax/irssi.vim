" Irssi Log syntax file based on https://github.com/vim-scripts/irssilog.vim

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = 'irssi'

syntax match   irssiTimestamp	'^\d\{2}:\d\{2}\(:\d\{2}\)\?' nextgroup=@irssiItems skipwhite
syntax region  irssiNick	start='<' end='>' contained
syntax region  irssiLogMsg	start='^---' end='$'
syntax region  irssiAction	start='\*' end='$' contained
syntax region  irssiMsg		start='-!-' end='$' contained
syntax region  irssiNotice	start='\*\{3}' end=':' contained

syntax match   irssiMyNick      /\cATARAXIA.*/

syntax cluster irssiItems	contains=irssiNick,irssiAction,irssiMsg,irssiNotice

highlight irssiTimestamp	guifg=#40FFFF		gui=none	ctermfg=14		cterm=none
highlight irssiNick		guifg=#005fdf		gui=none	ctermfg=26		cterm=none
highlight irssiMyNick		guifg=Red		gui=none	ctermfg=9		cterm=none
highlight irssiAction		guifg=#df00df		gui=none	ctermfg=164		cterm=none
highlight irssiLogMsg		guifg=#00af00		gui=none	ctermfg=34		cterm=none
highlight link irssiMsg irssiLogMsg
highlight link irssiNotice irssiTimestamp
