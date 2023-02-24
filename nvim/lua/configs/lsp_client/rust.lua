local setup = function()
    local settings = {
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
        },

        settings = settings
    }
end

local ft = {
    '*.rs'
}

local M = {
    ft = ft,
    setup = setup,
}

return M
