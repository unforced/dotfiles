# Dotfiles

These are my personal dotfiles. They are primarily designed to work on Linux
(specifically Ubuntu) systems, but they're pretty portable and I've frequently
used them on CentOS and OSX systems.

Various parts stolen from [ted27/.files](https://github.com/ted27/.files) as
well as [sds/dot](https://github.com/sds/dot).

## Requirements

To install the dotfiles, your system needs the following:

* Ruby 1.9+
* Zsh
* Git 1.8+
* vim 7.3+

The configuration files I have works with the above required programs/versions
as well as the below listed ones which are not required for installation.

* Tmux 1.8+
* Ag or Ack
* For some vim plugins, vim compiled with ruby/python support is required

## Installation

Clone the repo

```
git clone git://github.com/Aaronneyer/dotfiles
```

Install. You will need ruby and vim on your system for this to work.

```
cd dotfiles
./bootstrap.rb
```

Remove anything specific to me. This will specifically be things in gitconfig
and sshconfig, but there are lot's of other configurations which will probably
not fit your use case.
