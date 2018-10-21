# dotvim

A vim configuration.

## Setup

```bash
git clone https://github.com/alphabetum/dotvim.git ~/.vim && ~/.vim/config/bin/dotvim-setup
```

## [`config/home`](config/home)

Configuration files to be linked to from the home directory.

## [`config/bin`](config/bin)

### [`config/bin/vim`](config/bin/vim)

[`config/bin/vim`](config/bin/vim) wraps `vim` and `nvim`, using `nvim` when present and configured, and otherwise falls back to `vim.`

## Janus

This configuration uses [Janus](https://github.com/carlhuda/janus), a distribution of plug-ins and mappings for Vim, Gvim and MacVim.

[`janus`](janus), which links to [`vendor/github.com/carlhuda/janus/janus`](vendor/github.com/carlhuda/janus/janus), is the primary directory for the Janus distribution.

The Janus submodule contains plugins as submodules, which need to be loaded and updated either manually or using the `rake` command.

~/.janus is a [pathogen](https://github.com/tpope/vim-pathogen) directory.

## Neovim

[Neovim](https://neovim.io) is a fork of vim focused on extensibility and agility.

[`home/.config/nvim`](../.config/nvim) is Neovim's configuration location. In this configuration, it links to `~/.vim`. [`init.vim`](init.vim) is the Neovim equivalent of [`.vimrc`](config/home/.vimrc), which is linked as `init.vim` in `~/.vim` to make it available to Neovim.

More information:
*[Transitioning from Vim \[to Neovim\] (neovim.io)](https://neovim.io/doc/user/nvim_from_vim.html)*

## TODO

### Perfomance Issues

Startup is slow, particularly with markdown files. To log startup timing:

```bash
vim --startuptime vim-startup.log test.md
```

Identified slow-loading files:

- `vim-bufkill/plugin/bufkill.vim`
- `vim-airline/autoload/airline/extensions/default.vim`
- `/usr/local/Cellar/neovim/0.1.7/share/nvim/runtime/syntax/markdown.vim`
- `neomake/autoload/neomake.vim`
