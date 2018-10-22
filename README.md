# dotvim

A configuration for [Vim](https://www.vim.org/) and [MacVim](http://macvim-dev.github.io/macvim/).

## Setup

```bash
git clone https://github.com/alphabetum/dotvim.git ~/.vim && ~/.vim/config/bin/dotvim-setup
```
## Overview

**[`config/home`](config/home)**

Configuration files to be linked to from the home directory.

**[`config/bin`](config/bin)**

Executables for this configuration.

[`config/bin/vim`](config/bin/vim) wraps `vim` and `nvim`, using `nvim` when present and configured, and otherwise falls back to `vim.`

### Neovim

[Neovim](https://neovim.io) is a fork of vim focused on extensibility and agility.

[`config/home/.config/nvim`](config/home/.config/nvim) is Neovim's configuration location. In this configuration, it links to `~/.vim`. `.config/nvm/init.vim` is Neovim's equivalent of [`.vimrc`](config/home/.vimrc), so it is linked at [`init.vim`](init.vim).

```
~/.config/nvim          -> dotvim/config/home/.config/nvim          -> dotvim
~/.config/nvim/init.vim -> dotvim/config/home/.config/nvim/init.vim -> dotvim/init.vim
```
