function! PluginExist(pluginName)
  if !empty(glob(expand(stdpath("data")."/plugged/".a:pluginName)))
    return 1
  endif

  return 0
endfunction
