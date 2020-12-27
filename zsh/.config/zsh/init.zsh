# Load custom functions
fpath=(${0:a:h}/functions $fpath)
autoload -Uz -- "${0:a:h}"/functions/[^_]*(:t)

# Load custon prompts
fpath=(${0:a:h}/prompts $fpath)

# Load custom completions
fpath=($fpath ${0:a:h}/completions)

# Create the cache folder
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir -p "$ZSH_CACHE_DIR"
fi

# Load Modules
modules_src=(
  'setup'
  'options'
  'input'
  'history'
  'completion'
  'plugins'
  "aliases"
  'envs'
)

for src in "${modules_src[@]}"; do
  source "${0:a:h}/modules/$src.zsh"
done

# init prompt
autoload -Uz promptinit; promptinit
prompt ultimate

