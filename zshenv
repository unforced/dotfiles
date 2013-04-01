export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes #Fixes weird bug with history-substring-search
fpath=($fpath ~/.zsh/func ~/.zsh/zsh-completions/src)
typeset -U fpath
export PATH=/usr/local/bin:/bin:/usr/bin:$HOME/bin:$PATH:$HOME/.rvm/bin:$HOME/android-sdk/tools:$HOME/android-sdk/platform-tools
export rvm_path=~/.rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
