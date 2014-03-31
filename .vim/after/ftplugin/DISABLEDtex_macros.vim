" VimLaTeX Macros
" ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
" Syntax:
"call IMAP('ABBREV', '\command{<++>}<++>' , 'tex')
"call IMAP('ABBR', "\\begin{env}\<CR><++>\\end{env}<++>" ,'tex')

" `w expands to \omega instead of \wedge
call IMAP('`w', '\omega', 'tex')

" `+ expands to ^\dagger instead of \bigcup
call IMAP('`+', '^\dagger', 'tex')

" `- expands to ^\ast instead of \bigcap
call IMAP('`-', '^\ast', 'tex')

" `f expands to \frac
call IMAP('`f', '\frac{<++>}{<++>}<++>', 'tex')

" `i expands to \int
call IMAP('`i', '\int\!\! <++>', 'tex')

" `T expands to \text{}
call IMAP('`T', '\text{<++>}<++>', 'tex')

" AA expands to custom align*
call IMAP ('AA', "\\begin{align*}\<CR>\<Tab><++>\<CR>\<BS>\\end{align*}\<CR><++>", 'tex')

" `3 expands to \item
call IMAP('`3', '\item ', 'tex')

" ITE expands to custom itemize
call IMAP ('ITE', "\\begin{itemize}\<CR>\<Tab>\\item <++>\<CR>\<BS>\\end{itemize}\<CR><++>", 'tex')

" ENU expands to custom enumerate
call IMAP ('ENU', "\\begin{enumerate}\<CR>\<Tab>\\item <++>\<CR>\<BS>\\end{enumerate}\<CR><++>", 'tex')

" CH expand to custom chapter
call IMAP ('CH', "%==================================================\<CR>\\chapter{<++>}\<CR>%==================================================\<CR>\<CR>\<CR><++>", 'tex')

" SE expand to custom section
call IMAP ('SE', "\<Tab>%-----------------------------------------------------------\<CR>\\section{<++>}\<CR>%-----------------------------------------------------------\<CR>\<CR>\<BS><++>", 'tex')

" SSE expand to custom subsection
call IMAP ('SSE', "\<Tab>%-----------------------------------------------------------\<CR>\\subsection{<++>}\<CR>%-----------------------------------------------------------\<CR>\<CR>\<BS><++>", 'tex')

" FIG expands to custom figure environment
call IMAP ('FIG', "\\begin{figure}[h!!]\<CR>\\begin{center}\<CR>\<Tab>\\includegraphics[width=\\linewidth]{./figures/<++>.pdf}\<CR>\\caption{<++>}\<CR>%\\label{fig:}\<CR>\<BS>\\end{center}\<CR>\\end{figure}\<CR><++>", 'tex')


" DEFAULT mappings defined in ftplugin/latex-suite/main.vim:
"call IMAP ('__', '_{<++>}<++>', "tex")
"call IMAP ('()', '(<++>)<++>', "tex")
"call IMAP ('[]', '[<++>]<++>', "tex")
"call IMAP ('{}', '{<++>}<++>', "tex")
"call IMAP ('^^', '^{<++>}<++>', "tex")
"call IMAP ('$$', '$<++>$<++>', "tex")
"call IMAP ('==', '&=& ', "tex")
"call IMAP ('~~', '&\approx& ', "tex")
"call IMAP ('=~', '\approx', "tex")
"call IMAP ('::', '\dots', "tex")
"call IMAP ('((', '\left( <++> \right)<++>', "tex")
"call IMAP ('[[', '\left[ <++> \right]<++>', "tex")
"call IMAP ('{{', '\left\{ <++> \right\}<++>', "tex")
"call IMAP (g:Tex_Leader.'^', '\hat{<++>}<++>', "tex")
"call IMAP (g:Tex_Leader.'_', '\bar{<++>}<++>', "tex")
"call IMAP (g:Tex_Leader.'6', '\partial', "tex")
"call IMAP (g:Tex_Leader.'8', '\infty', "tex")
"call IMAP (g:Tex_Leader.'/', '\frac{<++>}{<++>}<++>', "tex")
"call IMAP (g:Tex_Leader.'%', '\frac{<++>}{<++>}<++>', "tex")
"call IMAP (g:Tex_Leader.'@', '\circ', "tex")
"call IMAP (g:Tex_Leader.'0', '^\circ', "tex")
"call IMAP (g:Tex_Leader.'=', '\equiv', "tex")
"call IMAP (g:Tex_Leader."\\",'\setminus', "tex")
"call IMAP (g:Tex_Leader.'.', '\cdot', "tex")
"call IMAP (g:Tex_Leader.'*', '\times', "tex")
"call IMAP (g:Tex_Leader.'&', '\wedge', "tex")
"call IMAP (g:Tex_Leader.'-', '\bigcap', "tex")
"call IMAP (g:Tex_Leader.'+', '\bigcup', "tex")
"call IMAP (g:Tex_Leader.'M', '\sum_{<++>}^{<++>}<++>', 'tex')
"call IMAP (g:Tex_Leader.'S', '\sum_{<++>}^{<++>}<++>', 'tex')
"call IMAP (g:Tex_Leader.'(', '\subset', "tex")
"call IMAP (g:Tex_Leader.')', '\supset', "tex")
"call IMAP (g:Tex_Leader.'<', '\le', "tex")
"call IMAP (g:Tex_Leader.'>', '\ge', "tex")
"call IMAP (g:Tex_Leader.',', '\nonumber', "tex")
"call IMAP (g:Tex_Leader.'~', '\tilde{<++>}<++>', "tex")
"call IMAP (g:Tex_Leader.';', '\dot{<++>}<++>', "tex")
"call IMAP (g:Tex_Leader.':', '\ddot{<++>}<++>', "tex")
"call IMAP (g:Tex_Leader.'2', '\sqrt{<++>}<++>', "tex")
"call IMAP (g:Tex_Leader.'|', '\Big|', "tex")
"call IMAP (g:Tex_Leader.'I', "\\int_{<++>}^{<++>}<++>", 'tex')
