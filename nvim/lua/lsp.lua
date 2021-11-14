-- nvim-lsp-installer settings

local lsp_installer = require 'nvim-lsp-installer'

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "sumneko_lua" then
        -- only apply these settings for the "sumneko_lua" server
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the 'vim', 'use' global
                    globals = {'vim', 'use'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end

    if server.name == 'rust_analyzer' then
        opts.settings = {
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

                end,
                cmd = server._default_options.cmd,
                settings = opts.settings,
            }
        }
        return
    end

    server:setup(opts)
end)

vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler

-- nvim-cmp settings
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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

