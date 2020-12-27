function! FixFancyCharacters()
  let l:typo = {}
  let l:typo['“'] = '"'
  let l:typo['”'] = '"'
  let l:typo['‘'] = "'"
  let l:typo['’'] = "'"
  :exe ':%s/'.join(keys(l:typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! FixFancyCharacters :call FixFancyCharacters()

" FIXME: buggy with multiple windows
function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
function! GetBufferList()
  redir =>l:buflist
  silent! ls!
  redir END
  return l:buflist
endfunction

