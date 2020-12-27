let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

function! s:Remap_TAB_Key()
  " Select from menu, expand if it's a snippet
  if pumvisible()
    if PluginExist("coc.nvim")
      return coc#_select_confirm()
    else
      return "\<C-y>"
    endif
  " Try to expand or jump a snippet
  elseif coc#expandableOrJumpable()
      return coc#rpc#request('doKeymap', ['snippets-expand-jump',''])
  " Normal <TAB> functionality
  else
    return "\<TAB>"
  endif
endfunction

inoremap <silent><expr> <tab> <SID>Remap_TAB_Key()
