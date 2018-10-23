# dotvim

A configuration for [Vim](https://www.vim.org/), [Neovim](https://neovim.io), and [MacVim](http://macvim-dev.github.io/macvim/).

## Setup

```bash
git clone https://github.com/alphabetum/dotvim.git ~/.vim
```
## Overview

- [`after/plugin/dotvim.vim`](after/plugin/dotvim.vim)
- [`gvimrc`](gvimrc)
- [`vimrc`](vimrc)

**[`config/bin`](config/bin)**

Executables for this configuration.

*[`config/bin/dotvim-setup`](config/bin/dotvim-setup)*

Creates symlinks in the home directory (`~/`) linking to the files in [`config/home`](config/home).

*[`config/bin/vim`](config/bin/vim)*

Wraps `vim` and `nvim`, using `nvim` when present and configured, and otherwise falls back to `vim`.
