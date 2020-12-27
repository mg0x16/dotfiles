# Init zPlug
export ZPLUG_HOME=$ZSH_CACHE_DIR/zplug
export ZPLUG_INIT=$ZPLUG_HOME/init.zsh

if [ ! -f $ZPLUG_INIT ]; then
  echo Downloading ZPlug...
  curl -fL --create-dirs "https://raw.githubusercontent.com/zplug/installer/master/installer.zsh" | zsh
  sleep 6
fi
source $ZPLUG_INIT

# Plugins
zplug "mafredri/zsh-async"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "soimort/you-get"
# For debugging
# zplug "paulmelnikow/zsh-startup-timer"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
