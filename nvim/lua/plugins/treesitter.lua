return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
        build = ':TSUpdate',
        lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
        event = { 'VeryLazy' },
        opts = {
            ensure_installed = {
                'regex',
                'vim',
                'bash',
                'markdown',
                'markdown_inline'
            },
            highlight = {
                enable = true
            },
            autotag = {
                enable = true
            },
            matchup = {
                enable = true
            }
        },
        opts_extend = { 'ensure_installed' },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    }
}
