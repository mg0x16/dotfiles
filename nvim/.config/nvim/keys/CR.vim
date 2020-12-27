function! s:Remap_CR_Key()
  " Select from menu, expand if it's a snippet
  if pumvisible()
    if PluginExist("coc.nvim")
      return coc#_select_confirm()
    else
      return "\<CR>"
    endif
  else
    let l:line   = getline('.')
    let l:col    = col('.')
    let l:currentChar  = l:line[l:col-2]
    let l:nextChar = l:line[l:col-1]
    let l:secondNextChar  = l:line[l:col]

    " Insert new indented line Inside,  {|}, (|), [|], <tag>|<tag>
    if l:currentChar ==# '>' && l:nextChar ==# '<' && l:secondNextChar ==# '/' ||
          \ l:currentChar ==# '{' && l:nextChar ==# '}' ||
          \ l:currentChar ==# '(' && l:nextChar ==# ')' ||
          \ l:currentChar ==# '[' && l:nextChar ==# ']'
      return "\<CR>\<C-o>==\<C-o>O"
  " Normal <CR> functionality
    else
      return "\<CR>"
    endif
  endif
endfunction

inoremap <silent><expr> <cr> <SID>Remap_CR_Key()

