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

" Setup Unite
nnoremap <leader>ef :Unite file_rec/async -start-insert<cr>
nnoremap <leader>es :Unite file_rec/async -start-insert -default-action=split
            \<CR>
nnoremap <leader>ev :Unite file_rec/async -start-insert -default-action=vsplit
            \<CR>
nnoremap <leader>et :Unite file_rec/async -start-insert
            \ -default-action=tabopen<CR>
