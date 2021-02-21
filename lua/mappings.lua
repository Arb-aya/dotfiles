local map = vim.api.nvim_set_keymap

-- space to toggle relative line numbers
map('n','<space>',':set invrelativenumber<cr>',{noremap=true,silent=true})

-- ,, to save
map('n',',,','<esc>:w!<cr>',{noremap=true,silent=true}) 

-- jk to exit insert mode 
map('i', 'jk', '<esc>', {noremap=true})

-- Navigate splits
map('n', '<C-J>', '<C-W><C-J>', {noremap=true})
map('n', '<C-K>', '<C-W><C-K>', {noremap=true})
map('n', '<C-L>', '<C-W><C-L>', {noremap=true})
map('n', '<C-H>', '<C-W><C-H>', {noremap=true})


-- Tabularize
map('n', '<leader>a=', ':Tabularize /=<cr>', {noremap = true})
map('v', '<leader>a=', ':Tabularize /=<cr>', {noremap = true})
map('n', '<leader>a:', ':Tabularize /:\zs<cr>', {noremap = true})
map('v', '<leader>a:', ':Tabularize /:\zs<cr>', {noremap = true})
