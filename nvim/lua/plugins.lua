local C = require('configs')

vim.g.mapleader = '\\'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'EdenEast/nightfox.nvim',
        priority = 1000,
        config = C.nightfox
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = C.lualine
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'andymass/vim-matchup' },
        config = C.treesitter
    },

    {
        'neovim/nvim-lspconfig',
        lazy = true,
        event = C.mason_lazy,
        -- don't call setup because of mason
    },

    {
        'williamboman/mason.nvim',
        lazy = true,
        event = C.mason_lazy,
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = C.mason
    },

    {
        'simrat39/rust-tools.nvim',
        lazy = true,
        dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
        config = C.rust_tools
    },

    {
        'glepnir/lspsaga.nvim',
        lazy = true,
        event = C.mason_lazy,
        config = C.lspsaga
    },

    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = C.mason_lazy,
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
        },
        config = C.cmp,
    },

    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        keys = C.telescope_keys(),
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'francoiscabrol/ranger.vim',
        priority = 999,
        dependencies = { 'rbgrouleff/bclose.vim' },
        config = C.ranger,
    },

    {
        'numToStr/Comment.nvim',
        lazy = true,
        event = C.mason_lazy,
        config = true
    },

    {
        'lewis6991/gitsigns.nvim',
        config = true,
    },

    {
        'alvarosevilla95/luatab.nvim',
        lazy = true,
        keys = {
            { '<leader>e', ':RangerNewTab<CR>', desc = "Ranger new tab" }
        },
        config = C.luatab
    },

    {
        'folke/noice.nvim',
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = C.noice
    },

    {
        'folke/neodev.nvim',
        lazy = true,
        event = 'BufReadPre *.lua',
        config = true
    },

    'folke/lsp-colors.nvim',
    'tpope/vim-fugitive',

},
    {
        install = {
            colorscheme = { 'nightfox' }
        }
    })
