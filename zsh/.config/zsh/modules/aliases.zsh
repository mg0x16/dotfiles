# Listing Files
case `uname` in
  Darwin)
    alias ls="ls -hG"
  ;;
  Linux)
    alias ls="ls -h --color"
  ;;
esac
alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias mkdir="mkdir -p"

if (( $+commands[lsd] )); then
  alias ls="lsd"
  alias l="ls"
  alias la="ls -a"
  alias ll="ls -l"
  alias lt="ls --tree"
  alias lla="ls -la"
fi

# Resources Management
alias df='df -kh'
alias du='du -kh'

# Grep
alias grep="grep --color -i"
alias -g gp='| grep'

# cat (viewing files)
if (( $+commands[bat] )); then
  alias cat="bat"
fi

# Package Manager
if (( $+commands[pacman] )); then
  alias pac="sudo pacman"

  alias paci="pac -S"              # Install package
  alias pacu="pac -Syu"            # Install, sync, and upgrade packages and refresh package lists
  alias pacr="sudo pacman -Rns"    # Remove package, unneeded dependencies, and configuration files
  alias pacc="sudo pacman -Scc"    # Clean cache
  alias pacq="pacman -Qi"          # Query package information from the local repository
  alias pacQ="pacman -Si"          # Query package information from the remote repository
  alias pacs="pacman -Qs"          # Search for the package in the local repository
  alias pacS="pacman -Ss"          # Search for package in the remote repository
  alias pacfiles="pacman -Ql"      # List all files that belong to a package
  alias pacblame="pacman -Qo"      # Show package(s) owning the specified file
  alias paclo="pacman -Qtdq"       # list orphan packages
  alias pacro="pac -Rns \$(pacman -Qtdq)" # remove orphan packages
fi

# React Native
if (( ${+commands[react-native]} )); then
  alias rn='react-native'
  alias rns='react-native start'
  alias rnlink='react-native link'
  alias rnand='react-native run-android'
  alias rnios='react-native run-ios'
fi

# kitty terminal add-ons commands
if (( $+commands[kitty] )); then
  alias icat="kitty +kitten icat"
  alias diff="kitty +kitten diff"
fi

# Vim
alias v=nvim
