vim.g.mapleader = ","

-- Is there a more lua-y way to do this?
vim.cmd('let g:python3_host_prog="~/.pyenv/versions/neovim3/bin/python"')

require('options')
require('mappings')
require('plugins')

-- Is there a more lua-y way to do this?
vim.cmd(':colo gruvbox')
vim.cmd('let g:gruvbox_contrast_dark="hard"')

