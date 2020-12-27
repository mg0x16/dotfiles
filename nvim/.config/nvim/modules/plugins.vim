scriptencoding utf-8

" Vim Commentary
if PluginExist("vim-commentary")
  augroup Vim_Commentary
    autocmd!
    autocmd FileType asm setlocal commentstring=;\ %s
    autocmd FileType json setlocal commentstring=//\ %s
  augroup END
endif

" Devi Icons
if PluginExist("vim-devicons")
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
endif

" NERDTree
if PluginExist("nerdtree")
  let NERDTreeQuitOnOpen = 1
  let NERDTreeMinimalUI = 1
  let NERDTreeAutoDeleteBuffer = 1
endif

" Vim Closetag
if PluginExist("vim-closetag")
  let g:closetag_filenames = '*.html,*.xml,*.js,*.md'
endif

" Far
if PluginExist("far.vim")
  let g:far#source = 'vimgrep'
endif

" Easy Motion
if PluginExist("vim-easymotion")
  let g:EasyMotion_smartcase = 1
endif

" Buftabline
if PluginExist("vim-buftabline")
  let g:buftabline_indicators = 1
  hi default link BufTabLineCurrent PmenuSel
  hi default link BufTabLineActive  TabLineSel
  hi default link BufTabLineHidden  TabLine
  hi default link BufTabLineFill    TabLineFill
endif

" Smart Pairs
if PluginExist("smartpairs.vim")
  let g:smartpairs_start_from_word = 1
endif

" Git Gutter
if PluginExist("vim-gitgutter")
  hi GitGutterAdd    guifg=#009900 guibg=#232526 ctermfg=2 ctermbg=236
  hi GitGutterChange guifg=#bbbb00 guibg=#232526 ctermfg=3 ctermbg=236
  hi GitGutterDelete guifg=#ff2222 guibg=#232526 ctermfg=1 ctermbg=236
endif

" Syntax
let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_colorful_config = 1

