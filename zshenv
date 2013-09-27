export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes # https://github.com/robbyrussell/oh-my-zsh/issues/1433

# Set up the functions for some custom things
fpath=($fpath ~/.zsh/func ~/.zsh/zsh-completions/src)
typeset -U fpath

# Set up my path. Explicitly set it all so I know exactly what's going on and
# there aren't problems with embedded sessions.
path=(
  $HOME/bin
  $HOME/.rbenv/bin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/local/sbin
  /usr/sbin
  /sbin
)
export PATH
typeset -U path



# For Go development
export GOPATH=$HOME/go

# Lots of history
export HISTFILE=~/.history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# Other miscellaneous ENV variables
export PAGER='less -FSRX'
export TERM='xterm-256color'
export EDITOR='vim'
