export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes #Fixes weird bug with history-substring-search
fpath=($fpath ~/.zsh/func ~/.zsh/zsh-completions/src)
typeset -U fpath

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

export GOPATH=$HOME/go
