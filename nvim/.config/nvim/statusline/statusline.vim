scriptencoding utf-8

let s:default_fg = '#ffffff'
let s:default_bg = '#455354'

let s:default_inactive_fg = '#666666'
let s:default_inactive_bg = '#000000'

exe 'hi! HelpColor gui=bold guifg=#ffffff guibg=#009688'
exe 'hi! FixColor gui=bold guifg=#ffffff guibg=#c62828'
exe 'hi! ScratchColor gui=bold guifg=#ffffff guibg=#009688'

augroup status
  autocmd!
  autocmd VimEnter,VimLeave,WinEnter,WinLeave,BufWinEnter,BufWinLeave * : call <SID>RefreshStatusLine()
  autocmd VimEnter,VimLeave,WinEnter,WinLeave,BufWinEnter,BufWinLeave * : call <SID>CreateColor({ 'name': "InActiveComponent", 'fg':  s:default_inactive_fg, 'bg': s:default_inactive_bg }, 0)
augroup END

function! s:RefreshStatusLine()
  set noshowmode
  for l:nr in range(1, winnr('$'))
    call setwinvar(l:nr, '&statusline', '%!CreateStatusLine('.l:nr.')')
  endfor
endfunction

function! CreateStatusLine(winnum)
  let l:bufnum = winbufnr(a:winnum)
  let l:buftype = getbufvar(l:bufnum, '&buftype')
  let l:is_active = a:winnum == winnr()
  let l:statusline = ''
  let l:components = s:statusline_components

  if l:buftype ==# 'help'
    let l:components = s:statusline_help_components
  elseif l:buftype ==# 'quickfix'
    let l:components = s:statusline_fix_components
  elseif l:buftype ==# 'nofile' || l:buftype ==# 'nowrite'
    let l:components = s:statusline_scratch_components
  endif

  for i in range(len(l:components))
    let currentComponent = l:components[i]

    let l:Component = function('components#'.currentComponent['name'])
    let l:statusline .= s:CreateComponent(l:is_active,
                  \ s:CreateColor(currentComponent, l:bufnum),
                  \ l:Component(currentComponent, l:bufnum),
                  \ currentComponent)
  endfor

  return l:statusline
endfunction

function! s:CreateComponent(is_active, color_name, content, component)
  let l:color = a:is_active ? a:color_name : 'InActiveComponentColor'
  let l:margin = !empty(a:content) ? ' ' : ''
  let l:isMarginRight = get(a:component, 'mr', 1)
  let l:isMarginLeft = get(a:component, 'ml', 1)
  let l:marginRight = l:isMarginRight ? l:margin : ''
  let l:marginLeft = l:isMarginLeft ? l:margin : ''

  return '%#'.l:color.'#'.l:marginLeft.a:content.l:marginRight.'%*'
endfunction

function! s:CreateColor(component, bufnum)
  let l:fg = get(a:component, 'fg', s:default_fg)
  let l:bg = get(a:component, 'bg', s:default_bg)
  let l:name = a:component['name']
  let l:color_name = a:component['name'].'Color'

  exe 'hi! '.l:color_name.' gui=bold guifg='.l:fg.' guibg='.l:bg

  if has_key(a:component, 'modes')
    for mode in a:component.modes
      let l:mode_color_name = l:color_name.'Mode'.mode['name']
      let l:mode_fg = get(mode, 'fg', l:fg)
      let l:mode_bg = get(mode, 'bg', l:bg)

      exe 'hi! '.l:mode_color_name.' gui=bold guifg='.l:mode_fg.' guibg='.l:mode_bg
    endfor
  endif

  let l:ComponentColorName = 'components#'.a:component['name'].'Color'
  let l:ComponentColor = function(l:ComponentColorName)

  if (exists('*'.l:ComponentColorName))
    return l:ComponentColor(a:bufnum)
  else
    return l:color_name
  endif
endfunction

let s:statusline_help_components = [
  \ { 'name': 'Text', 'content': ' HELP', 'bg': '#009688' },
  \ { 'name': 'RightSide' },
\]

let s:statusline_fix_components = [
  \ { 'name': 'Text', 'content': ' FixList', 'bg': '#c62828' },
  \ { 'name': 'RightSide' },
\]

let s:statusline_scratch_components = [
  \ { 'name': 'Text', 'id': 'Scratch', 'content': 'Scratch', 'bg': '#009688' },
  \ { 'name': 'RightSide' },
\]

let s:statusline_components = [
  \ { 'name': 'ModeType', 'modes': [
      \ { 'name': 'Insert', 'fg': '#1565c0', 'bg': '#ffffff' },
      \ { 'name': 'Normal', 'fg': '#004D40', 'bg': '#4CAF50' },
      \ { 'name': 'Replace', 'bg': '#e53935' },
      \ { 'name': 'Visual', 'fg': '#b71c1c', 'bg': '#EF6C00' },
      \ { 'name': 'Other', 'bg': '#666666' }
    \ ]
  \ },
  \ { 'name': 'ReadOnly', 'bg': '#1565c0', "mr": 0 },
  \ { 'name': 'Session', 'bg': '#1565c0', "ml": 0, "mr": 0 },
  \ { 'name': 'FileName', 'bg': '#1565c0' },
  \ { 'name': 'FileModified', 'bg': '#1565c0', "ml": 0, 'modes':[
      \ { 'name': 'Dirty', 'fg': '#ff0000' },
      \ { 'name': 'Clean', 'fg': '#00ff00' }
    \ ]
  \ },
  \ { 'name': 'Git', 'bg': '#bf360c' },
  \ { 'name': 'RightSide' },
  \ { 'name': 'Linting', 'modes': [
      \ { 'name': 'Dirty', 'bg': '#b71c1c' },
      \ { 'name': 'Clean', 'bg': '#1b5e20' }
    \ ] },
  \ { 'name': 'LinePercent', 'bg': '#607D8B' },
  \ { 'name': 'FileType', 'bg': '#00695c' },
\]
