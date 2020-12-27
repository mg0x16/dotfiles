autoload -Uz vcs_info

__prompt_component_git_init() {
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' use-simple true

  # only export two msg variables from vcs_info
  zstyle ':vcs_info:*' max-exports 2

  # export branch (%b) and git toplevel (%R)
  zstyle ':vcs_info:git*' formats '%b' '%R'
  zstyle ':vcs_info:git*' actionformats '%b|%a' '%R'
}

__prompt_component_git_preexec() {
  __prompt_component_git_value=""
}

__prompt_component_git_async_run() {
  setopt localoptions noshwordsplit
  builtin cd -q $1 2>/dev/null

  vcs_info
  [[ -n $vcs_info_msg_0_ ]] || return

  git diff --quiet
  local isDirty=$?

  git diff --staged --quiet
  local isStaged=$?

  git status --porcelain | grep "??" &> /dev/null
  local isUntracked=$?

  if [ $isDirty -eq 0 ] && [ $isStaged -eq 0 ] && [ ! $isUntracked -eq 0 ]; then
    echo "%B%F{green}[שׂ $vcs_info_msg_0_]%f%b"
  elif [ $isDirty -eq 0 ] && [ ! $isUntracked -eq 0 ]; then
    echo "%B%F{yellow}[שׂ $vcs_info_msg_0_]%f%b"
  else
    echo "%B%F{red}[שׂ $vcs_info_msg_0_]%f%b"
  fi
}

__prompt_component_git_async_callback() {
    __prompt_component_git_value="$1"
}

__prompt_component_git_render() {
  setopt localoptions noshwordsplit
  builtin cd -q $(pwd) 2>/dev/null

  vcs_info

  if [[ -n "$__prompt_component_git_value" ]]; then
    echo -n "$__prompt_component_git_value "
  elif [[ -n $vcs_info_msg_0_ ]]; then
    echo -n "%F{242}[שׂ ${vcs_info_msg_0_}]%f "
  else
    echo -n ''
  fi
}

