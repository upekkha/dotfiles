
" ------  Pathogen  ------------------{{{
"toggle activation of specific bundles
let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'ack')
"call add(g:pathogen_disabled, 'ansible-vim')
"call add(g:pathogen_disabled, 'browser-refresh')
"call add(g:pathogen_disabled, 'bufexplorer')
"call add(g:pathogen_disabled, 'BufOnly')
"call add(g:pathogen_disabled, 'coffee-script')
"call add(g:pathogen_disabled, 'ColorX')
"call add(g:pathogen_disabled, 'colorizer')
call add(g:pathogen_disabled, 'css-color')
"call add(g:pathogen_disabled, 'ctrlp')
"call add(g:pathogen_disabled, 'file-line')
"call add(g:pathogen_disabled, 'foldsearch')
"call add(g:pathogen_disabled, 'fugitive')
"call add(g:pathogen_disabled, 'fugitive-gitv')
"call add(g:pathogen_disabled, 'gnupg')
call add(g:pathogen_disabled, 'gnuplot')
"call add(g:pathogen_disabled, 'haml')
"call add(g:pathogen_disabled, 'indent-guides')
"call add(g:pathogen_disabled, 'IndexedSearch')
"call add(g:pathogen_disabled, 'irssi')
"call add(g:pathogen_disabled, 'jellybeans')
call add(g:pathogen_disabled, 'LaTeX-Box')
"call add(g:pathogen_disabled, 'markdown')
"call add(g:pathogen_disabled, 'matchit')
"call add(g:pathogen_disabled, 'nerdcommenter')
"call add(g:pathogen_disabled, 'nerdtree')
"call add(g:pathogen_disabled, 'python-mode')
"call add(g:pathogen_disabled, 'rainbow-parentheses')
"call add(g:pathogen_disabled, 'repeat')
"call add(g:pathogen_disabled, 'snipmate')
"call add(g:pathogen_disabled, 'surround')
"call add(g:pathogen_disabled, 'tabular')
"call add(g:pathogen_disabled, 'tagbar')
"call add(g:pathogen_disabled, 'unimpaired')
call add(g:pathogen_disabled, 'vim-dispatch')
"call add(g:pathogen_disabled, 'vim-javascript')
"call add(g:pathogen_disabled, 'vim-less')
"call add(g:pathogen_disabled, 'vim-rails')
"call add(g:pathogen_disabled, 'vim-slime')
call add(g:pathogen_disabled, 'vimwiki')
"call add(g:pathogen_disabled, 'xterm-color-table')

"automatically load bundles and generate help tags
execute pathogen#infect()
call pathogen#helptags()
"}}}

" ------  Generic settings  ----------{{{
syntax on               "enable syntax highlightning
set nocompatible        "enable all vim features
set encoding=utf8       "default file encoding
set term=xterm-color    "terminal type
set ttyfast             "fast terminal
set t_Co=256            "use 256 colors
set mouse=i             "enable mouse in insert mode
filetype plugin on      "enable filetype plugins
filetype indent on      "automatic indentation according to filetype
set autoindent          "preserve indentation on new line
set backspace=eol,start,indent  "allow backspace at end of line etc
set showmatch           "show matching paranthesis
set linebreak           "break line at end of a word
set textwidth=0         "don't break text after a certain length
set tabstop=4           "use tabs of 4 spaces
set shiftwidth=4        "indent <<,>> with tabs of 4 spaces
set softtabstop=4       "use 4 spaces per tab when editing
set expandtab           "expand tabs to spaces
set smarttab            "use sw at beginning of line, ts otherwise
set incsearch           "incremental search
set wrapscan            "continue search from top when reaching the end
set ignorecase          "search is not case-sensitive
set smartcase           "search case-sensitive for uppercase patterns
set hlsearch            "search pattern highlighting
set scrolloff=2         "show 2 lines before and after the cursor
set ruler               "show current position at the bottom
set laststatus=1        "show statusline in one single line
set showmode            "show message with current mode
set showcmd             "display partial commands and length of visual selection
set nowrap              "don't wrap lines
"set number             "show line numbers
"set numberwidth=3      "width in columns used for the line numbers
"set mousehide          "hide mouse cursor when typing
"set history=50         "number of commands to be kept in history (default:20)
"set undolevels=1000    "number of undo levels (default:1000)
"set autoread           "refresh file on external modification
"set writeany           "allow saving to any file
"set autowrite          "autosave before opening other file or :! commands
"set cursorline         "highlight cursor line
"set gdefault           "set /g flag on :s substitutions
"set spell              "spellchecking
"set spelllang=en       "set spellchecking language to english
set spellsuggest=7      "show 7 suggestions when spellchecking
set hidden              "allows switching out of a modified buffer
set nobackup            "toggle keeping ~ backups of files when saving
set swapfile            "use swp file while a file is open
set modeline            "scan first/last lines of file for vim commands
set modelines=5         "number of lines checked for modelines
set display=lastline    "show beginning of broken line at bottom of window instead of displaying @
set clipboard=unnamed   "make all operations such as yy, dd, p work with the clipboard
set wildmenu            "show matches for command-line completion
set wildmode=longest:full,full  "define how tab completion proceeds on partial match
set wildignore+=*.o,*.pdf       "Let tab completion ignore certain file types
set switchbuf=usetab    "when switching buffer, switch to tab having it open
set fillchars+=vert:\ , "use blank as separator in vertical splits
set nrformats=          "treat all numerals as decimal (instead of octal if padded with zeros)
set tabpagemax=30       "increase maximum number of tabs

" Define replacement for invisible characters (set invlist)
set listchars=eol:¬,tab:>-,trail:~

" No error beeps/flash screens
set noerrorbells
set visualbell
autocmd VimEnter * set t_vb=

" Terminal title
set title titlestring=%<%f  " Set title in terminal to filename open in vim
let &titleold=''            " Set title to blank when exiting wim

" Press K on a word to look it up in the vim help
let &keywordprg=':help'

" Customize :TOhtml
let html_number_lines=1
let html_use_css=1
"}}}

" ------  Colorscheme  ---------------{{{
colorscheme jellybeans

" Use no background in terminal instead of grey
highlight Normal                                                                 ctermbg=none
highlight NonText                                                                ctermbg=none
highlight SpecialKey                                                             ctermbg=none

" Tweak Todo to be brighter
highlight Todo          guifg=Blue      guibg=#FFFFA0   gui=none                 ctermbg=229   cterm=none

" Red color for custom todo text
highlight RedTodo       guifg=Red       guibg=Black     gui=none   ctermfg=9     ctermbg=0     cterm=none

" Highlight superfluous whitespace in orange
highlight ExtWhiteSpace guifg=White     guibg=#DF5F00   gui=bold   ctermfg=255   ctermbg=166   cterm=bold

" Custom colors used in statusline
highlight User1         guifg=#A0A8B0   guibg=#384048   gui=none   ctermfg=255   ctermbg=0     cterm=none
highlight User2         guifg=#FF0000   guibg=#DDDDDD   gui=none   ctermfg=196   ctermbg=255   cterm=none
highlight User3         guifg=black     guibg=#DF005F   gui=none   ctermfg=0     ctermbg=161   cterm=none
"}}}

" ------  Statusline  ----------------{{{
set statusline =            "start with empty string
"set statusline+=\ %02n     "buffer number
set statusline+=\ %1*\ %<%f\ %* "filename with relative path in User1 color
set statusline+=\ %y        "filetype flag:
"set statusline+=\ %h       "helpfile flag: [help]
set statusline+=%r          "readonly flag: [RO]
set statusline+=%{fugitive#statusline()}    "git branch
set statusline+=%2*%m%*     "modified flag: [+] modified, [-] unmodifiable in User2 color
set statusline+=%=          "switch from left to right justification
set statusline+=%-20.(%l/%L,%c%V%)  "add block with given offset containing
                            " %l/%L current line number / total number of lines
                            " %c%V  current column number and virtual column number
set statusline+=\ %P\       "percentage through buffer

" display presence of wrong indenting{{{
" source: vim-statline
function! StatlineIndentWarning()
    if !exists("b:statline_indent_warning")
        let b:statline_indent_warning = ''

        " no error if buffer is not modifiable or readonly
        if !&modifiable || &readonly
            return b:statline_indent_warning
        endif

        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
        let spacesbeforetabs = search(' \+\ze\t', 'nw') != 0

        " mixed indenting with tabs and spaces
        if (tabs && spaces) || spacesbeforetabs
            let b:statline_indent_warning .= ' mi'
        " consistent indenting, but wrong expandtab setting
        elseif (spaces && !&et) || (tabs && &et)
            let b:statline_indent_warning .= ' et'
        endif
        " if non-empty string, add trailing space
        if b:statline_indent_warning != ''
            let b:statline_indent_warning .= ' '
        endif
    endif
    return b:statline_indent_warning
endfunction

set statusline+=%3*%{StatlineIndentWarning()}%*

" recalculate when idle and after writing
augroup statline_indent
    autocmd!
    autocmd cursorhold,bufwritepost * unlet! b:statline_indent_warning
augroup END
"}}}

" display presence of trailing whitespaces{{{
" source: vim-statline
function! StatlineTrailingSpaceWarning()
    if !exists("b:statline_trailing_space_warning")
        let b:statline_trailing_space_warning = ''

        " no error if buffer is not modifiable or readonly
        if !&modifiable || &readonly
            return b:statline_indent_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statline_trailing_space_warning = ' tw '
        endif
    endif
    return b:statline_trailing_space_warning
endfunction

" append to status line in User3 color
set statusline+=%3*%{StatlineTrailingSpaceWarning()}%*

" recalculate when idle, and after saving
augroup statline_trail
    autocmd!
    autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
augroup END
"}}}
"}}}

" ------  Platform-dependent  --------{{{

" ------  Vim version options  -------{{{
if v:version >704 || v:version==704 && has('patch399')
	set cryptmethod=blowfish2
else
	set cryptmethod=blowfish
endif
if v:version >704 || v:version==704 && has('patch710')
    set listchars+=space:·
endif
"}}}

" ------  GUI options  ---------------{{{
if has("gui_running")
    set guioptions-=T       " disable toolbar, -=m disables menubar
    "set guioptions+=a      " copy selected text to clipboard
    set fuopt=maxvert       " only maximize window vertically in MacVim
    winpos 1100 0           " window in top right corner
    set lines=38 columns=80 " larger window
    set autochdir           " change working directory to directory of current file
    set mouse=a             " enable mouse
endif
"}}}

" ------  Mac options  ---------------{{{
if has("mac")
    set guifont=Menlo:h12   " use 12pt Menlo font
    " for TeX files open pdf in skim at the line under the cursor
    au filetype tex map <F3> <ESC>:w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf %<CR><CR>
    au filetype tex imap <F3> <ESC>:w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf %<CR><CR>
endif
"}}}
"}}}

" ------  Autocommands  --------------{{{
" Resize splits when the window is resized
au VimResized * :wincmd =

" Disable auto-comment after breaking lines with formatoptions
au FileType * setl fo-=c fo-=r fo-=o

" Create new file from template if it exists for given file extension
au BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

" Display json files using javascript filetype
au BufNewFile,BufRead *.json set ft=javascript

" Fix editing crontab
au BufNewFile,BufRead crontab.* set nobackup | set nowritebackup
set backupskip+=/private/tmp/*

" Allow reading of epub files
au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

" Add timestamp to backups
"au BufWritePre * let &bex = '-' . strftime("%Y%m%d.%H%M%S")

" Reload vimrc on change
"au BufWritePost .vimrc source $MYVIMRC

" Automatically toggle quickfix window
au QuickFixCmdPost [^1]* nested cwindow
au QuickFixCmdPost    1* nested lwindow

" Extra whitespaces
" highlight trailing spaces, and spaces in front of tabs while not in insert mode
" to switch higlighting off, enter :match
au BufEnter * match ExtWhiteSpace /\s\+$\| \+\ze\t/
au InsertEnter * match ExtWhiteSpace /\s\+\%#\@<!$/
au InsertLeave * match ExtWhiteSpace /\s\+$\| \+\ze\t/

"" Add/remove comment sign at beginning of line
"au Filetype c,cpp,java,javascript           let b:comment_leader = '// '
"au Filetype bash,sh,ruby,python,perl        let b:comment_leader = '# '
"au Filetype tex                             let b:comment_leader = '% '
"au Filetype vim                             let b:comment_leader = '" '
"noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:let @/ = ""<CR>
"noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:let @/ = ""<CR>
"}}}

" ------  Filetypes  -----------------{{{

" ------  Text  ----------------------{{{
" Use # for comments in txt and log files and force unlimited textwidth
au BufRead *.txt,*.log set filetype=text textwidth=0
au filetype text syntax match Comment /#.*/
" Highlight todo,todo:,*) in red
au filetype text syntax match RedTodo /TODO/
au filetype text syntax match RedTodo /TODO:/
au filetype text syntax match RedTodo /*)/
"}}}

" ------  Gitcommit  -----------------{{{
" Disable modeline when editing git commit messages or rebasing
au BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit nomodeline
au BufNewFile,BufRead git-rebase-todo set filetype=gitrebase nomodeline
"}}}

" ------  Irssi  ---------------------{{{
au BufRead *.irs set syntax=irssi wrap
"}}}

" ------  AutoPkg  -------------------{{{
au BufRead *.recipe set ft=xml
"}}}

" ------  Gnuplot  -------------------{{{
" Gnuplot syntax highlighting
au BufNewFile,BufRead *.gp,*.plt,*.gnuplot,*.gplot set filetype=gnuplot
" Generate Plot using F3
au filetype gnuplot map <F3> <ESC>:w \| !gnuplot % <CR>
au filetype gnuplot imap <F3> <ESC>:w \| !gnuplot % <CR>
"}}}

" ------  C++  -----------------------{{{
au filetype cpp set nowrap              " don't wrap the lines of code
au filetype cpp set foldmethod=syntax   "autofold all functions
au filetype cpp set foldlevel=6         "open all folds on startup
au filetype cpp set printoptions=paper:A4,portrait:n,number:n   " Landscape printing for code
au filetype cpp match TODO /DEBUG/      "highlight debug as todo
"}}}

" ------  Perl  ----------------------{{{
let perl_fold=1                         "needed for folds
au filetype perl set foldmethod=syntax  "autofold all functions
au filetype perl setf perl              "needed for folds
au filetype perl match TODO /DEBUG/     "highlight debug as todo
au BufRead *.epl set filetype=embperl   "syntax highlighting for embedded perl
au BufRead *.tt set filetype=html       "syntax highlighting for TemplateToolkit
"}}}

" ------  Ruby  ----------------------{{{
let ruby_fold=1                         "needed for folds
au filetype ruby set foldmethod=syntax  "autofold all functions
au filetype ruby set ts=2 sw=2 sts=2    "tabs of 2 spaces
au filetype ruby set path+=app/models/* "support gf jump to namespaced relations
"}}}

" ------  Markdown  ------------------{{{
au filetype markdown set conceallevel=2     "conceal markdown commands
au filetype markdown set wrap               "wrap lines

au filetype markdown syntax match Comment /%%.*/
au filetype markdown syntax match RedTodo /TODO/

au filetype markdown map <F3> <ESC>:w \| !marked % <CR><CR>
au filetype markdown imap <F3> <ESC>:w \| !marked % <CR><CR>

let g:markdown_folding = 1
au filetype markdown setlocal foldlevel=1
"}}}

" ------  LaTeX  ---------------------{{{
" LaTeX-box plugin
let g:LatexBox_latexmk_options="-pvc"
let g:LatexBox_viewer="open"
"}}}
"}}}

" ------  Functions  -----------------{{{

" ------  Search for selection  ------{{{
" redefine */# for forward/backward search of visual selection
" source: Practical Vim
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
"}}}

" ------  Insert Timestamp  ----------{{{
function! ListTimestampString()
    "take minutes in steps of 10
    let mmod = string(float2nr(floor(str2float(strftime('%M'))/10))).'0'
    return '['.strftime('%d/%m %H:').mmod.']'
    "return '['.strftime('%d/%m %H:%M').']'
endfunction
function! ListTimestamp()
    let line = getline('.')
    if (match(l:line,'\[[^\]]*\]') >= 0)
        let newline = substitute(l:line,'\[[^\]]*\]',ListTimestampString(),'')
    else
        let newline = l:line.' '.ListTimestampString()
    end
    call setline(line('.'),l:newline)
endfunction
"}}}

" ------  Set executable bit  --------{{{
function! MySetExecutableBit()
    let fname = expand("%:p")
    checktime
    execute "au FileChangedShell " . fname . " :echo"
    silent !chmod a+x %
    checktime
    execute "au! FileChangedShell " . fname
endfunction
"}}}

" ------  Clean trailing spaces  -----{{{
function! CleanSpaces()
    %s/\s\+$//e
endfunction
"}}}

" ------  Custom Folds  --------------{{{
function! MyFold()
  " count number of folded lines
  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  " display number of folded lines
  let foldinfo = ' ( ' . string(foldlinecount) . ' Lines ) '
  " leftcolumnwidth = foldcolumn + numbercolumn
  let lcolwd = &fdc + &number*(&numberwidth + 1)
  " textwidth = windowwidth - leftcolumn - rightoffset
  let roff = 3
  let textwd = winwidth(0) - lcolwd - roff
  " titlewidth = textwd - 3*foldlevel - foldinfo
  let titlewd = textwd - 3*len(v:folddashes) - len(foldinfo)
  " titlestr = first line of fold without fold marker
  let titlestr = substitute(getline(v:foldstart),'{{{','','g') "}}}
  " remove • from titlestr because it gives a length of 3
  let titlestr = substitute(titlestr,'•','','g')
  " remove any leading or trailing whitespace from titlestr
  let titlestr = substitute(titlestr, '^\s*\(.\{-}\)\s*$', '\1', '')
  " surround titlestr with spaces
  let title = ' '.strpart(titlestr, 0 , titlewd).' '
  " number of chars to fill line (using len of title in characters, not bytes)
  let fillcharcount = titlewd -len(substitute(title,'.','x','g'))
  return repeat("   ",len(v:folddashes)).title.repeat(" ",fillcharcount).foldinfo.repeat(" ",roff)
endfunction
set foldtext=MyFold()
"}}}

" ------  Vimfu Modeline  ------------{{{
" allow execution of commands in vimfu modelines
function! MyVimfuModeline()
  let i = &modelines
  let lln = line("$")
  if i > lln | let i = lln | endif
  while i > 0
    let l = getline(lln-i+1)
    if l =~ "vimfu:"
        exec strpart(l, stridx(l, "vimfu:")+strlen("vimfu:"))
    endif
    let i = i-1
  endwhile
endfunction
au BufReadPost * :call MyVimfuModeline()
"}}}
"}}}

" ------  Plugins  -------------------{{{

" ------  Nerdcommenter  -------------{{{
let g:NERDCreateDefaultMappings = 0 "don't create <leader> key mappings
" create custom mappings with , instead of <leader>
map ,cc <plug>NERDCommenterComment
map ,c<space> <plug>NERDCommenterToggle
map ,cm <plug>NERDCommenterMinimal
map ,cs <plug>NERDCommenterSexy
map ,ci <plug>NERDCommenterInvert
map ,cy <plug>NERDCommenterYank
map ,cl <plug>NERDCommenterAlignLeft
map ,cb <plug>NERDCommenterAlignBoth
map ,cn <plug>NERDCommenterNest
map ,cu <plug>NERDCommenterUncomment
map ,c$ <plug>NERDCommenterToEOL
map ,cA <plug>NERDCommenterAppend
map ,ca <plug>NERDCommenterAltDelims
" custom delimiter for cpp: /* -> /*<space>
" define delimiter for txt and log
let g:NERDCustomDelimiters = {
    \ 'cpp': { 'left': '//', 'leftAlt': '/* ', 'rightAlt': ' */' },
    \ 'text': { 'left': '#' },
    \ 'embperl': { 'left': '#' },
    \ 'wiki': { 'left': '%%' },
    \ 'snippet': { 'left': '#' }
\ }
"}}}

" ------  Vim Wiki  ------------------{{{
" wiki options
let wiki_1 = {}
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.markdown'
let g:vimwiki_global_ext = 0
let wiki_1.index = 'index'
let wiki_1.path = '~/Documents/Docs/Notes/wiki/'
let wiki_1.path_html = '~/Sites/wiki/'
let wiki_1.auto_export = 0
let wiki_1.template_path = '~/Documents/Docs/Notes/wiki/'
let wiki_1.template_default = 'template'
let wiki_1.template_ext = '.html'
let wiki_1.nested_syntaxes = {'bash': 'sh', 'perl': 'perl', 'python': 'python', 'cpp': 'cpp'}
let g:vimwiki_list = [wiki_1]
" enable folding
let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 0
let g:vimwiki_fold_trailing_empty_lines = 0
" disable camelcase autolinks
let g:vimwiki_camel_case=0
" use taglist
let tlist_vimwiki_settings = 'dokuwiki;h:Headers'
" place menu as plugin submenu
let g:vimwiki_menu = 'Plugin.Vimwiki'
" don't allow for spaces in names and replace by _
let g:vimwiki_badsyms = ' '
let g:vimwiki_stripsym = '_'
" use open command to view in default browser
let g:vimwiki_browsers=['open']
" dokuwiki hacks
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,div,center,strong,em,del,nowiki,code'
"}}}

" ------  Rainbow Parentheses  -------{{{
"Define custom color pairs {cterm, gui} from the 16 named colors
let g:rbpt_colorpairs = [
    \ ['red',       'red'],
    \ ['green',     'green'],
    \ ['yellow',    'yellow'],
    \ ['blue',      'blue'],
    \ ['magenta',   'magenta'],
    \ ['cyan',      'cyan'],
    \ ]
"}}}

" ------  Colorizer  -----------------{{{
let g:colorizer_nomap = 1       " don't define keyboard mappings
let g:colorizer_startup = 0     " don't automatically start, use :ColorToggle instead
"}}}

" ------  CtrlP  ---------------------{{{
let g:ctrlp_map = '<c-p>'       " key mapping to invoke ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'  " use mixed mode by default
let g:ctrlp_mruf_max = 25       " number of recently opened files to remember
let g:ctrlp_open_new_file = 'r' " open new files in current window (t,h,v,r)
let g:ctrlp_follow_symlinks = 1 " follow symlinks when listing files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|vendor.*|tmp)$',
  \ 'file': '\v\.(lock|jpg|png|ico)$',
  \ }
"}}}

" ------  tagbar  --------------------{{{
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
"}}}

" ------  Other  ---------------------{{{
" netrw: silent file transfer
let g:netrw_silent=1

" NerdTree file filter: *~ *.o
let NERDTreeIgnore=['\~$', '\.o']

" Customize BufExplorer to not show help message
let g:bufExplorerDefaultHelp=0

" ack plugin: use macports ack and scan all types of files
let g:ackprg="~/Scripts/ack -H --nocolor --nogroup --column"

" ansible-vim
let g:ansible_attribute_highlight = 'ab'    " bright highlighting of all key=value pairs
let g:ansible_name_highlight = 'b'          " bright highlighting of name: instances

" snipmate
let g:snippets_dir="~/.vim/mysnippets/"

" python-mode
let g:pymode_options_max_line_length = 100

" vim-rails: define command to open browser
command -bar -nargs=1 OpenURL :!open <args>

" vim-slime
let g:slime_paste_file = "$HOME/.slime_cache"
let g:slime_target = "screen"
let b:slime_config = {"sessionname": "vim-shell", "windowname": "1"}
let g:slime_no_mappings = 1
" Ctrl-C Ctrl-C sends single line, or visual selection
nmap <C-c><C-c> <Plug>SlimeLineSend
imap <C-c><C-c> <Plug>SlimeLineSend
vmap <C-c><C-c> <Plug>SlimeRegionSend

" indent-guides: custom colors
let g:indent_guides_auto_colors = 0

" vim markdown fenced code highlighting
let g:markdown_fenced_languages = ['ruby', 'perl', 'sh', 'vim', 'html', 'javascript', 'css', 'python']

" browser-refresh :RRB
let g:RefreshRunningBrowserDefault = 'safari'
let g:RefreshRunningBrowserReturnFocus = 1
"}}}
"}}}

" ------  Abbreviations  -------------{{{
" Notes Script
cabbrev Note set foldmethod=indent columns=120 <Bar>NERDTreeToggle <Bar>vertical res -11

" Command to print to pdf
cabbrev hapdf hardcopy > %<.ps <Bar>!ps2pdf %<.ps %<.pdf && rm %<.ps
"}}}

" ------  Keyboard mappings  ---------{{{

" ------  Plugins  -------------------{{{

" Tabularize mappings
"if exists(":Tabularize")
    nmap <Leader>=  :Tabularize /=<CR>
    vmap <Leader>=  :Tabularize /=<CR>
    nmap <Leader>\| :Tabularize /\|<CR>
    vmap <Leader>\| :Tabularize /\|<CR>
    nmap <Leader>:  :Tabularize /:\zs<CR>
    vmap <Leader>:  :Tabularize /:\zs<CR>
    nmap <Leader>>  :Tabularize /=><CR>
    vmap <Leader>>  :Tabularize /=><CR>
    nmap <Leader>#  :Tabularize /#<CR>
    vmap <Leader>#  :Tabularize /#<CR>
"endif

" remap \t to toggle Tagbar
map <Leader>t :TagbarToggle<CR>

" remap \T to toggle NerdTree
map <Leader>T :NERDTreeToggle<CR>

" remap \r to auto-reload browser on save
map <Leader>r :autocmd BufWritePost <buffer> RRB<CR>

" remap \rp to toggle rainbow-parenthesis
map <Leader>rp :RainbowParenthesesToggle<CR>

"}}}

" remap \w to toggle display of invisible characters
map <Leader>w :set invlist<CR>

" remap \W to toggle display of whitespace as middle dot
map <Leader>W :call MyToggleSpaces()<CR>

" remap ,t to insert timestamp at end of line
nmap ,t :call ListTimestamp()<CR>

" remap r to replace visual selection with yanked text, putting the selection in the black hole buffer
vmap r "_dP

" remap Y to yank from first to last non-blank character on line (including final carriage return)
vmap Y ^y$

" remap ./, to indent visual selection without deselecting
vmap . >gv
vmap , <gv

" remap space to fold/unfold
map <space> za

" remap gf to open file under cursor in new tab instead of buffer
map gf :tabe <cfile><CR>

" remap arrow keys to move one line, not one paragraph
map <up> gk
map <down> gj
imap <up> <ESC>gka
imap <down> <ESC>gja

" map three-finger swipes to change buffer
nmap <SwipeLeft> :bN<CR>
nmap <SwipeRight> :bn<CR>

" Command to save read-only file as root and reload
"cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" remap \X to set executable bit to current buffer
nmap <Leader>X :call MySetExecutableBit()<CR>

" remap \x to save and run current buffer
imap <Leader>x <ESC>:w \| :!%:p<CR>a
map <Leader>x :w \| :!%:p<CR>

" remap Cmd-r to save and run current buffer in screen session
imap <D-r> <ESC>:w \| call system("screen -S vim-shell -p 1 -X stuff $'./" . expand('%') . "\r'")<CR><CR>a
map <D-r> :w \| call system("screen -S vim-shell -p 1 -X stuff $'./" . expand('%') . "\r'")<CR><CR>

" remap \] \[ to change tabs
map <Leader>] :tabnext<CR>
map <Leader>[ :tabprev<CR>

" remap \a to toggle line wrapping
map <Leader>a :set invwrap<CR>

" remap \h to stop hlsearch until next search
map <Leader>h :noh<CR>

" remap \s to toggle spellchecking
map <Leader>s :set invspell<CR>

" remap \ev to edit vimrc in new tab
map <Leader>ev :tabnew $MYVIMRC<CR>

" remap \sv to source vimrc
map <Leader>sv :source $MYVIMRC<CR>

" remap \cd to change working directory to the buffer's (follow symlinks)
map <Leader>cd :exe 'cd'.fnamemodify(resolve(expand("%:p")),":h")<CR>

" remap \n to toggle display of line numbers
map <Leader>n :set invnu<CR>

" remap \c to convert plist to xml and open in new tab
map <Leader>c :tabe \| set ft=xml \| read ++edit !plutil -convert xml1 -o - #<CR>

" remap \cc to convert plist to xml
map <Leader>cc :set autoread \| set ft=xml \|!plutil -convert xml1 %<CR>
"}}}

" ------  Vim Modeline  --------------{{{
" vim: set foldmethod=marker:
"}}}
