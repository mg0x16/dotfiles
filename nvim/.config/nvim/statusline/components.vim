" Statusline Components
function! components#FileName(component, bufnum)
  return '' != '%t' ? '%t' : '[No Name]'
endfunction

function! components#Session(component, bufnum)
  if PluginExist('vim-obsession')
    return '%{ObsessionStatus(" ﬿", "")}'
  endif
  return ''
endfunction

function! components#FileType(component, bufnum)
  let l:filetype = getbufvar(a:bufnum, '&ft')
  return '' !=# l:filetype ? l:filetype : 'text'
endfunction

function! components#ReadOnly(component, bufnum)
  let readonly = getbufvar(a:bufnum, '&readonly')
  return readonly ? '' : ''
endfunction

function! components#LinePercent(component, bufnum)
  let l:v = (100 * line('.')) / line('$')
  return l:v.'%%(%L)'.''
endfunction

function! components#Linting(component, bufnum)
  if PluginExist('coc.nvim')
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '✔' | endif

    let msgs = []
    if get(info, 'error', 0)
      call add(msgs, '✘ ' . info['error'] . '')
    endif
    if get(info, 'warning', 0)
      call add(msgs, ' ' . info['warning'] . '')
    endif

    return join(msgs, ' ')
  endif

  return ''
endfunction
function! components#LintingColor(bufnum)
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return 'LintingColorModeClean' | endif
    return 'LintingColorModeDirty'
endfunction

function! components#FileModified(component, bufnum)
  return '●'
endfunction
function! components#FileModifiedColor(bufnum)
  let modified = getbufvar(a:bufnum, '&modified')
  return modified ? 'FileModifiedColorModeDirty' : 'FileModifiedColorModeClean'
endfunction

function! components#Git(component, bufnum)
  if exists('*fugitive#head')
    let branch = fugitive#head()
    if !empty(branch)
      let l:hunks_info = GitGutterGetHunkSummary()
      let l:a = l:hunks_info[0]
      let l:m = l:hunks_info[1]
      let l:d = l:hunks_info[2]
      return '+'.l:a.' ~'.l:m.' -'.l:d.' שׂ '.branch
    endif
  endif
  return ''
endfunction

function! components#ModeType(component, bufnum)
  let l:modes_labels = {
    \ 'n': 'N',
    \ 'i': 'I',
    \ 'R': 'R',
    \ 'v': 'V',
    \ 'V': 'V-L',
    \ "\<C-v>": 'V-B',
    \ 'c': 'COMMAND',
    \ 's': 'SELECT',
    \ 'S': 'S-LINE',
    \ "\<C-s>": 'S-BLOCK',
    \ 't': 'TERMINAL'
  \}

  return get(l:modes_labels, mode(), '')
endfunction
function! components#ModeTypeColor(bufnum)
  let l:modes_colors = {
    \ 'n': 'Normal',
    \ 'i': 'Insert',
    \ 'R': 'Replace',
    \ 'v': 'Visual',
    \ 'V': 'Visual',
    \ "\<C-v>": 'Visual'
  \}

  let l:color_name = get(l:modes_colors, mode(), 'Other')
  return "ModeTypeColorMode".l:color_name
endfunction

function! components#Text(component, bufnum)
  return a:component['content']
endfunction

function! components#RightSide(component, bufnum)
  return '%='
endfunction
