Configuration Files
===================

My custom config files and rcs.

Installation
------------

Inside the repository you can run `install` to place the configs in `~`.
This will symlink them from the repository, so you can easily update with `git
pull`.

This also does some basic setup that you may or may not want, ie `bics` and
`vim-plug` are setup, as well some defaults for Mac OS X or Linux.

# to install package list

```bash
repo url github.com/back3r/dotfiles
sudo pacman -S --needed --noconfirm $(grep -vE '^\s*#' pkglist.txt | tr '\n' ' ')
```
```
