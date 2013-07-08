export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes #Fixes weird bug with history-substring-search
fpath=($fpath ~/.zsh/func ~/.zsh/zsh-completions/src)
typeset -U fpath
NEWPATH=$HOME/bin:$HOME/.rbenv/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin
# Prevent the path from blowing up when sessions are embedded(tmux)
if [[ ! ($PATH =~ $NEWPATH) ]]; then
  export PATH=$NEWPATH:$PATH
fi
export GOPATH=$HOME/go
