local nvim_lsp = require'lspconfig'
local on_attach = function(client,bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end


buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- LSP Key mappings
opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>fc', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Set up local language servers
-- npm i -g pyright
local servers = {"pyright", "tsserver", "html"}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach }
end


---- HTML server requires special configuration
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

--nvim_lsp.html.setup{
	--capabilities = capabilities
--}

nvim_lsp.tsserver.setup{
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {"javascript","javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typscript.tsx"},
    root_dir = nvim_lsp.util.root_pattern("package.json","tsconfig.json","jsconfig.json",".git"),
}

-- https://github.com/lukas-reineke/dotfiles/blob/master/vim/lua/lsp.lua
--

local format_options_prettier = {
	tabwidth = 4,
	singleQuote = true,
	trailingComma = "all",
	configPrecedence = "prefer-file"
}

vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_html = format_options_prettier

nvim_lsp.efm.setup({
    on_attach = on_attach,
    init_options = {
        documentFormatting =true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true,
    },
    filetypes = {
        "python",
        "html",
        "htmldjango",
        "javascript",
        "javascriptreact",
        "css",
        "scss"
    },
    settings = {
        rootMarkers = {
            ".prettier.json",
            ".git/",
            ".python-version",
        },
    },
})


