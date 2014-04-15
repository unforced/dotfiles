sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y ruby git tmux vim zsh curl

git clone git://github.com/sstephenson/rbenv ~/.rbenv
git clone git://github.com/sstephenson/ruby-build ~/.rbenv/plugins/ruby-build

# rbenv dependencies
sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev
