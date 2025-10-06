highlight clear

if exists("syntax_on")
  syntax reset
endif

" set syntax on
let colors_name = "joyeuse"
set background=dark
set termguicolors

" light


let s:gui_colors = ["#606060",
            \"#fa5252",
            \"#58B0B6",
            \"#E5C07B",
            \"#60AEEF",
            \"#C778DD",
            \"#54C0Ce",
            \"#9AA3B3",
            \"#464646",
            \"#ff6363",
            \"#32B7A9",
            \"#ffaf47",
            \"#1B8BFC",
            \"#AC1AC7",
            \"#19C2DD",
            \"#535962"]


let s:gui_color_dict = {
      \"light_black": "#606060",
      \"light_red": "#fa5252",
      \"light_green": "#58B0B6",
      \"light_yellow": "#E5C07B",
      \"light_blue": "#60AEEF",
      \"light_magenta": "#C778DD",
      \"light_cyan": "#54C0Ce",
      \"light_white": "#9AA3B3",
      \"black": "#464646",
      \"red": "#ff6363",
      \"green": "#32B7A9",
      \"yellow": "#ffaf47",
      \"blue": "#1B8BFC",
      \"magenta": "#AC1AC7",
      \"cyan": "#19C2DD",
      \"white": "#535962"}


let s:foreground = "#D4D6D9"
" let s:background = "#151823"
let s:background = "none"
exec "hi normal guifg=" . s:foreground "guibg= " . s:background


function! s:hi(group, fg, bg, attr, guisp)
    if a:fg != ""
        exec "hi " . a:group . " guifg=" . s:gui_colors[ a:fg ] . " ctermfg=" . a:fg
    endif
    if a:bg != ""
        exec "hi " . a:group . " guibg=" . s:gui_colors[ a:bg ] . " ctermbg=" . a:bg
    endif
    if a:attr == ""
        exec "hi " . a:group . " gui=NONE cterm=NONE"
    else
        exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
    if a:guisp != ""
        exec "hi " . a:group . " guisp=" . a:guisp
    endif
endfunction



call s:hi("ColorColumn", "", "8", "", "")
call s:hi("CursorLine", "", "", "", "")
call s:hi("CursorLineNr", "7", "", "", "")
call s:hi("StatusLine", "7", "8", "", "")
call s:hi("StatusLineNC", "15", "8", "", "")
call s:hi("LineNr", "15", "", "", "")
call s:hi("MatchParen", "", "0", "", "")

hi! link qfError lineNr
call s:hi("Pmenu", "15", "8", "", "")
call s:hi("PmenuSel", "7", "8", "", "")
call s:hi("PmenuSbar", "", "8", "", "")
call s:hi("PmenuThumb", "", "7", "", "")
call s:hi("DiffAdd", "0", "2", "", "")
call s:hi("DiffChange", "0", "3", "", "")
call s:hi("DiffDelete", "0", "1", "", "")
call s:hi("DiffText", "0", "11", "bold", "")

call s:hi("NERDTreeCWD", "0", "", "", "")

call s:hi("Visual", "", "", "inverse", "")
call s:hi("Search", "", "7", "", "")


call s:hi("NonText", "0", "", "", "")
call s:hi("Directory", "10", "", "", "")
call s:hi("Title", "1", "", "", "")
call s:hi("Statement", "2", "", "", "")

" Invert selected lines in visual mode
"highlight Visual         ctermfg=NONE ctermbg=NONE cterm=inverse

" Highlight search matches in black, with a yellow background
"highlight Search         ctermfg=0    ctermbg=7
"+---------------+
"+ UI Components +
"+---------------+

"ColorColumn
"Cursor
"CursorLine
"Error
"iCursor
"LineNr
"MatchParen
"NonText
"Normal
"PMenu
"PmenuSbar
"PMenuSel
"PmenuThumb
"SpecialKey
"SpellBad
"SpellCap
"SpellLocal
"SpellRare
"Visual
"VisualNOS

"+- Neovim Support -+
"healthError
"healthSuccess
"healthWarning
"TermCursorNC



" Syntax Highlighting

" highlight TermCursor cterm=reverse
" highlight NonText ctermfg=12
" highlight Directory ctermfg=4
" highlight ErrorMsg ctermfg=15 ctermbg=1
" highlight IncSearch cterm=reverse
" highlight MoreMsg ctermfg=2
" highlight ModeMsg cterm=bold
" highlight Question ctermfg=2
" highlight Title ctermfg=5
" highlight WarningMsg ctermfg=1
" highlight WildMenu ctermfg=0 ctermbg=11
" highlight Conceal ctermfg=7 ctermbg=7
" highlight PmenuSbar ctermbg=8
" highlight PmenuThumb ctermbg=0
" highlight TabLine cterm=underline ctermfg=0 ctermbg=7
" highlight TabLineSel cterm=bold
" highlight TabLineFill cterm=reverse
" highlight SpellBad ctermbg=2
" highlight SpellRare ctermbg=5
" highlight SpellLocal ctermbg=14
" highlight SpecialKey ctermfg=4

"highlight Comment ctermfg=0
"highlight Constant ctermfg=3
"highlight Identifier cterm=NONE ctermfg=12
"highlight Function cterm=NONE ctermfg=11
"highlight Statement ctermfg=NONE
"highlight Conditional ctermfg=13
"highlight Repeat ctermfg=13
"highlight Label ctermfg=13
"highlight Keyword ctermfg=13
"highlight Exception ctermfg=12
"highlight PreProc ctermfg=5
"highlight Type ctermfg=10
"highlight Special ctermfg=4

call s:hi("Comment", "0", "", "", "")
call s:hi("Constant", "3", "", "", "")
call s:hi("Identifier", "12", "", "", "")
call s:hi("Function", "11", "", "", "")
call s:hi("Conditional", "13", "", "", "")
call s:hi("Repeat", "13", "", "", "")
call s:hi("Label", "13", "", "", "")
call s:hi("Keyword", "13", "", "", "")
call s:hi("Exception", "12", "", "", "")
call s:hi("PreProc", "5", "", "", "")
call s:hi("Type", "10", "", "", "")
call s:hi("Special", "4", "", "", "")


" highlight Underlined cterm=underline ctermfg=5
" highlight Ignore ctermfg=15
" highlight Error ctermfg=15 ctermbg=9
highlight Todo ctermbg=NONE

" Language Specific
" Vim

"highlight vimSynType ctermfg=3
"highlight vimVar ctermfg=9
"highlight vimCommand ctermfg=10
"highlight vimMapLhs ctermfg=11
"highlight vimMapRhs ctermfg=11
"highlight vimNotation ctermfg=11
hi! link vimBracket NONE
"highlight vimMapMod ctermfg=11
"highlight vimMapModKey ctermfg=11
"highlight vimFuncName ctermfg=9
hi! link vimFuncSID NONE
"highlight vimEnvvar ctermfg=NONE
"highlight vimSep ctermfg=NONE
"highlight vimSet ctermfg=NONE
hi! link vimOption NONE
hi! link vimParenSep NONE
hi! link vimUsrCmd String
hi! link vimOper normal


call s:hi("vimSynType", "3", "", "", "")
call s:hi("vimVar", "9", "", "", "")
call s:hi("vimCommand", "10", "", "", "")
call s:hi("vimMapLhs", "11", "", "", "")
call s:hi("vimMapRhs", "11", "", "", "")
call s:hi("vimNotation", "11", "", "", "")
call s:hi("vimMapMod", "11", "", "", "")
call s:hi("vimMapModKey", "11", "", "", "")
call s:hi("vimFuncName", "9", "", "", "")


" zsh
hi! link zshVariableDef NONE
hi! link zshCommands NONE
highlight zshCommands ctermfg=9
highlight Identifier ctermfg=NONE
hi! link zshDelim NONE
hi! link zshFlag NONE
hi! link zshSubstDelim String
hi! link zshSubst String
hi! link shSemicolon NONE
hi! link zshStringDelimiter String
hi! link zshString String

" Javascript
highlight jsFuncCall cterm=NONE ctermfg=9
highlight jsReturn ctermfg=13
hi! link jsGlobalObjects NONE
highlight jsGlobalNodeObjects ctermfg=11
" highlight jsOperator ctermfg=7
hi! link jsArrowFunction NONE
highlight jsUndefined ctermfg=7
hi! link jsxBraces NONE
hi! link jsxComponentName NONE
hi! link jsxCloseString NONE

" HTML
highlight htmlItalic ctermfg=6 ctermbg=NONE
highlight htmlBold ctermfg=5 ctermbg=NONE
highlight htmlH1 ctermfg=1 ctermbg=NONE


" Python
" highlight pythonImport ctermfg=10
" " hi! link pythonStatement Statement
" highlight pythonClassVar ctermfg=1
" " highlight pythonOperator ctermfg=7
" hi! link pythonRepeat Repeat
" highlight pythonFunctionCall ctermfg=9
" hi! link pythonDottedName NONE
" hi! link pythonDecorator NONE
" hi! link pythonDecoratorName NONE
" hi! link pythonBuiltinFunc pythonFunctionCall
" hi! link pythonStrFormatting String
" hi! link pythonSpaceError NONE
" hi! link pythonIndentError NONE

hi! link @variable Normal
hi! link @type Normal
hi! link @constructor Normal
hi! link @parameter Normal
hi! link @punctuation Normal
hi! link @operator Normal
hi! link @type.builtin Normal
hi! link @constant.builtin Normal
hi! link @property Normal
hi! link @namespace Normal
" hi! link @method Normal

call s:hi("@include", "5", "", "", "")
call s:hi("@variable.builtin", "9", "", "", "")
" call s:hi("@type", "14", "", "", "")
call s:hi("@keyword", "5", "", "", "")
call s:hi("@keyword.function", "10", "", "", "")
call s:hi("@keyword.return", "5", "", "", "")
call s:hi("@method.call", "1", "", "", "")
call s:hi("@function", "11", "", "", "")
call s:hi("@type.qualifier", "11", "", "", "")
call s:hi("@function.builtin", "4", "", "", "")
call s:hi("@function.call", "4", "", "", "")
" call s:hi("@method", "11", "", "", "")
call s:hi("@repeat", "5", "", "", "")
call s:hi("@conditional", "5", "", "", "")
call s:hi("@tag", "1", "", "", "")



" Java
hi! link javacommenttitle comment
hi! link javadoctags comment
hi! link javaConstant NONE
hi! link javaStructure NONE
hi! link javaType pythonFunctionCall
hi! link javaStorageClass NONE
hi! link javaAccessKeyword pythonStatement


" line numbers, comments, color columns, the status line, splits and sign columns.
" highlight Folded ctermfg=8 ctermbg=7
" highlight FoldColumn ctermfg=8 ctermbg=7
" highlight Pmenu ctermfg=0 ctermbg=7
" highlight PmenuSel ctermfg=7 ctermbg=0
" highlight SpellCap ctermfg=8 ctermbg=7
" highlight StatusLine ctermfg=0 ctermbg=7 cterm=bold
" highlight StatusLineNC ctermfg=8 ctermbg=7 cterm=NONE
" highlight VertSplit ctermfg=8 ctermbg=7 cterm=NONE
" highlight SignColumn ctermbg=7

hi! SnipLeadingSpaces ctermbg=NONE

" LaTeX
hi! TexStyleItal ctermbg=NONE
