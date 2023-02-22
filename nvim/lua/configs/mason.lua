local mason_servers = {
    'lua_ls',
    'rust_analyzer',
    'clangd'
}

local mason_ext = {
    '*.rs',
    '*.cpp',
    '*.c',
    '*.h',
    '*.hpp',
    '*.lua',
}

local setup_lua_ls = function()
    require('lspconfig').lua_ls.setup {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT'
                },
                diagnostics = {
                    -- Get the language server to recognize the 'vim', 'use' global
                    globals = { 'vim', 'use' },
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    }
end

local setup_rust_analyzer = function()
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

    require('lspconfig').rust_analyzer.setup({
        settings = rust_settings
    })

    require('rust-tools').setup {
        tools = {
            inlay_hints = {
                parameter_hints_prefix = '🠔  ',
                other_hints_prefix = '⇨  '
            }
        },
        server = {
            on_attach = function(_, _)
                vim.keymap.set('n', '<leader>sm', function() require('rust-tools.expand_macro').expand_macro() end)
                vim.keymap.set('n', '<leader>pr', function() require('rust-tools.parent_module').parent_module() end)
            end,
            settings = rust_settings,
        }
    }
end

local setup_clangd = function()
    require('lspconfig').clangd.setup {}
    vim.keymap.set('n', '<space>t', ':ClangdSwitchSourceHeader<CR>')
end

local setup = function()
    require('lspconfig')
    require('lsp_signature').setup{}
    require('mason').setup {}
    local mason = require('mason-lspconfig')

    mason.setup {
        ensure_installed = mason_servers
    }

    mason.setup_handlers {
        function(server_name)
            require('lspconfig')[server_name].setup {}
        end,

        ['lua_ls'] = setup_lua_ls,
        ['rust_analyzer'] = setup_rust_analyzer,
        ['clangd'] = setup_clangd,
    }

    vim.keymap.set('n', '<leader>z', vim.lsp.buf.format)
end

local lazy_load = function()
    local result = {}

    for i = 1, #mason_ext do
        result[i] = 'BufReadPre ' .. mason_ext[i]
    end

    return result
end

local M = {
    setup = setup,
    lazy_load = lazy_load
}

return M
