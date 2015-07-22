" My own, personal vim theme
"
" Theme made by Pietro Albini <pietro@pietroalbini.io>
" Released under the UNLICENSE license, aka public domain

set background=dark
let g:colors_name = "pietroalbini"

hi clear
if exists("syntax on")
    syntax reset
endif

" Vim UI
hi Normal ctermfg=15 ctermbg=234
hi LineNr ctermfg=247 ctermbg=NONE
hi CursorLineNr ctermfg=15 ctermbg=235
hi ColorColumn ctermfg=15 ctermbg=235
hi Visual ctermbg=236
hi CursorLine ctermbg=235 cterm=NONE

" General syntax
hi Comment ctermfg=240 ctermbg=NONE
hi Constant ctermfg=99 ctermbg=NONE
hi Identifier ctermfg=15 ctermbg=NONE
hi Statement ctermfg=221 ctermbg=NONE
hi PreProc ctermfg=221 ctermbg=NONE
hi Type ctermfg=74 ctermbg=NONE

hi String ctermfg=83 ctermbg=NONE
hi link Character String

" Python syntax
hi link pythonExceptions Identifier
hi link pythonDecorator Identifier
hi link pythonBuiltin Identifier

" HTML syntax
hi htmlStatement ctermfg=141 ctermbg=NONE
hi link htmlTag htmlStatement
hi link htmlEndTag htmlTag
hi htmlLink ctermfg=15 ctermbg=NONE cterm=underline

" CSS syntax
hi link atKeyword Statement
hi link cssClassName Statement
hi link cssIdentifier Statement
hi cssProp ctermfg=147 ctermbg=NONE
hi link cssAttr Identifier

" Bash syntax
hi link PreProc Type
hi link shQuote shString
hi link shShellVariables Type
hi link shDeref shShellVariables
hi link shDerefOp shDeref
hi link shVariable Type
