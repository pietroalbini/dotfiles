" My own customizations to the Python syntax file
"
" Script made by Pietro Albini <pietro@pietroalbini.io>
" Released under the UNLICENSE license, aka public domain

" Highlight docstrings as comments
syn region pythonDocstring  start=+^\s*[uU]\?[bB]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[bB]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
hi link pythonDocstring Comment

" Highlight True, False and None as types
syn keyword pythonBoolean   False, None, True
hi link pythonBoolean Type
