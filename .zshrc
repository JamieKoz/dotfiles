# Set up the prompt


setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
export KEYTIMEOUT=1
export TERM=xterm-256color
setxkbmap -option caps:none

export VOLTA_HOME="$HOME/.volta/"
export PATH=$PATH:/usr/local/bin
export PATH="$VOLTA_HOME/bin:$PATH"
bindkey '^R' history-incremental-search-backward

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

eval "$(starship init zsh)"

[ -f "/home/jamie/.ghcup/env" ] && source "/home/jamie/.ghcup/env" # ghcup-env
export PATH=$HOME/.local/bin:$PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jamie/google-cloud-sdk/path.zsh.inc' ]; then . '/home/jamie/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jamie/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jamie/google-cloud-sdk/completion.zsh.inc'; fi
