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
        -- {
        --     'EdenEast/nightfox.nvim',
        --     priority = 1000,
        --     config = C.nightfox
        -- },
        --
        -- {
        --     'nvim-lualine/lualine.nvim',
        --     dependencies = { 'nvim-tree/nvim-web-devicons' },
        --     config = C.lualine
        -- },
        --
        -- {
        --     'nvim-treesitter/nvim-treesitter',
        --     config = C.treesitter
        -- },

        -- {
        --     'williamboman/mason.nvim',
        --     version = "^1.0.0",
        --     lazy = true,
        --     event = mason_lazy,
        --     dependencies = {
        --         'williamboman/mason-lspconfig.nvim',
        --         'neovim/nvim-lspconfig',
        --         'ray-x/lsp_signature.nvim'
        --     },
        --     config = C.mason
        -- },

        -- {
        --         'williamboman/mason-lspconfig.nvim',
        --         version = "^1.0.0",
        --         lazy = true
        -- },
        --
        -- {
        --     'MysticalDevil/inlay-hints.nvim',
        --     lazy = true,
        --     event = "LspAttach",
        --     config = true,
        -- },

        {
            'mrcjkb/rustaceanvim',
            lazy = false, -- already lazy
            version = '^4',
        },

        {
            'saecki/crates.nvim',
            lazy = true,
            event = 'BufRead Cargo.toml',
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = C.crates,
        },

        -- {
        --     'glepnir/lspsaga.nvim',
        --     lazy = true,
        --     event = mason_lazy,
        --     config = C.lspsaga
        -- },

        -- {
        --     'L3MON4D3/LuaSnip',
        --     lazy = true,
        --     tag = "v2.3.0",
        --     build = "make install_jsregexp",
        --     config = C.luasnip
        -- },
        --
        -- {
        --     'hrsh7th/nvim-cmp',
        --     lazy = true,
        --     event = 'InsertEnter',
        --     dependencies = {
        --         'saadparwaiz1/cmp_luasnip',
        --         'hrsh7th/cmp-buffer',
        --         'hrsh7th/cmp-path',
        --         'hrsh7th/cmp-nvim-lsp',
        --         'onsails/lspkind-nvim',
        --     },
        --     config = C.cmp,
        -- },
        --
        --
        -- {
        --     'nvim-telescope/telescope.nvim',
        --     lazy = true,
        --     keys = C.telescope_keys(),
        --     dependencies = { 'nvim-lua/plenary.nvim' },
        -- },

        -- {
        --     'stevearc/oil.nvim',
        --     priority = 999,
        --     config = C.oil,
        -- },

        -- {
        --     'numToStr/Comment.nvim',
        --     lazy = true,
        --     event = mason_lazy,
        --     config = true
        -- },

        -- {
        --     'lewis6991/gitsigns.nvim',
        --     cond = is_git_folder,
        --     config = true,
        -- },

        -- {
        --     'tpope/vim-fugitive',
        --     cond = is_git_folder,
        -- },

        -- {
        --     'alvarosevilla95/luatab.nvim',
        --     lazy = true,
        --     config = C.luatab
        -- },

        -- {
        --     'folke/noice.nvim',
        --     dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        --     config = C.noice
        -- },

        {
            'folke/neodev.nvim',
            lazy = true,
            event = 'BufReadPre *.lua',
            config = true
        },

        -- {
        --     'folke/flash.nvim',
        --     event = 'VeryLazy',
        --     config = C.flash
        -- },
        --
        -- {
        --     'nvim-pack/nvim-spectre',
        --     config = true
        -- },

        -- {
        --     'danymat/neogen',
        --     config = true,
        --     keys = {
        --         { '<leader>ng', '<cmd>:Neogen<cr>', 'Generate documentation' }
        --     }
        -- },
        --
        -- {
        --     'bassamsdata/namu.nvim',
        --     config = true,
        -- },

        -- {
        --     'WTFox/jellybeans.nvim',
        --     priority = 1000,
        --     config = C.jellybeans
        -- },

    },
    {
        install = {
            colorscheme = { 'jellybeans' }
        }
    })
