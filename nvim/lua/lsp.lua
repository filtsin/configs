-- nvim-lsp-installer settings

require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

require('mason').setup{}
local lsp_config = require('lspconfig')

require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'clangd',
    }
})


require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup{}
    end,

    ['lua_ls'] = function()
        -- only apply these settings for the "sumneko_lua" server
        lsp_config.lua_ls.setup{
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        -- Get the language server to recognize the 'vim', 'use' global
                        globals = {'vim', 'use'},
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            }
        }
    end,

    ['rust_analyzer'] = function()
        local rust_settings = {
            ['rust-analyzer'] = {
                assist = {
                    importGranularity = 'module',
                    importPrefix = 'by_self'
                },
                checkOnSave = {
                    command = 'clippy'
                },
                cargo = {
                    allFeatures = true,
                },
                rustfmt = {
                    extraArgs = { "+nightly" }
                },
            }
        }

        lsp_config.rust_analyzer.setup({
            settings = rust_settings
        })

        require('rust-tools').setup{
            tools = {
                inlay_hints = {
                    parameter_hints_prefix = '🠔  ',
                    other_hints_prefix = '⇨  '
                }
            },
            server = {
                on_attach = function(_, bufnr)
                    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                    local default_opts = { noremap = true, silent = true }
                    buf_set_keymap('n', '<leader>sm', '<cmd>lua require("rust-tools.expand_macro").expand_macro()<CR>', default_opts)
                    buf_set_keymap('n', '<leader>pr', '<cmd>lua require("rust-tools.parent_module").parent_module()<CR>', default_opts)
                    -- require('lsp_signature').on_attach() turned on in noice by default

                end,
                settings = rust_settings,
            }
        }
    end
})


-- nvim-cmp settings
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.o.completeopt = 'menuone,noselect'


local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
	sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' }
	},
    mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<CR>'] = cmp.mapping.confirm(),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-e>'] = cmp.mapping.close()
    },
    formatting = {
        format = require('lspkind').cmp_format({with_text = true, menu = ({
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            luasnip = '[LuaSnip]',
            path = '[Path]',
        })}),
    },
    experimental = {
        ghost_text = true
    }
}

