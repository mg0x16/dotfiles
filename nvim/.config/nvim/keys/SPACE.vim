function! s:Remap_SPACE_Key()
  let l:line   = getline('.')
  let l:col    = col('.')
  let l:currentChar  = l:line[l:col-2]
  let l:nextChar = l:line[l:col-1]
  let l:secondNextChar  = l:line[l:col]

  " Insert spaces before closing characters, {|}, (|), [|]
  if l:currentChar ==# '{' && l:nextChar ==# '}' ||
      \ l:currentChar ==# '(' && l:nextChar ==# ')' ||
      \ l:currentChar ==# '[' && l:nextChar ==# ']'
    return "\<SPACE>\<SPACE>\<C-o>h"

  " Normal <SPACE> functionality
  else
    return "\<SPACE>"
  endif
endfunction

inoremap <silent><expr> <space> <SID>Remap_SPACE_Key()

