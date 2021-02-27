
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    use {'wbthomason/packer.nvim', opt = true}

    use {
	'nvim-telescope/telescope.nvim',
	requires =
		{
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		}
	}

    use 'hrsh7th/nvim-compe' -- autocomplete

    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'

    use 'neovim/nvim-lspconfig'

    use 'bronson/vim-trailing-whitespace'

    use 'machakann/vim-highlightedyank'

    use 'justinmk/vim-dirvish'

    use 'tpope/vim-surround'

    use 'tpope/vim-repeat'

    use 'morhetz/gruvbox'

    use 'frazrepo/vim-rainbow'

    use 'godlygeek/tabular'

    use 'preservim/nerdcommenter'

end)
