" My own, personal vim _themeColor
"
" Theme made by Pietro Albini <pietro@pietroalbini.io>
" Released under the UNLICENSE license, aka public domain

" vim:foldmethod=marker:foldlevel=0


set background=dark
let g:colors_name = "pietroalbini"

hi clear
if exists("syntax on")
    syntax reset
endif


hi _themeColorBlue ctermfg=74 ctermbg=NONE
hi _themeColorGrey ctermfg=240 ctermbg=NONE
hi _themeColorPurple ctermfg=141 ctermbg=NONE
hi _themeColorWhite ctermfg=15 ctermbg=NONE
hi _themeColorGreen ctermfg=83 ctermbg=NONE

hi _themeHighlight cterm=bold ctermfg=221


" Vim UI {{{

hi clear LineNr
hi clear Search
hi clear IncSearch
hi clear NonText

hi link LineNr _themeColorGrey
hi link NonText _themeColorGrey
hi CursorLineNr ctermfg=15 ctermbg=234
hi ColorColumn ctermfg=15 ctermbg=234
hi Visual ctermbg=236
hi CursorLine ctermbg=235 cterm=NONE
hi SignColumn ctermbg=234

hi link Search _themeHighlight
hi link IncSearch Search

hi Normal ctermfg=15 ctermbg=234
hi VertSplit ctermbg=234 ctermfg=234
hi StatusLineNC cterm=NONE ctermfg=15 ctermbg=237
hi StatusLine cterm=bold ctermbg=237
hi Folded cterm=NONE ctermfg=243 ctermbg=236

" }}}
" General syntax highlight {{{

hi clear Comment
hi clear Type
hi clear Identifier
hi clear Statement
hi clear PreProc
hi clear Constant
hi clear Special
hi clear String

hi link Comment _themeColorGrey
hi link Type _themeColorBlue
hi link Identifier _themeColorWhite
hi link Statement _themeColorBlue
hi link PreProc _themeColorBlue
hi link Constant _themeColorPurple
hi link Special _themeColorPurple

hi link String _themeColorGreen
hi link Character String

" }}}

" Python syntax {{{

hi link pythonExceptions Identifier
hi link pythonDecorator Identifier
hi link pythonBuiltin Identifier

" }}}
" HTML syntax {{{

hi link htmlStatement _themeColorPurple
hi link htmlTag htmlStatement
hi link htmlEndTag htmlTag
hi htmlLink ctermfg=15 ctermbg=NONE cterm=underline

" }}}
" CSS syntax {{{

hi link atKeyword _themeColorBlue
hi link cssClassName _themeColorBlue
hi link cssIdentifier _themeColorBlue
hi link cssProp _themeColorBlue
hi link cssAttr _themeColorWhite

" }}}
" bash syntax {{{

hi link shOption _themeColorWhite
hi link shQuote shString
hi link shShellVariables _themeColorBlue
hi link shDeref shShellVariables
hi link shDerefOp shShellVariables
hi link shDerefDelim shShellVariables

" }}}
" JavaScript synt ax {{{

hi link javaScriptIdentifier Keyword
hi link javaScriptFunction Keyword
hi link javaScriptGlobal Identifier
hi link javaScriptMember Identifier
hi link javaScriptNull Type
hi link javaScriptBoolean Type
hi link javaScriptNumber Constant

" }}}
" YAML syntax {{{

hi link yamlBlockMappingKey _themeColorBlue
hi link yamlBlockCollectionItemStart _themeColorBlue
hi link yamlKeyValueDelimiter _themeColorBlue

" }}}
" git commit syntax {{{

hi link gitcommitFile _themeColorWhite
hi link gitcommitSelected _themeColorGreen
hi link gitcommitSelectedType _themeColorGreen
hi link gitcommitDiscarded _themeColorGrey
hi link gitcommitDiscardedType _themeColorGrey

" I know I shouldn't do this, but that's the only way to remove colors on the
" header of a section, unfortunately
autocmd FileType gitcommit :syntax clear gitcommitHeader

" }}}
" rst syntax {{{

hi link rstSections _themeColorBlue

" }}}
" rust syntax {{{

hi link rustModPath Identifier
hi link rustModPathSep Identifier
hi link rustFoldBraces Identifier

hi link rustEnum Identifier
hi link rustEnumVariant Idetifier

hi link rustType Identifier
hi link rustSelf Identifier
hi link rustMacro Identifier

hi link rustLabel rustLifetime

hi link rustAttribute _themeColorGrey
hi link rustDerive _themeColorGrey

" }}}
" toml syntax {{{

hi link tomlTable _themeColorPurple

" }}}
" sass syntax {{{

hi link sassVariable _themeColorBlue

" }}}
" Makefile syntax {{{

hi link makeCommands _themeColorWhite
hi link makeTarget _themeColorPurple
hi link makeIdent _themeColorBlue
hi makeSpecial cterm=bold ctermfg=15 ctermbg=NONE

" }}}
" .vim syntax {{{

hi link vimOption _themeColorWhite
hi link vimGroup _themeColorWhite

hi link vimHiAttrib _themeColorPurple
hi link vimHiKeyList _themeColorWhite

" }}}
" Jinja syntax {{{

hi link jinjaString String

" }}}

" CtrlP plugin {{{

hi link CtrlPMatch _themeHighlight

" }}}
" GitGutter plugin {{{

hi link GitGutterAdd _themeColorGrey
hi link GitGutterChange _themeColorGrey
hi link GitGutterDelete _themeColorGrey
hi link GitGutterChangeDelete _themeColorGrey

" }}}
