local map = vim.api.nvim_set_keymap

-- space to toggle relative line numbers
map('n','<space>',':set invrelativenumber<cr>',{noremap=true,silent=true})

-- ,, to save
map('n',',,','<esc>:w!<cr>',{noremap=true,silent=true})

-- jk to exit insert mode
map('i', 'jk', '<esc>', {noremap=true})

-- Tabularize
map('n', '<leader>a=', ':Tabularize /=<cr>', {noremap = true})
map('v', '<leader>a=', ':Tabularize /=<cr>', {noremap = true})
map('n', '<leader>a:', ':Tabularize /:\z<cr>', {noremap = true})
map('v', '<leader>a:', ':Tabularize /:\z<cr>', {noremap = true})
map('n', '<leader>a-', ':Tabularize /-<cr>', {noremap = true})
map('v', '<leader>a-', ':Tabularize /-<cr>', {noremap = true})

