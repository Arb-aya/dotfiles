local map = vim.api.nvim_set_keymap

-- space to toggle relative line numbers
map('n','<space>',':set invrelativenumber<cr>',{noremap=true,silent=true})

-- ,, to save
map('n',',,','<esc>:w!<cr>',{noremap=true,silent=true})

-- jk to exit insert mode
map('i', 'jk', '<esc>', {noremap=true})

-- Navigate splits
--map('n', '<C-J>', '<C-W><C-J>', {noremap=true})
--map('n', '<C-K>', '<C-W><C-K>', {noremap=true})
--map('n', '<C-L>', '<C-W><C-L>', {noremap=true})
--map('n', '<C-H>', '<C-W><C-H>', {noremap=true})


-- Tabularize
map('n', '<leader>a=', ':Tabularize /=<cr>', {noremap = true})
map('v', '<leader>a=', ':Tabularize /=<cr>', {noremap = true})
map('n', '<leader>a:', ':Tabularize /:\z<cr>', {noremap = true})
map('v', '<leader>a:', ':Tabularize /:\z<cr>', {noremap = true})

--
-- compe
--
-- I'm sure I can do more with this plugin, learn what you can do foo'
require'compe'.setup({
    enabled = true,
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,
        ultisnips=true,
    },
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end


map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Might as well use the arrow keys for something...
vim.g.UltiSnipsExpandTrigger="<UP>"

--
-- Telescope
--
map('n','<leader>ff','<cmd>Telescope find_files<cr>',{noremap=true,silent=true})
map('n','<leader>fg','<cmd>Telescope live_grep<cr>',{noremap=true,silent=true})
map('n','<leader>fb','<cmd>Telescope buffers<cr>',{noremap=true,silent=true})
map('n','<leader>fh','<cmd>Telescope help_tags<cr>',{noremap=true,silent=true})

