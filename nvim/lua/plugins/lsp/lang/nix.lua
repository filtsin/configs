return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = { ensure_installed = { 'nix' } },
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason-org/mason-lspconfig.nvim',
            opts = { ensure_installed = { 'nil_ls' } },
        },
        opts = {
            servers = {
                nil_ls = {

                }
            }
        }
    }

}
