# .vim

This is my `.vim` directory, containing all my configurations for `vim` and the
associated plugins I use.

This was forked from sds/.vim and then heavily modified for my own use.

This can be used by itself or along with the rest of my
[dotfiles](https://github.com/Aaronneyer/dotfiles).

## Installation

Clone the repository:

    git clone git://github.com/Aaronneyer/.vim.git ~/.vim

Add a symlink to `init.vim`...

    ln -s ~/.vim/init.vim ~/.vimrc

Alternatively, you can source it at the beginning of your current `.vimrc` if
you want to keep your current settings along with the ones defined in this
repository:

    source ~/.vim/init.vim

Finally, run the `update` script to get all the plugins:

    cd ~/.vim && ./update

You can run the `update` script at any time to fetch the latest changes from
each of the plugin repositories. If you have a lot of plugins and want to speed
this up, you could manually specify a revision of the plugin that you want, so
that it only updates when you change the revision.

## Configuration

Configuration files are broken up into various categories in the `plugin`
directory, including settings for individual plugins.

The `after`, `autoload`, `ftdetect`, `ftplugin`, and `indent` directories
act in the way `vim` normally uses them. To summarize:

* `after`: Initialization to run "after" `vim` has finished loading. Useful
  for defining shortcuts that override default key mappings.

* `autoload`: Contains scripts which are "lazy-loaded". For example, when
  calling `pathogen#infect()`, `vim` looks for the `infect` function in
  `autoload/pathogen.vim`.

* `ftdetect`: Any scripts that are used to determine the type of a file.

* `ftplugin`: Any plugins that are only run for a specific filetype. For
  example, if `vim` determines a file is of type `html`, it will run the
  commands found in `ftplugin/html.vim`.

* `indent`: The same as `ftplugin`, except specifically for setting up
  indent settings for specific filetypes.

## Managing Plugins

The `plugins.list` file contains the locations of the repositories for the
plugins. Plugins are stored in the `bundles` directory, which is read by
[Pathogen](http://www.vim.org/scripts/script.php?script_id=2332) to load
all the plugins.

To remove a plugin, simply remove it from `plugins.list` and run the
`update` script.

## License

[WTFPL](http://en.wikipedia.org/wiki/WTFPL)
