-- All confiugration done in lua has been blatently stolen or bastardised from:
-- 1. tjdevries config manager https://github.com/tjdevries/config_manager
-- 2. the readme of the plugins listed in plugins.lua

vim.g.mapleader = ","
vim.g.python3_host_prog="~/.pyenv/versions/neovim3/bin/python"

-- Need to set colorscheme before LSP stuff happens
vim.cmd('colo gruvbox')
vim.g.gruvbox_contrast_dark='hard'

require'options'
require'mappings'
require'plugins'
require'lsp'


