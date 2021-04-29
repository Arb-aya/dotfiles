local nvim_lsp = require'lspconfig'

local custom_lsp_attach = function(client)
    vim.api.nvim_buf_set_option(0,'omnifunc','v:lua.vim.lsp.omnifunc')

    vim.api.nvim_buf_set_keymap(0,'n','K','<cmd>lua vim.lsp.buf.hover()<cr>',{noremap = true})

    vim.api.nvim_buf_set_keymap(0,'n','<leader>rn','<cmd>lua vim.lsp.buf.rename()<cr>',{noremap = true})

    vim.api.nvim_buf_set_keymap(0,'n','<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>',{noremap = true})

    vim.api.nvim_buf_set_keymap(0,'n','<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>',{noremap = true})

    vim.api.nvim_buf_set_keymap(0,'n','<leader>q','<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>',{noremap = true})

    vim.api.nvim_buf_set_keymap(0,'n','<leader>g0','<cmd>lua vim.lsp.buf.document_symbol()<cr>',{noremap = true})

    vim.api.nvim_buf_set_keymap(0,'n','<leader>g1','<cmd>lua vim.lsp.buf.workspace_symbol()<cr>',{noremap = true})

    vim.api.nvim_buf_set_keymap(0,'n','<leader>fc','<cmd>lua vim.lsp.buf.formatting()<cr>',{noremap = true})

    vim.api.nvim_buf_set_keymap(0,'n','<leader>ca','<cmd>lua vim.lsp.buf.code_action()<cr>',{noremap = true})
end


local default_config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true;
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    }
    return {
        capabilities = capabilities,
        on_attach = custom_lsp_attach,
    }
end

-- https://github.com/kabouzeid/nvim-lspinstall
local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _,server in pairs(servers) do
        local config = default_config()
        require'lspconfig'[server].setup(config)
    end
end

setup_servers()

require'lspinstall'.post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e")
end
