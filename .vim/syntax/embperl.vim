" Vim syntax file
" Language:	embperl
" Source: http://vim.sourceforge.net/scripts/script.php?script_id=61

if exists("b:current_syntax")
    finish
endif

if !exists("main_syntax")
    let main_syntax = 'embperl'
endif

runtime! syntax/html.vim
unlet b:current_syntax
syn include @EmbperlPerl syntax/perl.vim
syn cluster htmlPreproc add=EmbperlInsideHtml

" [- ... -] execute code without showing output
" [* ... *] execute code without showing output and sharing the scope of the previous code
" [= ... -] execute code and output the result
" [! ... !] execute code once
" [$ ... $] meta commands for conditionals
syn keyword embperlMeta contained if elsif else endif while endwhile do until foreach endforeach hidden var sub endsub
syn region EmbperlInsideHtml matchgroup=Tags start="\[+"rs=s end="+\]"re=e contains=@EmbperlPerl
syn region EmbperlInsideHtml matchgroup=Tags start=+\[-+rs=s end=+-\]+re=e contains=@EmbperlPerl
syn region EmbperlInsideHtml matchgroup=Tags start=+\[\*+rs=s end=+\*\]+re=e contains=@EmbperlPerl
syn region EmbperlInsideHtml matchgroup=Tags start=+\[!+rs=s end=+!\]+re=e contains=@EmbperlPerl
syn region EmbperlInsideHtml matchgroup=Tags start=+\[\$+rs=s end=+\$\]+re=e contains=embperlMeta, perlConditional, perlOperator

hi link embperlMeta	perlStatement

let b:current_syntax = "embperl"
if main_syntax == 'embperl'
    unlet main_syntax
endif
