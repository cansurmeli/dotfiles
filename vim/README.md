https://shapeshed.com/vim-packages/

# Vim Directory

This is just an informative file explaining what directory does what under my `~/.vim`.

## autoload

The location where `VimPlug` stores some stuff. Don't know anything more.

## backup

The central directory for Vim to store its backup files so that they don't get scattered around and mess up the projects.

## ftplugin

File type specific Vim configurations.

This is an extremely handy feature of Vim. With this way, file-specific stuff has each their own container and `.vimrc` doesn't get clutterd.

## pack

Vim started it's own plugin system with version 8. This is the location where it allows you to store the plugins whichever way you like.

Under the directory `pack`, there needs to be anotheer directory called `plugins`. After that, there should be two other directories, namely `start` & `after`:

- `start` is the location where the plugins are loaded with Vim during start-up,
- `after` is the location where Vim allows you to store plugins that are loaded upon request while inside Vim.

## plugged

The directory where `VimPlug` stores its data.

## plugin

During start-up, Vim sources any and all files in this directory. Therefore, this location can be used as a place to break apart the `.vimrc` and cease it becoming thick..

## skeletons

Where I store skeleton file structures for project initiations.

## swp

The central directory for Vim to store its swap files so that they don't get scattered around and mess up the projects.

## view

???
