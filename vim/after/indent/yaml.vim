" Original script from https://github.com/pearofducks/ansible-vim
" Copyright (c) 2015 Dave Honneffer
"
" Small tweaks by Pietro Albini <pietro@pietroalbini.io>


let s:save_cpo = &cpo
set cpo&vim

setlocal indentexpr=GetYamlIndent(v:lnum)
setlocal nosmartindent
setlocal commentstring=#%s
setlocal formatoptions=cl
" c -> wrap long comments, including #
" l -> do not wrap long lines

let s:comment = '\v^\s*#' " # comment
let s:array_entry = '\v^\s*-\s' " - foo
let s:named_module_entry = '\v^\s*-\s*.*:' " - name: 'do stuff'
let s:dictionary_entry = '\v^\s*.*:\s*$' " with_items:
let s:key_value = '\v^\s*.*:\s*\S' " apt: name=package

if exists('*GetYamlIndent')
  finish
endif

function GetYamlIndent(lnum)
  if a:lnum == 1 || !prevnonblank(a:lnum-1)
      return 0
  endif
  let prevlnum = prevnonblank(a:lnum - 1)
  let maintain = indent(prevlnum)
  let increase = maintain + &sw

  let line = getline(prevlnum)
  if line =~ s:named_module_entry
    return increase
  elseif line =~ s:array_entry
    return maintain
  elseif line =~ s:dictionary_entry
    return increase
  elseif line =~ s:key_value
    return maintain
  else
    return maintain
  endif
endfunction

let &cpo = s:save_cpo
