HISTFILE="$ZSH_CACHE_DIR/history"

HISTSIZE=100000
SAVEHIST=100000
HISTCONTROL=ignoredups

setopt bang_hist                 # Treat the '!' character specially during expansion
setopt extended_history          # Write the history file in the ":start:elapsed;command" format
setopt inc_append_history        # Write to the history file immediately, not when the shell exits
setopt share_history             # Share history between all sessions
setopt hist_expire_dups_first    # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups          # Do not record an entry that was just recorded
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate
setopt hist_ignore_space         # Do not record an entry starting with a space
setopt hist_save_no_dups         # Do not write duplicate entries in the history file
setopt hist_verify               # Do not execute upon history expansion instead, perform history expansion and reload the line into the editing buffer
setopt hist_beep                 # Beep when accessing nonexistent history
setopt hist_find_no_dups         # When searching history do not display results already cycled through twice
setopt hist_reduce_blanks        # Remove extra blanks from each command line being added to history

# Lists the 10 most used commands
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"