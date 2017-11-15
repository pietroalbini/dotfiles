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

" <leader>w will rewrap the current paragraph or selection
nnoremap <leader>w vipgq
vnoremap <leader>w gq

" <leader>s will sort the lines in the current paragraph or selection
nnoremap <leader>s vip:sort<CR>
vnoremap <leader>s :sort<CR>

" H will move you to the start of the line, and L to the end
nnoremap H V<esc>`<
nnoremap L V<esc>`>

" Exit insert mode easily
inoremap jk <esc>


"
" Ctrl-P specific mappings
"
nnoremap <leader>ef :CtrlP<CR>
nnoremap <leader>es :new<CR>:CtrlP<CR>
nnoremap <leader>ev :vnew<CR>:CtrlP<CR>


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


"
" c-specific mappings
"

" <leader>H makes an heading comment
autocmd FileType c nnoremap <buffer> <leader>H 0i *  <ESC>$a  *<ESC>"zyy"zP"zpjV:s/./*/g<CR>0r $a/<ESC>kkV:s/./*/g<CR>0r/
