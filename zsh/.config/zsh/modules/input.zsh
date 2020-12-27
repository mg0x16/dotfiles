# Treat these characters as part of a word.
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

zmodload zsh/terminfo
zmodload zsh/zle

autoload -Uz edit-command-line
zle -N edit-command-line

typeset -gA key_info
key_info=(
  'Control'         '\C-'
  'Control+Left'    '\e[1;5D \e[5D \e\e[D \eOd'
  'Control+Right'   '\e[1;5C \e[5C \e\e[C \eOc'
  'ControlPageUp'   '\e[5;5~'
  'ControlPageDown' '\e[6;5~'
  'Escape'          '\e'
  'Meta'            '\M-'
  'Backspace'       "^?"
  'Delete'          "^[[3~"
  'F1'              "${terminfo[kf1]}"
  'F2'              "${terminfo[kf2]}"
  'F3'              "${terminfo[kf3]}"
  'F4'              "${terminfo[kf4]}"
  'F5'              "${terminfo[kf5]}"
  'F6'              "${terminfo[kf6]}"
  'F7'              "${terminfo[kf7]}"
  'F8'              "${terminfo[kf8]}"
  'F9'              "${terminfo[kf9]}"
  'F10'             "${terminfo[kf10]}"
  'F11'             "${terminfo[kf11]}"
  'F12'             "${terminfo[kf12]}"
  'Insert'          "${terminfo[kich1]}"
  'Home'            "${terminfo[khome]}"
  'End'             "${terminfo[kend]}"
  'PageUp'          "${terminfo[kpp]}"
  'PageDown'        "${terminfo[knp]}"
  'Up'              "${terminfo[kcuu1]}"
  'Left'            "${terminfo[kcub1]}"
  'Down'            "${terminfo[kcud1]}"
  'Right'           "${terminfo[kcuf1]}"
  'BackTab'         "${terminfo[kcbt]}"
)

# Print out the mappings for all of the keymaps.
function bindkey-all {
  local keymap=''
  for keymap in $(bindkey -l); do
    [[ "$#" -eq 0 ]] && printf "#### %s\n" "${keymap}" 1>&2
    bindkey -M "${keymap}" "$@"
  done
}

# Enables terminal application mode
function zle-line-init() {
  if (( ${+terminfo[smkx]} )); then
    echoti smkx
  fi
}
zle -N zle-line-init

# Disables terminal application mode
function zle-line-finish() {
  if (( ${+terminfo[rmkx]} )); then
    echoti rmkx
  fi
}
zle -N zle-line-finish

# Expand aliases
function glob-alias {
  zle _expand_alias
  zle expand-word
  zle magic-space
}
zle -N glob-alias

# Up (cd ..)
function cd-up() {
  local last=$(dirs | awk '{print $1}')
  if [ $last = '/' ];then
    return
  fi

  pushd .. > /dev/null

  zle reset-prompt
}
zle -N cd-up

# Back (cd -)
function cd-back() {
  popd -q &> /dev/null

  zle reset-prompt
}
zle -N cd-back

# Unbound keys insert a tilde, diable them
function _zle-noop {  ; }
zle -N _zle-noop

local -a unbound_keys
unbound_keys=(
  "${key_info[F1]}"
  "${key_info[F2]}"
  "${key_info[F3]}"
  "${key_info[F4]}"
  "${key_info[F5]}"
  "${key_info[F6]}"
  "${key_info[F7]}"
  "${key_info[F8]}"
  "${key_info[F9]}"
  "${key_info[F10]}"
  "${key_info[F11]}"
  "${key_info[F12]}"
  "${key_info[PageUp]}"
  "${key_info[PageDown]}"
  "${key_info[ControlPageUp]}"
  "${key_info[ControlPageDown]}"
  "${key_info[Insert]}"
)
for keymap in $unbound_keys; do
  bindkey -M emacs "${keymap}" _zle-noop
done

# Set default mode
bindkey -d

# Ctrl+Left and Ctrl+Right bindings to forward/backward word
for key in "${(s: :)key_info[Control+Left]}"
  bindkey -M emacs "$key" backward-word
for key in "${(s: :)key_info[Control+Right]}"
  bindkey -M emacs "$key" forward-word

# Kill to the beginning of the line.
for key in "$key_info[Escape]"{K,k}
  bindkey -M emacs "$key" backward-kill-line

# Edit command in an external editor.
bindkey -M emacs "$key_info[Control]X$key_info[Control]E" edit-command-line

# Home, End
bindkey -M emacs "$key_info[Home]" beginning-of-line
bindkey -M emacs "$key_info[End]" end-of-line

# Delete character
bindkey -M emacs "$key_info[Delete]" delete-char
bindkey -M emacs "$key_info[Backspace]" backward-delete-char

# Move character
bindkey -M emacs "$key_info[Left]" backward-char
bindkey -M emacs "$key_info[Right]" forward-char

# Expand history on space.
bindkey -M emacs ' ' magic-space

# Clear screen.
bindkey -M emacs "$key_info[Control]L" clear-screen

# Duplicate the previous word.
for key in "$key_info[Escape]"{M,m}
  bindkey -M emacs "$key" copy-prev-shell-word

# Use a more flexible push-line.
for key in "$key_info[Escape]"{q,Q}
  bindkey -M emacs "$key" push-line-or-edit

# Bind Shift + Tab to go to the previous menu item.
bindkey -M emacs "$key_info[BackTab]" reverse-menu-complete

# Expand command name to full path.
for key in "$key_info[Escape]"{E,e}
  bindkey -M emacs "$key" expand-cmd-path

# control-space expands all aliases, including global
bindkey -M emacs "$key_info[Control] " glob-alias

# cd ..
bindkey -M emacs "${key_info[Control]}K" cd-up

# cd -
bindkey -M emacs "${key_info[Control]}J" cd-back

# Set Emacs mode
bindkey -e
