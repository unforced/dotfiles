setopt PROMPT_SUBST
autoload -U promptinit compinit zmv edit-command-line
promptinit
prompt grb

compinit -Cu

HISTFILE=~/.history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

export TERM='xterm-256color'
export EDITOR='vim'
set -o emacs

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

source $HOME/.aliases
[[ `uname -a` =~ Ubuntu ]] && source /etc/zsh_command_not_found
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

#Functions

ssh-reagent () {
  ssh-add -l &> /dev/null && return 0
  for agent in /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
      echo Found working SSH Agent:
      ssh-add -l
      return
    fi
  done
  echo "Cannot find ssh agent - maybe you should reconnect and forward it?"
}

which rbenv && eval "$(rbenv init -)"
