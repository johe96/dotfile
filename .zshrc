# Environment variables
export PATH="$HOME/bin:$PATH"

#Before building and running the model viewer, the environment variable MODEL_VIEWER_ROOT must be set to point to the directory of this README.md file. Example:
export MODEL_VIEWER_ROOT="$HOME/gltf_viewer"

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Terminal colors
export TERM=xterm-256color

# Added homebrew to PATH and all packages
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Go binaries
export GOROOT=/usr/local/go-1.23.1
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Node.js + npm manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Node can now ignore tsc errors and run typescript files natively
export NODE_OPTIONS="--disable-warning=ExperimentalWarning"


# Language export
# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Shell integration
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"

# Set the directory of we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::ubuntu
zinit snippet OMZP::command-not-found

# Load autocompletions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
# Original Ctrl-based keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# New Alt-based keybindings
bindkey '\ep' history-search-backward
bindkey '\en' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

alias clipboard='xclip -sel clip'

alias py='python3'

fcd(){
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

fopen(){
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && nvim "$file"
}

copy_stdout() {
  "$@" | xclip -selection clipboard
}

copy_stderr() {
  "$@" 2>&1 1>/dev/null | xclip -selection clipboard
}

copy_all() {
  "$@" &> >(xclip -selection clipboard)
}

# oh-my-posh path
export PATH=$PATH:/home/johe/.local/bin
# Prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
# catppuccin_macchiato
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/catppuccin_macchiato.omp.json)"

# study stream aliases
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro


# bun completions
[ -s "/home/johe/.bun/_bun" ] && source "/home/johe/.bun/_bun"

# haskell completions
[ -f "/home/johe/.ghcup/env" ] && . "/home/johe/.ghcup/env" # ghcup-env

# Autocomplete GHC commands
# _ghc() {
#     local envs
#     envs=$(ghc --show-options)  # Retrieve GHC options
#     local cur="${words[CURRENT]}"  # Get the current word being completed
#
#     # Generate completions from the retrieved options
#     compadd $envs
# }

# Register the completion function for ghc
# compdef _ghc ghc

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"
pomo_options["test"]="0.05"

pomodoro(){
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
    val=$1
    echo $val | lolcat
    timer ${pomo_options["$val"]}m
    spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
alias te="pomodoro 'test'"
