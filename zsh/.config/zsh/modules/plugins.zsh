# History substring search
if zplug check zsh-users/zsh-history-substring-search; then
  bindkey "${key_info[Up]}" history-substring-search-up
  bindkey "${key_info[Down]}" history-substring-search-down
fi

# AutoSuggestions
if zplug check zsh-users/zsh-autosuggestions; then
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  bindkey "${key_info[Control]}N" autosuggest-accept
fi