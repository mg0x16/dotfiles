" Git Hunks (vim-gitgutter)
if PluginExist("vim-gitgutter")
  omap ih <Plug>GitGutterTextObjectInnerPending
  omap ah <Plug>GitGutterTextObjectOuterPending
  xmap ih <Plug>GitGutterTextObjectInnerVisual
  xmap ah <Plug>GitGutterTextObjectOuterVisual
endif
