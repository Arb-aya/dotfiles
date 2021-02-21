-- Taken from the packer.nvim readme.

vim.cmd [[packadd packer.nvim]] 

return require('packer').startup(function()
    
    use {'wbthomason/packer.nvim', opt = true}

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
