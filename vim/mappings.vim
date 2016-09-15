" Here there are my mappings
"
" Script made by Pietro Albini <pietro@pietroalbini.io>
" Released under the UNLICENSE license, aka public domain

" Setup mapping
let mapleader = "-"
let maplocalleader = "\\"

" <leader>' will single-quote and <leader>" will double-quote:
" - in normal mode the word
" - in visual mode the selection
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>' <esc>`<i'<esc>`>lli'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>lli"<esc>

" <leader>w will rewrap the current paragraph
nnoremap <leader>w vipgq

" H will move you to the start of the line, and L to the end
nnoremap H V<esc>`<
nnoremap L V<esc>`>

" Exit insert mode easily
inoremap jk <esc>

"
" rst-specific mappings
"

" <leader>H makes a page heading
autocmd FileType rst nnoremap <buffer> <leader>H "zyy"zpV:s/./=/g<CR>"zyyk"zPj

" <leader>-h= makes a section heading with =
autocmd FileType rst nnoremap <buffer> <leader>h1 "zyy"zpV:s/./=/g<CR>k

" <leader>-h- makes a section heading with -
autocmd FileType rst nnoremap <buffer> <leader>h2 "zyy"zpV:s/./-/g<CR>k

" <leader>-h~ makes a section heading with ~
autocmd FileType rst nnoremap <buffer> <leader>h3 "zyy"zpV:s/./\~/g<CR>k
