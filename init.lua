-- All confiugration done in lua has been blatently stolen or bastardised from:
-- 1. tjdevries config manager https://github.com/tjdevries/config_manager
-- 2. the readme of the plugins listed in plugins.lua
-- 3. https://gitlab.com/famiu/dot-nvim

local cmd=vim.cmd
vim.g.mapleader = ","
vim.g.python3_host_prog="~/.pyenv/versions/neovim3/bin/python"

--require('arbaya.settings')
require('arbaya.keybindings')
require('arbaya.options')
require('arbaya.plugins')
require('arbaya.config')
