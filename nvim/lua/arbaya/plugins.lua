vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    use {'wbthomason/packer.nvim', opt = true}

    --Find what you need
    use {
	'nvim-telescope/telescope.nvim',
	requires =
		{
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		},
        filetypes = {'typescript', 'javascriptreact', 'typescriptreact', 'json', 'html', 'css', 'python'},
	}

    --Better syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter',
               run = function() vim.cmd [[TSUpdate]] end}

	   -- Generate documentation for function under cursor via <leader>d
    use { 'kkoomen/vim-doge',
    	   run = function() vim.cmd [[call doge#install()]] end
       }


   --Git signs in the gutter and hunk management in buffer
   use{
       'lewis6991/gitsigns.nvim',
       requires = {
           'nvim-lua/plenary.nvim'
       },
       config = function()
           require('gitsigns').setup({
               signs = {
                   add = {hl = 'GitGutterAdd', text="+"},
                   change = {hl = 'GitGutterChange', text="~"},
                   delete ={hl = 'GitGutterDelete', text="_+"},
                   topdelete = {hl = 'GitGutterDelete', text="‾"},
                   changedelete = {hl = 'GitGutterChange', text="~"},
               }
           })
       end
   }

    --Used for completion
    use 'hrsh7th/nvim-compe'
   -- Snippets
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    --LPS stuff. This means I can just say:
    --:LspInstall python/html/css/typescript
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'

    --Show indent levels on blank lines
    use {'lukas-reineke/indent-blankline.nvim',branch = 'lua'}


    use 'bronson/vim-trailing-whitespace'
    use 'machakann/vim-highlightedyank'

    --File traversal
    use 'justinmk/vim-dirvish'

    --The best
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    --colourscheme
    use 'sainnhe/edge'

    --matching brackets
    use 'frazrepo/vim-rainbow'

    --Make stuff look good
    use 'godlygeek/tabular'

    use 'preservim/nerdcommenter'

    --Highlight instances of token under cursor
    use 'yamatsum/nvim-cursorline'

    --Debugging
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'

    --Fancy windows for lsp information
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-lsputils'

    --Markdown preview
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end
    }

    --If I don't show off I'm using nvim in discord, who will know I am using nvim?
    use 'andweeb/presence.nvim'
end)
