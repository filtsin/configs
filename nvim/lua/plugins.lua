return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use { 'kaicataldo/material.vim', branch = 'main' }
    use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'arkav/lualine-lsp-progress'

    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }

    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-lsputils'
    use 'onsails/lspkind-nvim'

    use { 'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

    use { 'francoiscabrol/ranger.vim', requires = {'rbgrouleff/bclose.vim'}}
    use 'airblade/vim-gitgutter'
    use 'numToStr/Comment.nvim'
    use 'andymass/vim-matchup'
    use 'folke/lsp-colors.nvim'

    use 'Chiel92/vim-autoformat'
    use 'tpope/vim-fugitive'

    use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }

    use 'lervag/vimtex'
    use { 'cespare/vim-toml', branch = 'main' }

    use { 'simrat39/rust-tools.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'}}

    use { 'hood/popui.nvim' }
end)
