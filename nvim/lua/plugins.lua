local C = require('configs')

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

local is_git_folder = os.execute('git rev-parse --is-inside-work-tree') == 0
local mason_lazy = C.mason_lazy()

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
        'williamboman/mason.nvim',
        lazy = true,
        event = mason_lazy,
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'ray-x/lsp_signature.nvim'
        },
        config = C.mason
    },

    {
        'simrat39/rust-tools.nvim',
        lazy = true,
        dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
        config = C.rust_tools
    },

    {
        'saecki/crates.nvim',
        lazy = true,
        event = 'BufRead Cargo.toml',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = C.crates,
    },

    {
        'glepnir/lspsaga.nvim',
        lazy = true,
        event = mason_lazy,
        config = C.lspsaga
    },

    {
        'L3MON4D3/LuaSnip',
        lazy = true,
        build = "make install_jsregexp",
        config = C.luasnip
    },

    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = 'InsertEnter',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
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
        event = mason_lazy,
        config = true
    },

    {
        'lewis6991/gitsigns.nvim',
        cond = is_git_folder,
        config = true,
    },

    {
        'tpope/vim-fugitive',
        cond = is_git_folder,
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
},
    {
        install = {
            colorscheme = { 'nightfox' }
        }
    })
