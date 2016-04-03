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
hi SignColumn ctermbg=234

" General syntax
hi Comment ctermfg=240 ctermbg=NONE
hi Constant ctermfg=99 ctermbg=NONE
hi Identifier ctermfg=15 ctermbg=NONE
hi Statement ctermfg=221 ctermbg=NONE
hi PreProc ctermfg=221 ctermbg=NONE
hi Type ctermfg=74 ctermbg=NONE
hi Special ctermfg=99 ctermbg=NONE

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

" bash syntax
hi link shQuote shString
hi link shShellVariables Type
hi link PreProc Type
hi link shDeref shShellVariables
hi link shDerefOp shShellVariables
hi link shDerefDelim shShellVariables

" JavaScript syntax
hi link javaScriptIdentifier Keyword
hi link javaScriptFunction Keyword
hi link javaScriptGlobal Identifier
hi link javaScriptMember Identifier
hi link javaScriptNull Type
hi link javaScriptBoolean Type
hi link javaScriptNumber Constant

" YAML syntax
hi link yamlBlockMappingKey Type
hi link yamlBlockCollectionItemStart Type
hi link yamlKeyValueDelimiter Type

" git commit syntax
hi link gitcommitFile Identifier
hi link gitcommitSelected String
hi link gitcommitSelectedType String
hi link gitcommitDiscarded Comment
hi link gitcommitDiscardedType Comment

" rst syntax
hi link rstSections Type

" I know I shouldn't do this, but that's the only way to remove colors on the
" header of a section, unfortunately
autocmd FileType gitcommit :syntax clear gitcommitHeader
