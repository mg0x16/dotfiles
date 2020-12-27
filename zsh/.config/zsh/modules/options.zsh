autoload -U zmv

# ===== Basics
setopt no_beep                  # donot beep on error
setopt interactive_comments     # Enable comments in interactive shell.
unsetopt clobber                # Do not overwrite existing files with > and >>.  Use >! and >>! to bypass.

# ===== Changing Directories
setopt auto_cd                  # Auto changes to a directory without typing cd.

# ===== Expansion and Globbing
setopt extended_glob            # Use extended globbing syntax.

# ===== Printing
setopt brace_ccl                # Allow brace character class list expansion, echo {abc.}file
setopt combining_chars          # Combine zero-length punctuation characters (accents) with the base character
setopt rc_quotes                # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.

# ===== Jobs
setopt long_list_jobs           # List jobs in the long format by default.
setopt auto_resume              # Resume existing job from background before creating a new process by typing its name
setopt notify                   # Report status of background jobs immediately
unsetopt bg_nice                # Do not run all background jobs at a lower priority
unsetopt hup                    # Do not kill jobs on shell exit

# ===== Prompt
setopt prompt_subst             # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt        # only show the rprompt on the current prompt

# ===== Termcap (add colors to less)
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export LESS="--raw-control-chars"

# ===== Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set cursor shape to vertical beam
echo -e -n "\x1b[\x36 q"
