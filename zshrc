setopt PROMPT_SUBST
autoload -U promptinit compinit zmv edit-command-line ssh-reagent

# Set up the prompt (Customized from Gary Bernhardts)
promptinit
prompt grb


# Appends each command to history immediately after executing
setopt inc_append_history

zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey -e

#Better completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'

# Setup aliases
source $HOME/.aliases

# Setup ZSH plugins
[[ `uname -a` =~ Ubuntu ]] && source /etc/zsh_command_not_found
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# Initialize rbenv if it's on the system
which rbenv > /dev/null && eval "$(rbenv init -)"
