# dotvim

A configuration for [Vim](https://www.vim.org/) and [MacVim](http://macvim-dev.github.io/macvim/).

## Setup

```bash
git clone https://github.com/alphabetum/dotvim.git ~/.vim && ~/.vim/config/bin/dotvim-setup
```

## [`config/home`](config/home)

Configuration files to be linked to from the home directory.

## [`config/bin`](config/bin)

### [`config/bin/vim`](config/bin/vim)

[`config/bin/vim`](config/bin/vim) wraps `vim` and `nvim`, using `nvim` when present and configured, and otherwise falls back to `vim.`

## Neovim

[Neovim](https://neovim.io) is a fork of vim focused on extensibility and agility.

[`home/.config/nvim`](../.config/nvim) is Neovim's configuration location. In this configuration, it links to `~/.vim`. [`init.vim`](init.vim) is the Neovim equivalent of [`.vimrc`](config/home/.vimrc), which is linked as `init.vim` in `~/.vim` to make it available to Neovim.

More information:
*[Transitioning from Vim \[to Neovim\] (neovim.io)](https://neovim.io/doc/user/nvim_from_vim.html)*

