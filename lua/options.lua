local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Global options
o.showmode      = true
o.showcmd       = true
o.cmdheight     = 1 --height of command bar
o.incsearch     = true
o.showmatch     = true
o.ignorecase    = true --ignore case of searches
o.smartcase     = true
o.hidden        = true
o.cursorline    = true
o.splitright    = true
o.splitbelow    = true
o.hlsearch      = true
o.scrolloff     = 10 --how many lines below cursor
o.showbreak     = string.rep(' ',3)
o.clipboard = 'unnamedplus'
o.swapfile = false
o.mouse = 'n' --don't show beginbot this
o.joinspaces = true
o.syntax = 'on'

-- Window-local options
wo.number 	= true
wo.wrap         = true
wo.linebreak	 = true
wo.breakindent   = true

-- Buffer-local options
bo.autoindent    = true
bo.cindent       = true
bo.textwidth = 79

-- Tabs
bo.tabstop       = 4
bo.shiftwidth    = 4
bo.softtabstop   = 4
bo.expandtab     = true

