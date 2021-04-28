local bind = vim.api.nvim_set_keymap

require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitGutterAdd'   , text = '│', numhl='GitGutterAddNr'   , linehl='GitGutterAddLn'},
        change       = {hl = 'GitGutterChange', text = '│', numhl='GitGutterChangeNr', linehl='GitGutterChangeLn'},
        delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitGutterDeleteNr', linehl='GitGutterDeleteLn'},
        topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitGutterDeleteNr', linehl='GitGutterDeleteLn'},
        changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChangeNr', linehl='GitGutterChangeLn'},
    },
    numhl = false,
    linehl = false,
    watch_index = {
        interval = 1000
    },
    current_line_blame = false,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    use_decoration_api = true,
}

--vim.api.nvim_exec([[
--highlight GitGutterAdd    guifg=#009900 ctermfg=2
--highlight GitGutterChange guifg=#bbbb00 ctermfg=3
--highlight GitGutterDelete guifg=#ff2222 ctermfg=1
--]], false)

-- -- Default keymap options
local opts = { noremap = true }

bind('n', '<leader>ghs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', opts)
bind('n', '<leader>ghu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', opts)
bind('n', '<leader>ghr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', opts)
bind('n', '<leader>ghv', '<cmd>lua require"gitsigns".preview_hunk()<CR>', opts)
bind('n', '<leader>ghb', '<cmd>lua require"gitsigns".blame_line()<CR>', opts)
