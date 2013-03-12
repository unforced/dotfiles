HISTFILE=~/.history
HISTSIZE=100000
SAVEHIST=$HISTSIZE


# Set up ssh-reagent to streamline timed-out sessions.
ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
      echo Found working SSH Agent:
      ssh-add -l
      return
    fi
 done
 echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

source $HOME/.aliases

TERM=xterm-256color
EDITOR=`which vim`
GIT_EDITOR=`which vim`
export TERM
export GIT_EDITOR

# Customize to your needs...
export PATH=/usr/local/bin:/bin:/usr/bin:$HOME/bin:$PATH

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias gd="git diff --color"
alias c="bundle exec rails console"
alias rake="bundle exec rake"
alias g10="git log --pretty --oneline --graph -10"
alias gr="git fetch && git rebase origin/master"
alias window="tmux rename-window"
alias vact=". ./venv/bin/activate"
unalias rm
unalias cp

setopt appendhistory
setopt autocd
unsetopt beep
unsetopt correct
unsetopt correctall
setopt extendedglob
setopt histignorealldups
setopt nomatch
setopt nonomatch
setopt sharehistory

unsetopt notify
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit -u

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
