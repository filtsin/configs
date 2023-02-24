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
